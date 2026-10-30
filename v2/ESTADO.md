# ESTADO — Trayectorias óptimas

Fuente única del estado actual. Leer al empezar cada sesión. Actualizar al terminar.

## Ahora

- Paso actual: **P0 (repo y entorno)** y **P1 (revisar etapa L1)** en paralelo.
- Herramienta: **Claude Code** para P0.6–P0.10. Lectura propia para P1.
- Próxima acción: sincronizar la carpeta local con GitHub (P0.3). Después, entorno en Code (P0.6).

## Hecho

- 2026-09-30 (Cowork): análisis de la tesis y el código. Ver `00_CONTEXTO.md`.
- 2026-09-30 (Cowork): prompts F1–F4, `PENDIENTES_MODELO.md`, `SERVIDOR_COLA_MATLAB.md`.
- 2026-09-30 (Cowork): verificación código ↔ tesis. Gradientes OK. Errores C1, C2, C3 detectados. Script: `verificacion_consistencia.py`.
- 2026-09-30 (Cowork): `PLAN_DE_TRABAJO.md`, `CLAUDE.md`, este archivo.
- 2026-10-02 (Cowork): prompt 05 para Claude science (tres etapas).
- 2026-10-02 (Claude science): etapa L1. Salida en `literatura/`. 127 referencias verificadas. CA–CD parecen huecos reales.
- 2026-10-30 (Cowork): repo de GitHub, plan v2 con pasos P0–P10, `RESPUESTAS_ETAPA1.md`, `REFERENCIAS_LOCALES.md`.

## Entorno (completar en P0)

- MATLAB: R2019a. Optimization Toolbox: ¿? Curve Fitting Toolbox: ¿?
- CasADi para MATLAB R2019a: ¿?
- Python / conda: ¿? CasADi para Python: ¿?
- Git: ¿versión? Repo: `https://github.com/imandelman2470/trayectorias-optimas` (privado).

## Sincronizar la carpeta local con GitHub (una sola vez)

En PowerShell, dentro de la carpeta existente:

```powershell
cd D:\ESCRI\trabajofinal
git init -b main
git config core.autocrlf false
git remote add origin https://github.com/imandelman2470/trayectorias-optimas.git
git fetch origin
git reset origin/main
git branch --set-upstream-to=origin/main main
git status
```

`git reset origin/main` no toca los archivos. Solo alinea el historial.
`git status` debe decir "nothing to commit". Si lista archivos, avisar en Code.

## Clonar en otra computadora

```powershell
cd D:\ESCRI
git clone https://github.com/imandelman2470/trayectorias-optimas.git trabajofinal
```

Después copiar los PDF de terceros a `v2\literatura\pdf\` (ver `REFERENCIAS_LOCALES.md`).

## Pendiente de decisión propia

- Responder las 12 preguntas de la etapa L1 (`literatura/RESPUESTAS_ETAPA1.md`).
- Perfil del director, para repartir tareas en H-dir1.

## Bitácora

Una línea por sesión: fecha · herramienta · qué se hizo · qué sigue.

- 2026-09-30 · Cowork · planificación completa · sigue paso 0 en Code.
- 2026-10-02 · Claude science · etapa L1 (estado del arte) · sigue revisar y responder preguntas.
- 2026-10-30 · Cowork · repo GitHub y plan v2 · sigue P0.3 (sincronizar) y P1.
