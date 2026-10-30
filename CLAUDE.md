# Proyecto: trayectorias de tiempo óptimo en circuitos cerrados

Retomar el trabajo especial de Licenciatura en Matemática de Iván (FaMAF–UNC, 2017).
Objetivos: código MATLAB correcto y eficiente, librería Python, aplicación web pública, teoría en espacio funcional y publicación.

## Cómo trabajar con Iván

- Español técnico controlado. Frases cortas (máx. 15 palabras). Una idea por oración.
- Mismo término para el mismo concepto. Sin adjetivos ni conectores de relleno.
- Al inicio de cada respuesta, indicá si conviene cambiar de modelo o de esfuerzo.
- Paso a paso. El porqué antes del código.
- Código completo, listo para pegar.
- Si no sabés algo, decilo. No inventes referencias.
- Preguntá antes de avanzar cuando la decisión le corresponde a Iván.
- Mostrá un plan breve antes de cada fase. Esperá aprobación.

## Al empezar cada sesión

0. Ejecutá `git pull`. El repo de GitHub es la fuente común entre computadoras.
1. Leé `v2\ESTADO.md`. Dice en qué paso estamos.
2. Leé `v2\PLAN_DE_TRABAJO.md`. Dice qué hacer y cuándo cambiar de herramienta.
3. Leé `v2\00_CONTEXTO.md` si no lo tenés presente.
4. Abrí el prompt de la fase actual (`v2\prompts\0k_*.md`) y seguilo.

## Al terminar cada sesión

1. Actualizá `v2\ESTADO.md`: paso actual, próxima acción, bitácora (una línea).
2. Agregá hallazgos de modelado a `v2\PENDIENTES_MODELO.md`.
3. Marcá las casillas cumplidas en `v2\PLAN_DE_TRABAJO.md`.
4. Ejecutá `git add -A`, `git commit -m "sesión AAAA-MM-DD: <resumen>"` y `git push`.
5. No subas papers ni libros de terceros. Van en `v2\literatura\pdf\` (ignorada por git).

## Cuándo decirle a Iván que pase a Cowork

Decilo textual, en una línea destacada: **"PASÁ A COWORK: <motivo>. Llevá: <archivos>."**

- H1: al terminar F1 T2 (problema discreto corregido y medido).
- H2: al terminar F1 (`REPORTE_FASE1.md` listo).
- H3: al terminar F3 (`REPORTE_FASE3.md` listo).
- Cuando haga falta buscar o verificar literatura científica.
- Cuando surja una pregunta teórica que bloquee el código.

Después de avisar, actualizá `ESTADO.md` con herramienta = Cowork.

## Qué hace Cowork (no lo hagas acá salvo pedido)

- Teoría (F4) y publicabilidad (F5).
- Subir reportes al Project "Trayectorias optimas".
- Si un prompt dice "guardá en el Project" y no tenés acceso: ignoralo. El archivo queda en `v2\`. Cowork lo sube.

## Pedidos de Cowork a Code

- Revisá `v2\teoria\EXPERIMENTOS_PENDIENTES.md` al empezar. Si hay experimentos, ejecutalos con prefijo `t` y registrá resultados en ese archivo.

## Estructura

- `D:\ESCRI\trabajofinal\` : originales. **No modificar.**
  - `planteo_problema.tex` (texto), `codigos\` (MATLAB vigente: `principalB.m`, `fobj_fmincon.m`, `fres_fmincon.m`, `graficar.m`, `pista_*.m`).
- `v2\` : todo lo nuevo.
  - `matlab\`, `python\`, `web\`, `teoria\`, `prompts\`, `literatura\`.
  - `literatura\`: salidas de Claude science (prompt 05). Etapa 1 hecha el 2026-10-02.

## MATLAB: servidor de cola

- Leé `v2\SERVIDOR_COLA_MATLAB.md` antes de encolar.
- Carpeta: `v2\matlab\`. Cola: `v2\matlab\_cola\`.
- Escribí `tarea.job.m`, después `tarea.ready`. Leé `tarea.done` y `tarea.out.txt`.
- Si `_alive.txt` está viejo (> 1 min) y no existe `_encurso.txt`: pedile a Iván que arranque `v2\matlab\arrancar_servidor.bat`.
- MATLAB R2019a. No usar `arguments`, `tiledlayout`, `exportgraphics`.
- Guardá resultados parciales. Corré una versión corta antes de un trabajo largo.
- Prefijos: `a` línea base, `b` refactor, `c` solvers, `d` formulación B, `e` validación, `f` Python↔MATLAB, `t` teoría.

## Errores conocidos del código original (corregir en F1 T2.0)

- C1: `G5 = Mintphi(:,end)'*a` integra hasta 1 − 1/n. Correcto: a₁ = 0.
- C2: pesos de Simpson mal escalados. Correcto: trapecio, pesos 1/n.
- C3: falta v² ≥ ε en nodos. Eliminar la rama `f = 1e25`.
