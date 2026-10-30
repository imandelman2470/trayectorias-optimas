function [ok, msg] = ejecutar_job(jobfile, outfile, raiz)
%EJECUTAR_JOB Corre un script de trabajo en workspace limpio y captura todo.
%
%   Es una FUNCION a proposito: el script corre dentro del workspace de esta
%   funcion, asi que las variables de un trabajo no se filtran al siguiente
%   ni al del servidor. Cada trabajo arranca de cero.
%
%   El trabajo se copia a la raiz del proyecto y se ejecuta desde ahi, para
%   que 'pwd' sea siempre la carpeta del proyecto y las rutas relativas de
%   los scripts (load 'GSJ_gmsh_20_1000', etc.) funcionen sin cambios.
%
%   ok  : true si el script termino sin error
%   msg : reporte del error (vacio si ok)

ok  = true;
msg = '';

TMP     = 'job_en_curso';
tmpfile = fullfile(raiz, [TMP '.m']);

% ---- marcador "hay un trabajo corriendo" -------------------------------
% El heartbeat _alive.txt del servidor SOLO se actualiza entre trabajos: el
% loop del servidor esta bloqueado adentro de esta funcion mientras el job
% corre. Con un job de ~110 min, desde afuera _alive.txt parece muerto todo
% ese rato y no hay forma de distinguir "avanzando" de "colgado".
%
% Este archivo arregla eso sin necesidad de concurrencia: se escribe ANTES de
% arrancar y se borra al terminar, asi que su sola existencia dice que hay
% algo corriendo, y su contenido dice que y desde cuando.
encurso = fullfile(fileparts(jobfile), '_encurso.txt');
fe = fopen(encurso, 'w');
if fe > 0
    fprintf(fe, 'EJECUTANDO\njob    %s\ninicio %s\npid    %d\n', ...
            jobfile, datestr(now,'yyyy-mm-dd HH:MM:SS'), feature('getpid'));
    fclose(fe);
end

% Reiniciar el archivo de progreso. Lo escriben correr_modelo/calc_mef3_v4
% cada N pasos, abriendo-escribiendo-CERRANDO para forzar el volcado.
%
% Hace falta porque el diary de MATLAB NO vuelca hasta 'diary off': los
% .out.txt de la tanda nocturna tienen la misma marca de tiempo que su .done.
% O sea que durante ~110 min la salida del trabajo es invisible desde afuera.
fprog = fopen(fullfile(fileparts(jobfile), '_progreso.txt'), 'w');
if fprog > 0
    fprintf(fprog, '=== %s  inicio %s ===\n', jobfile, datestr(now,'yyyy-mm-dd HH:MM:SS'));
    fclose(fprog);
end

copyfile(jobfile, tmpfile, 'f');
rehash;

if exist(outfile, 'file'), delete(outfile); end
diary(outfile);
diary on;

fprintf('----------------------------------------------------------\n');
fprintf(' JOB : %s\n', jobfile);
fprintf(' INI : %s\n', datestr(now,'yyyy-mm-dd HH:MM:SS'));
fprintf(' PWD : %s\n', raiz);
fprintf('----------------------------------------------------------\n\n');

previo = pwd;
try
    cd(raiz);
    correr_aislado(TMP);           % ejecuta el script en un workspace APARTE
catch ME
    ok = false;
    try
        msg = getReport(ME, 'extended', 'hyperlinks', 'off');
    catch
        msg = sprintf('%s: %s', ME.identifier, ME.message);
    end
    fprintf('\n*** ERROR ***\n%s\n', msg);
end
cd(previo);

if ok, est = 'OK'; else, est = 'ERROR'; end
fprintf('\n----------------------------------------------------------\n');
fprintf(' FIN : %s   (%s)\n', datestr(now,'yyyy-mm-dd HH:MM:SS'), est);
fprintf('----------------------------------------------------------\n');

diary off;

if exist(tmpfile, 'file'), delete(tmpfile); end
if exist(encurso, 'file'), delete(encurso); end
end

% ------------------------------------------------------------------------
function correr_aislado(TMP)
%CORRER_AISLADO Ejecuta el script del trabajo en un workspace propio.
%
%   Antes el eval() corria directamente en el workspace de ejecutar_job. Eso
%   funcionaba, pero dejaba una trampa: si un .job.m hacia 'clear' o
%   'clearvars', le borraba a ejecutar_job sus variables locales (ok, raiz,
%   previo, tmpfile, encurso). El error no aparecia durante el trabajo sino
%   DESPUES, en el cd(previo) de la linea siguiente -- que esta fuera del
%   try/catch -- y se llevaba puesto al servidor entero.
%
%   Con esta funcion intermedia, lo que el trabajo borre se queda aca.
eval(TMP);
end
