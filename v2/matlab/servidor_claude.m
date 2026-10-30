%% ========================================================================
%  servidor_claude.m  --  cola de trabajos MATLAB
%  ------------------------------------------------------------------------
%  Arrancalo UNA VEZ y dejalo abierto. Mira la subcarpeta _cola\ y ejecuta
%  los trabajos que aparezcan ahi, dejando la salida en un .txt.
%
%  COMO ARRANCARLO
%     cd /d "D:\ESCRI\Modelo isla\MEF\v3"
%     "C:\Program Files\MATLAB\R2019a\bin\matlab.exe" -batch "servidor_claude"
%
%  COMO PARARLO
%     - Ctrl+C en esa ventana, o cerrarla; o
%     - crear un archivo vacio llamado  STOP  dentro de _cola\
%     Se para solo despues de MAX_HORAS_OCIO horas SIN TRABAJOS (no por
%     tiempo total: un servidor que estuvo trabajando no se apaga).
%
%  PROTOCOLO (por si querés auditarlo)
%     tarea.job.m    <- el codigo a ejecutar
%     tarea.ready    <- señal de "ya termine de escribir el .job.m"
%                       El servidor IGNORA cualquier .job.m sin su .ready,
%                       asi nunca ejecuta un archivo a medio escribir.
%     tarea.out.txt  <- salida completa (diary)
%     tarea.done     <- estado final: OK o ERROR, y cuanto tardo
%     _alive.txt     <- latido, se reescribe en cada vuelta. ANTES de arrancar
%                       un trabajo dice cual y desde que hora, porque despues
%                       el loop queda bloqueado y no lo actualiza mas hasta
%                       que ese trabajo termine.
%     _encurso.txt   <- lo escribe ejecutar_job: existe SOLO mientras hay un
%                       trabajo corriendo. Es la forma barata de distinguir
%                       "avanzando" de "colgado" en un job de 110 min.
%     _servidor.log  <- historial
%     hechos\        <- los .job.m ya ejecutados se archivan aca
%
%  IMPORTANTE: mientras esto corre, cualquier .m que aparezca en _cola\ con
%  su .ready se ejecuta sin pedirte confirmacion. Pará el servidor cuando no
%  lo estes usando.
%% ========================================================================

RAIZ      = pwd;
COLA      = fullfile(RAIZ, '_cola');
HECHOS    = fullfile(COLA, 'hechos');
PAUSA_S   = 3;            % cada cuanto mira la carpeta

% ---- cortes de seguridad -----------------------------------------------
% ANTES habia un solo corte: MAX_HORAS desde que arranco el servidor. Eso
% esta mal pensado y ya mordio dos veces:
%   - con MAX_HORAS = 8 el servidor murio a los 480 min exactos, 18 min antes
%     de que se encolara la tanda nocturna;
%   - con MAX_HORAS = 24 el limite cayo en el medio de un barrido de 9 h.
%     (Zafo de casualidad: el chequeo esta arriba del while, asi que mientras
%     un trabajo corre no se evalua. Pero fue suerte, no diseno.)
%
% El problema es que cortaba por tiempo TOTAL. Un servidor que trabajo 23 h
% se apagaba igual que uno que no hizo nada. Lo que uno quiere cortar es la
% INACTIVIDAD: si nadie encola nada por medio dia, apagate.
MAX_HORAS_OCIO  = 12;     % apagarse si no llega ningun trabajo por N horas
MAX_HORAS_TOTAL = 168;    % red de seguridad absoluta (una semana)

if ~exist(COLA,  'dir'), mkdir(COLA);   end
if ~exist(HECHOS,'dir'), mkdir(HECHOS); end

logf = fullfile(COLA, '_servidor.log');
flog = fopen(logf, 'a');
fprintf(flog, '\n=== servidor arrancado %s  (MATLAB %s)\n', ...
        datestr(now,'yyyy-mm-dd HH:MM:SS'), version);
fclose(flog);

fprintf('==========================================================\n');
fprintf(' SERVIDOR DE TRABAJOS -- listo\n');
fprintf(' carpeta   : %s\n', COLA);
fprintf(' arrancado : %s\n', datestr(now,'yyyy-mm-dd HH:MM:SS'));
fprintf(' parar con : Ctrl+C, o creando el archivo STOP en _cola\\\n');
fprintf('==========================================================\n\n');

t_inicio = tic;
t_ultimo = tic;           % desde el ultimo trabajo (o desde el arranque)
vuelta   = 0;
n_hechos = 0;

while true

    % ---- corte por STOP o por tiempo -----------------------------------
    if exist(fullfile(COLA,'STOP'), 'file')
        fprintf('\n[%s] STOP encontrado. Saliendo.\n', datestr(now,'HH:MM:SS'));
        delete(fullfile(COLA,'STOP'));
        break
    end
    if toc(t_ultimo) > MAX_HORAS_OCIO*3600
        fprintf('\n[%s] %d horas sin trabajos. Saliendo.\n', ...
                datestr(now,'HH:MM:SS'), MAX_HORAS_OCIO);
        break
    end
    if toc(t_inicio) > MAX_HORAS_TOTAL*3600
        fprintf('\n[%s] Limite absoluto de %d horas alcanzado. Saliendo.\n', ...
                datestr(now,'HH:MM:SS'), MAX_HORAS_TOTAL);
        break
    end

    % ---- latido ---------------------------------------------------------
    vuelta = vuelta + 1;
    fa = fopen(fullfile(COLA,'_alive.txt'), 'w');
    if fa > 0
        fprintf(fa, ['vivo %s  vuelta %d  trabajos hechos %d  activo %.1f min  ' ...
                     'ocioso %.1f min (corta a los %d min)\n'], ...
                datestr(now,'yyyy-mm-dd HH:MM:SS'), vuelta, n_hechos, ...
                toc(t_inicio)/60, toc(t_ultimo)/60, MAX_HORAS_OCIO*60);
        fclose(fa);
    end

    % ---- buscar trabajos listos ----------------------------------------
    listos = dir(fullfile(COLA, '*.ready'));
    if isempty(listos)
        pause(PAUSA_S);
        continue
    end

    [~, orden] = sort({listos.name});
    listos = listos(orden);

    for q = 1:numel(listos)
        base = listos(q).name(1:end-6);              % saca '.ready'
        job  = fullfile(COLA, [base '.job.m']);
        outp = fullfile(COLA, [base '.out.txt']);
        donp = fullfile(COLA, [base '.done']);

        delete(fullfile(COLA, listos(q).name));      % consumir la señal

        if ~exist(job, 'file')
            fprintf('[%s] %s: hay .ready pero falta el .job.m -- salteo\n', ...
                    datestr(now,'HH:MM:SS'), base);
            continue
        end

        fprintf('[%s] >>> ejecutando %s\n', datestr(now,'HH:MM:SS'), base);

        % Dejar el latido en un estado informativo ANTES de bloquearse: el
        % loop no vuelve a pasar por aca hasta que el trabajo termine, asi
        % que si el trabajo dura 110 min, esto es lo unico que se ve desde
        % afuera. Complementa a _encurso.txt, que escribe ejecutar_job.
        fa = fopen(fullfile(COLA,'_alive.txt'), 'w');
        if fa > 0
            fprintf(fa, ['vivo %s  vuelta %d  trabajos hechos %d  activo %.1f min\n' ...
                         'EJECUTANDO %s desde %s  (el latido no se actualiza ' ...
                         'hasta que termine)\n'], ...
                    datestr(now,'yyyy-mm-dd HH:MM:SS'), vuelta, n_hechos, ...
                    toc(t_inicio)/60, base, datestr(now,'HH:MM:SS'));
            fclose(fa);
        end

        t0 = tic;
        [ok, msg] = ejecutar_job(job, outp, RAIZ);
        dt = toc(t0);
        n_hechos = n_hechos + 1;
        t_ultimo = tic;                % reiniciar el reloj de inactividad

        fd = fopen(donp, 'w');
        if ok
            fprintf(fd, 'OK\nsegundos %.2f\nfin %s\n', dt, datestr(now,'yyyy-mm-dd HH:MM:SS'));
            fprintf('[%s] <<< %s OK (%.1f s)\n', datestr(now,'HH:MM:SS'), base, dt);
        else
            fprintf(fd, 'ERROR\nsegundos %.2f\nfin %s\n%s\n', dt, ...
                    datestr(now,'yyyy-mm-dd HH:MM:SS'), msg);
            fprintf('[%s] <<< %s ERROR (%.1f s)\n', datestr(now,'HH:MM:SS'), base, dt);
        end
        fclose(fd);

        if ok, est = 'OK   '; else, est = 'ERROR'; end
        flog = fopen(logf, 'a');
        fprintf(flog, '%s  %-40s  %s  %.2f s\n', ...
                datestr(now,'yyyy-mm-dd HH:MM:SS'), base, est, dt);
        fclose(flog);

        % archivar el .job.m ejecutado
        try
            movefile(job, fullfile(HECHOS, [base '.job.m']), 'f');
        catch
        end
    end
end

fprintf('\nServidor detenido. Trabajos ejecutados: %d\n', n_hechos);
