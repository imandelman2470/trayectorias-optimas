# Trayectorias de tiempo óptimo en circuitos cerrados

Trabajo especial de Licenciatura en Matemática de Iván Mandelman (FaMAF–UNC, 2017).
Lo retomamos en 2026. Hay cinco objetivos:

1. Código MATLAB correcto y eficiente.
2. Librería Python.
3. Aplicación web pública: ingresar una pista y ver la trayectoria óptima.
4. Teoría en espacio funcional: existencia, Γ-convergencia, optimalidad, OTD.
5. Publicación.

## Por dónde empezar

| archivo | para qué |
|---|---|
| `v2/PLAN_DE_TRABAJO.md` | Plan paso a paso con casillas. **Empezar acá.** |
| `v2/ESTADO.md` | En qué paso estamos. Bitácora. |
| `v2/00_CONTEXTO.md` | Modelo, discretización, errores detectados, rutas teóricas. |
| `CLAUDE.md` | Reglas para Claude Code. |
| `v2/prompts/` | Un prompt por fase (01–05). |
| `v2/literatura/` | Estado del arte (Claude science, etapa 1) y bibliografía verificada. |
| `v2/PENDIENTES_MODELO.md` | Ideas para el mejor modelo posible. |
| `v2/REFERENCIAS_LOCALES.md` | Papers y libros que no están en git. |

## Estructura

```
planteo_problema.tex       texto de la tesis (versión vigente)
bibliografia.bib           bibliografía de la tesis
codigos/                   MATLAB original (vigente: principalB.m, fobj_fmincon.m,
                           fres_fmincon.m, graficar.m, pista_*.m; el resto es histórico)
graficos/, Imagenes/       figuras de la tesis
beamer/, beamer.tex        presentación de la defensa
v2/                        todo lo nuevo
  matlab/                  servidor de cola y código nuevo
  prompts/                 prompts por fase
  literatura/              estado del arte
```

Los archivos originales no se modifican. Todo lo nuevo va en `v2/`.

## Rutina con git

Al empezar cada sesión:

```powershell
cd D:\ESCRI\trabajofinal
git pull
```

Al terminar cada sesión:

```powershell
cd D:\ESCRI\trabajofinal
git add -A
git commit -m "sesión AAAA-MM-DD: <qué se hizo>"
git push
```
