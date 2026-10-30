@echo off
REM Arranca el servidor de trabajos MATLAB para el proyecto de trayectorias.
REM Dejar esta ventana abierta. Para pararlo: Ctrl+C, cerrar la ventana,
REM o crear un archivo vacio llamado STOP dentro de _cola\
cd /d "D:\ESCRI\trabajofinal\v2\matlab"
"C:\Program Files\MATLAB\R2019a\bin\matlab.exe" -batch "servidor_claude"
echo.
echo Servidor detenido.
pause
