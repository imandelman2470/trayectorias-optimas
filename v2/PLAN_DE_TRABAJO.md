# PLAN DE TRABAJO — Trayectorias óptimas

Hoja de ruta única. Dice qué hacer, con qué herramienta y cuándo cambiar.
El estado actual vive en `v2/ESTADO.md`. Cada sesión lo lee al empezar y lo actualiza al terminar.
Marcamos cada casilla al cumplirla: `[ ]` → `[x]`.

Versión 2 (2026-10-30). Suma el repo de GitHub, el prompt 05 (Claude science) y los hitos con el director.

---

## Las herramientas

| herramienta | para qué | dónde corre |
|---|---|---|
| Claude Code | código MATLAB, Python, web; git; cola MATLAB | notebook con Windows y MATLAB |
| Cowork | teoría, LaTeX, revisión de informes, Project | app de Claude (cualquier equipo) |
| Claude science | literatura, novedad, publicabilidad (prompt 05) | app de Claude, carpeta `trabajofinal` conectada |
| GitHub | copia común y versiones de todo | nube |

## Las fases

| fase | prompt | herramienta | informe |
|---|---|---|---|
| F1 MATLAB | `prompts/01_PROMPT_MATLAB.md` | Code | `REPORTE_FASE1.md` |
| F2 Python | `prompts/02_PROMPT_PYTHON.md` | Code | `REPORTE_FASE2.md` |
| F3 Web | `prompts/03_PROMPT_APP_WEB.md` | Code | `REPORTE_FASE3.md` |
| F4 Teoría | `prompts/04_PROMPT_TEORIA.md` | Cowork | `REPORTE_FASE4.md` |
| L Literatura | `prompts/05_PROMPT_CLAUDE_SCIENCE.md` | Claude science | `literatura/*.md` |
| F5 Publicación | cierre de F4 y L3 | Cowork | `PUBLICABILIDAD.md` |

## Mapa de pasos

```
P0 repo y entorno
 ├─ P1 revisar etapa L1 ──► P3 etapa L2 (novedad + esbozos) ──► H-dir1 reunión director
 └─ P2 F1 T1–T2 (MATLAB corregido) ──► P4 F4 T1 (prueba discreta)
                                         │
P5 F1 T3–T6 (solvers, formulación B) ◄───┘
 └─► P6 F4 T2–T3 (formulación, degeneración) ──► H-dir2 reunión director + colaborador
      ├─► P7 F2 Python      ∥  P7' F4 T4–T5 (existencia, Γ-convergencia)
      └─► P8 F3 Web         ∥  P8' F4 T6–T7 (optimalidad, OTD)
           └─► P9 etapa L3 (publicabilidad) ──► P10 F5 cierre y artículo
```

P1 y P2 corren en paralelo. P3 no depende del código.

---

## P0 — Repo y entorno

Herramienta: Cowork + Code. Objetivo: todo en GitHub y el entorno verificado.

- [x] 0.1 Armar el repo con la tesis, el código, `v2/` y este plan (Cowork, 2026-10-30).
- [x] 0.2 Subir el repo a GitHub (privado). Push desde la notebook (2026-10-30).
- [x] 0.3 Enlazar `D:\ESCRI\trabajofinal` con el repo (el push salió de esa carpeta).
- [ ] 0.4 Verificar `git status` limpio en la carpeta local.
- [ ] 0.5 Guardar papers y libros de terceros en `v2/literatura/pdf/` (ver `REFERENCIAS_LOCALES.md`).
- [ ] 0.6 Code: verificar MATLAB R2019a, Optimization Toolbox, Curve Fitting Toolbox.
- [ ] 0.7 Code: instalar o verificar CasADi para MATLAB R2019a.
- [ ] 0.8 Code: verificar Python, conda y CasADi para Python.
- [ ] 0.9 Code: arrancar `v2/matlab/arrancar_servidor.bat` y correr un trabajo de prueba.
- [ ] 0.10 Code: completar la sección "Entorno" de `ESTADO.md`. Commit y push.

Sale cuando: el repo está en GitHub, la carpeta local está sincronizada y la cola MATLAB responde.

---

## P1 — Revisar la etapa L1 (estado del arte)

Herramienta: lectura propia, después Cowork. No depende del código. Ideal para el viaje.

- [x] 1.1 Correr la etapa L1 en Claude science (2026-10-02). Salida: `literatura/ESTADO_DEL_ARTE.md`.
- [ ] 1.2 Leer el resumen ejecutivo (sección 1) y las secciones 11.4–11.6.
- [ ] 1.3 Leer N3 (teoría funcional) y N4 (análisis numérico). Son la base de CA–CE.
- [ ] 1.4 Leer las 10 referencias más cercanas (sección 11.5). Empezar por `massaro2021` y `tmai2014`.
- [ ] 1.5 Responder las 12 preguntas en `literatura/RESPUESTAS_ETAPA1.md`.
- [ ] 1.6 Conseguir los textos de Filippov (1962), Cesari (1983) y Clarke (2013).
- [ ] 1.7 Averiguar acceso a MathSciNet o zbMATH por la UNC, la UTN o la UNPSJB.
- [ ] 1.8 Registrar en `ESTADO.md`. Commit y push.

Sale cuando: `RESPUESTAS_ETAPA1.md` está completo.

---

## P2 — F1 T1–T2: MATLAB corregido

Herramienta: Code. Prompt: `01_PROMPT_MATLAB.md`. Prefijos de cola: `a`, `b`.

- [ ] 2.1 T1: línea base con las cuatro pistas. Salida: `matlab/resultados/baseline.csv`.
- [ ] 2.2 T1: violación de restricciones en malla fina (≥ 20n puntos).
- [ ] 2.3 T1: confirmar o descartar el cruce del borde en la horquilla de `irregular/trayectoria3`.
- [ ] 2.4 T2.0: corregir C1 (a₁ = 0). Correr las cuatro pistas. Registrar el cambio.
- [ ] 2.5 T2.0: corregir C2 (trapecio, pesos 1/n). Correr y registrar.
- [ ] 2.6 T2.0: corregir C3 (v² ≥ ε, sin rama `1e25`). Correr y registrar.
- [ ] 2.7 T2.1–T2.7: refactor (sin `global`, expansión implícita, pistas periódicas, escalado, gradientes).
- [ ] 2.8 T2.8: archivo de erratas del texto.
- [ ] 2.9 Commit y push.

Sale cuando: el problema discreto corregido corre en las cuatro pistas. Code avisa **"PASÁ A COWORK (H1)"**.

---

## P3 — Etapa L2: novedad y esbozos de prueba

Herramienta: Claude science. Prompt: `05_PROMPT_CLAUDE_SCIENCE.md`, bloque común + etapa 2.
Entrada: `ESTADO_DEL_ARTE.md` + `RESPUESTAS_ETAPA1.md`.

- [ ] 3.1 Abrir chat nuevo. Conectar la carpeta `trabajofinal`. Pegar bloque común + etapa 2.
- [ ] 3.2 Indicar que lea `literatura/RESPUESTAS_ETAPA1.md` antes de empezar.
- [ ] 3.3 Revisar la tabla de novedad (T2): veredicto por aporte CA–CG.
- [ ] 3.4 Revisar la tabla de dificultad (T4).
- [ ] 3.5 Revisar los esbozos de prueba (T4b). Marcar los que nos convencen.
- [ ] 3.6 Revisar extensión a cuerpo extendido (T5) y formulaciones alternativas (T6).
- [ ] 3.7 Decidir: ¿algún aporte "YA EXISTE"? Si sí, ajustar el foco de F4 antes de P4.
- [ ] 3.8 Subir `NOVEDAD_Y_COMPARACION.md` y `ESBOZOS_DE_PRUEBA.md` al Project. Commit y push.

Sale cuando: sabemos qué aportes son nuevos y cuál es el más prometedor.

### H-dir1 — Reunión con el director

- [ ] Llevar: resumen de L1, tabla de novedad, esbozos de CA y CB.
- [ ] Preguntar: qué aporte priorizar, nivel de revista, perfil del director para repartir tareas.
- [ ] Registrar acuerdos en `ESTADO.md`.

---

## P4 — F4 T1: reparar la prueba discreta

Herramienta: Cowork. Prompt: `04_PROMPT_TEORIA.md`, T1. Requiere P2.

- [ ] 4.1 Analizar la prueba de existencia discreta sobre el problema corregido.
- [ ] 4.2 Confirmar o descartar cada hueco (sección 3.3.3 de `00_CONTEXTO.md`).
- [ ] 4.3 Escribir hipótesis mínimas y prueba corregida en `teoria/teoria.tex`.
- [ ] 4.4 Revisión propia de la prueba.

Sale cuando: la prueba discreta está revisada y aprobada.

---

## P5 — F1 T3–T6: solvers, formulación B, validación

Herramienta: Code. Prefijos: `c`, `d`, `e`.

- [ ] 5.1 T3: comparar solvers (SQP, interior-point, IPOPT vía CasADi).
- [ ] 5.2 T4: formulación B en coordenadas curvilíneas. Ecuaciones en `matlab/formulacionB.md`.
- [ ] 5.3 T4: opcional, formulación C bi-nivel.
- [ ] 5.4 T5: tabla comparativa A/B(/C) con parámetros de la tesis y físicos.
- [ ] 5.5 T5: convergencia en n. Estimar orden.
- [ ] 5.6 T5.5: caso límite (pista cuadrada angosta, μt ≠ μn). Registrar min v y max curvatura.
- [ ] 5.7 T6: paquete para F2 (goldens JSON, `ECUACIONES.md`, `README.md`).
- [ ] 5.8 Revisar `REPORTE_FASE1.md`. Commit y push.

Sale cuando: `REPORTE_FASE1.md` aprobado. Code avisa **"PASÁ A COWORK (H2)"**.

---

## P6 — F4 T2–T3: formulación precisa y degeneración

Herramienta: Cowork. Usa los datos de T5.5.

- [ ] 6.1 Subir `REPORTE_FASE1.md` al Project.
- [ ] 6.2 T2: pista como compacto entre curvas de Jordan. Restricción de número de vueltas.
- [ ] 6.3 T2: escribir V1 (tesis) y V2 (control en tiempo, x'' = u ∈ E(x')).
- [ ] 6.4 T3: ejemplo de degeneración o cota v ≥ v_min. Usar T5.5 como evidencia.
- [ ] 6.5 Revisión propia de T3. Frenar y aprobar.

Sale cuando: T3 aprobado.

### H-dir2 — Reunión con el director y el colaborador

- [ ] Llevar: `REPORTE_FASE1.md`, T3, esbozos de CC y CE.
- [ ] Proponer al colaborador: CC (Γ-convergencia), CE (OTD) y la calificación de restricciones en CD.
- [ ] Acordar reparto, plazos y criterio de autoría.
- [ ] Registrar acuerdos en `ESTADO.md`.

---

## P7 — F2 Python ∥ F4 T4–T5

**P7 (Code)** — Prompt `02_PROMPT_PYTHON.md`.

- [ ] 7.1 T1 diseño de la librería. Aprobar.
- [ ] 7.2 T2 pistas: línea media + anchos, validaciones.
- [ ] 7.3 T3 modelos y solvers: CasADi + IPOPT y solver ligero numpy/scipy.
- [ ] 7.4 T4 posproceso: t(s), g-g, sectores, verificación en malla fina.
- [ ] 7.5 T5 tests: goldens, convergencia en n, cobertura ≥ 80 %.
- [ ] 7.6 T6 rendimiento. ¿Corre en Pyodide?
- [ ] 7.7 T7 empaquetado. Decidir licencia (MIT o BSD-3).
- [ ] 7.8 Revisar `REPORTE_FASE2.md`. Commit y push.

**P7' (Cowork, en paralelo)** — Prompt `04_PROMPT_TEORIA.md`.

- [ ] 7'.1 T4: existencia en V2 (Filippov–Cesari). Frenar y aprobar.
- [ ] 7'.2 T4: ruta alternativa débil (W^{2,1} o BV) si V2 falla.
- [ ] 7'.3 T5: Γ-convergencia (liminf, recuperación, equicoercitividad). Frenar y aprobar.
- [ ] 7'.4 Pedir experimentos a Code en `teoria/EXPERIMENTOS_PENDIENTES.md` si hace falta.

Sale cuando: `REPORTE_FASE2.md` aprobado y T4, T5 revisados.

---

## P8 — F3 Web ∥ F4 T6–T7

**P8 (Code)** — Prompt `03_PROMPT_APP_WEB.md`.

- [ ] 8.1 Fase 3.0: comparar arquitecturas. **Esperar decisión.**
- [ ] 8.2 Fase 3.1: ingreso de pista (dibujo, puntos, calcar, importar, biblioteca).
- [ ] 8.3 Fase 3.2: parámetros y cálculo en Web Worker.
- [ ] 8.4 Fase 3.3: resultados (trayectoria por velocidad, g-g, animación, exportar).
- [ ] 8.5 Fase 3.4: calidad (español e inglés, celular, accesibilidad, tests).
- [ ] 8.6 Aprobar antes de cualquier despliegue público.
- [ ] 8.7 Revisar `REPORTE_FASE3.md`. Code avisa **"PASÁ A COWORK (H3)"**.

**P8' (Cowork, en paralelo)**

- [ ] 8'.1 T6: calificación de restricciones y condiciones necesarias. Frenar y aprobar.
- [ ] 8'.2 T6: estructura de arcos. Contraste con Velenis–Tsiotras.
- [ ] 8'.3 T7: diseño OTD y experimento de independencia de malla.
- [ ] 8'.4 Escribir `REPORTE_FASE4.md`. Subir al Project.

Sale cuando: `REPORTE_FASE3.md` y `REPORTE_FASE4.md` aprobados.

---

## P9 — Etapa L3: publicabilidad

Herramienta: Claude science. Entrada: L1, L2, esbozos y `REPORTE_FASE4.md`.

- [ ] 9.1 Pegar bloque común + etapa 3. Agregar el perfil del director.
- [ ] 9.2 Revisar puntajes (T1) y escenarios A–D (T2).
- [ ] 9.3 Revisar revistas por nivel (T3) y brecha (T4).
- [ ] 9.4 Leer los tres revisores adversariales (T5). Anotar objeciones a resolver.
- [ ] 9.5 Revisar criterios de abandono y pivote (T6).
- [ ] 9.6 Subir `PUBLICABILIDAD.md` al Project. Commit y push.

---

## P10 — F5: cierre y artículo

Herramienta: Cowork, con director y colaborador.

- [ ] 10.1 Decidir escenario de artículo y revista objetivo.
- [ ] 10.2 Esquema del artículo: secciones, teoremas, figuras, tablas.
- [ ] 10.3 Consolidar `PENDIENTES_MODELO.md`. Decidir segunda vuelta de modelado (cuerpo extendido).
- [ ] 10.4 Preprint en arXiv (math.OC sugerida).
- [ ] 10.5 Envío.

---

## Puntos de cambio de herramienta

**Code → Cowork**

- H1: al terminar P2.
- H2: al terminar P5.
- H3: al terminar P8.
- Siempre que haga falta buscar o verificar literatura.

**Cowork → Code**

- Tanda de experimentos (más de 2 o 3 trabajos): Cowork los describe en `teoria/EXPERIMENTOS_PENDIENTES.md`. Code los ejecuta con prefijo `t`.
- Experimentos sueltos: Cowork puede encolarlos directo en `matlab/_cola/`.

**→ Claude science**

- P3 (etapa L2) y P9 (etapa L3). Siempre con la carpeta `trabajofinal` conectada.

## Revisión propia (obligatoria)

- Plan de cada fase antes de empezar.
- Cada `REPORTE_FASEk.md`.
- Cada teorema principal de F4 (T3, T4, T5, T6).
- Cada etapa de Claude science.
- Arquitectura web (Fase 3.0).
- Cualquier despliegue público.

## Durante el viaje

Llevamos la notebook con MATLAB. Todo el plan funciona igual. Agregamos:

- Al empezar: `git pull`. Al terminar: commit y push. Así nada queda solo en la notebook.
- Si la notebook no es la misma de siempre: clonar el repo (comando en `ESTADO.md`).
- Sin conexión: P1 (lectura y preguntas) y la revisión de informes se pueden hacer offline.
- Con conexión lenta: priorizar P1 y P3. Dejar P5 (corridas largas) para la vuelta.
