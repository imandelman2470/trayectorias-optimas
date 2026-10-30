# Servidor de cola MATLAB — cómo ejecutar código sin intervención

Origen: proyecto MEF (`D:\ESCRI\Modelo isla\MEF\v3`). Se usó con éxito desde agosto de 2026.
Copia adaptada para este proyecto: `D:\ESCRI\trabajofinal\v2\matlab\`.

## Qué resuelve

- Claude no puede ejecutar MATLAB directamente.
- El servidor es una sesión MATLAB que vigila una carpeta.
- Claude escribe un script en la cola. El servidor lo ejecuta y deja la salida en un `.txt`.
- Claude lee la salida. No hace falta copiar y pegar.

## Archivos

| archivo | función |
|---|---|
| `arrancar_servidor.bat` | Arranca MATLAB R2019a en modo `-batch` con `servidor_claude`. Dejar la ventana abierta. |
| `servidor_claude.m` | Bucle principal. Mira `_cola\` cada 3 s. |
| `ejecutar_job.m` | Ejecuta un trabajo en un workspace aislado. Captura la salida con `diary`. |

## Protocolo

| archivo en `_cola\` | quién lo escribe | significado |
|---|---|---|
| `tarea.job.m` | Claude | Código a ejecutar. |
| `tarea.ready` | Claude, **después** del `.job.m` | Señal de "terminé de escribir". Sin `.ready` no se ejecuta. |
| `tarea.out.txt` | servidor | Salida completa. Se vuelca recién al terminar. |
| `tarea.done` | servidor | `OK` o `ERROR`, segundos, fecha, y el error si lo hubo. |
| `_alive.txt` | servidor | Latido. Antes de un trabajo dice cuál y desde qué hora. |
| `_encurso.txt` | servidor | Existe solo mientras hay un trabajo corriendo. |
| `_progreso.txt` | el trabajo | Avance de trabajos largos (abrir-escribir-cerrar). |
| `_servidor.log` | servidor | Historial de trabajos. |
| `hechos\` | servidor | Archivo de los `.job.m` ya ejecutados. |
| `STOP` | usuario o Claude | Archivo vacío. Detiene el servidor. |

Orden de ejecución: alfabético por nombre. Directorio de trabajo: la raíz del proyecto (`pwd` del servidor).

Cortes automáticos: 12 h sin trabajos, o 168 h en total.

## Reglas para escribir trabajos

1. Nombres con prefijo de tanda y número: `a01_baseline`, `a02_refactor_circular`, `b01_ipopt`. Así el orden alfabético es el orden deseado.
2. Escribir primero el `.job.m`. Después crear el `.ready` vacío.
3. Prefijar las variables del trabajo con su nombre (`a01_t`, `a01_res`). Evita colisiones y facilita la depuración.
4. Guardar resultados en `.mat` o `.csv` con nombre del trabajo. No depender solo del `.out.txt`.
5. Trabajos largos: escribir avance en `_cola\_progreso.txt` (abrir, escribir, cerrar). El `diary` no se ve hasta el final.
6. Antes de un trabajo largo, correr una versión corta de humo (pocos casos, n chico).
7. Guardar resultados parciales dentro de bucles largos. Lección aprendida: `n12_barrido_cD_fino` corrió 7,4 h y falló al final por un índice en `polyfit`. Se perdió todo.
8. Un trabajo puede hacer `clear`. No afecta al servidor (workspace aislado).
9. Commits de git: pueden ir como trabajo (`z01_commit.job.m`), con mensaje descriptivo.

## Restricciones de entorno

- MATLAB **R2019a** (`C:\Program Files\MATLAB\R2019a\bin\matlab.exe`).
  - Disponible: expansión implícita, `optimoptions`, `CheckGradients`.
  - No disponible: bloques `arguments` (R2019b), `tiledlayout` (R2019b), `exportgraphics` (R2020a). Evitarlos.
  - `csape` requiere Curve Fitting Toolbox. Verificar si está instalado antes de usarlo. Alternativa: ajuste de Fourier propio.
  - CasADi: verificar compatibilidad del binario con R2019a antes de instalar.
- Las figuras en modo `-batch` no se muestran. Guardarlas con `print(...,'-dpng')` o `saveas`.

## Seguridad

- Mientras el servidor corre, cualquier `.job.m` con su `.ready` se ejecuta sin confirmación.
- Pararlo cuando no se use (Ctrl+C, cerrar la ventana o crear `STOP`).
- Claude no debe encolar trabajos que borren archivos fuera de `v2\` ni que usen la red sin avisar.

## Dos proyectos a la vez

- Cada proyecto tiene su propio `.bat` y su propia `_cola\`.
- Se pueden correr dos servidores en paralelo (dos instancias de MATLAB). Compiten por CPU y memoria. Preferible uno por vez para trabajos pesados.
