# PROMPT 2 — Implementación en Python

> Modelo sugerido: Opus, esfuerzo alto.
> Requisito: Fase 1 terminada (`v2\REPORTE_FASE1.md`).

---

## Rol

Actuá como ingeniero de software científico. Dominás Python, numpy, scipy, CasADi, empaquetado y testing.

## Contexto

1. Leé `00_CONTEXTO.md`.
2. Leé `v2\REPORTE_FASE1.md`, `v2\matlab\ECUACIONES.md` y `v2\matlab\README.md`.
3. Revisá `v2\matlab\golden\*.json`.
4. Leé `v2\PENDIENTES_MODELO.md`.

Trabajá en `v2\python\`.

Si necesitás correr MATLAB (p. ej. regenerar un golden o comparar un caso nuevo), usá el servidor de cola. Leé `v2\SERVIDOR_COLA_MATLAB.md`. Prefijo de tanda: `f01_...`.

## Objetivo

Crear una librería Python abierta que calcule la trayectoria óptima en un circuito cerrado. Debe reproducir los resultados de MATLAB. Debe servir de motor para una aplicación web (Fase 3).

## Tareas

### T1. Diseño

Proponé la arquitectura antes de programar. Esperá mi aprobación. Base sugerida:

```
trayopt/
  track.py        # carga, spline periódica, remuestreo, validación
  models/         # formulaciones A, B y (si aplica) C
  solvers/        # casadi_ipopt, scipy_ligero
  postprocess.py  # t(s), v(t), a_t, a_n, diagrama g-g, perfil vs distancia y tiempo
  plotting.py     # matplotlib y plotly
  io.py           # CSV, JSON, formato TUM (x, y, w_izq, w_der)
  cli.py
tests/
examples/
```

### T2. Pistas

1. Representación única: línea media periódica + anchos izquierdo y derecho.
2. Conversión desde bordes interno/externo (formato de la tesis).
3. Validaciones: curva cerrada, simple, sin autointersección de bordes, ancho positivo, orientación.
4. Remuestreo por longitud de arco.

### T3. Modelos y solvers

1. Portá la formulación recomendada en la Fase 1. Portá también la Formulación A (tesis) para comparar.
2. Solver principal: CasADi + IPOPT.
3. Solver ligero: solo numpy/scipy. Objetivo: que pueda correr en el navegador (Pyodide).
   - Evaluá la Formulación C (bi-nivel) para este fin.
   - Medí tiempo y calidad frente al solver principal.
4. Parámetros por defecto físicos. Unidades SI.
5. Continuación en n y punto inicial robusto.

### T4. Posproceso

1. Reparametrización temporal: t(s), x(t), v(t).
2. Aceleraciones tangencial y normal. Uso de la elipse de fricción (%).
3. Diagrama g-g.
4. Tiempo de vuelta y tiempos parciales por sector.
5. Verificación en malla fina de todas las restricciones.

### T5. Tests

1. pytest reproduce cada `golden\*.json` dentro de una tolerancia declarada.
2. Tests unitarios de geometría, cuadratura y derivadas.
3. Test de convergencia en n.
4. Cobertura mínima 80 %.

### T6. Rendimiento

1. Medí tiempo por pista y por n, para cada solver.
2. Informá cuál combinación sirve para uso interactivo (< 5 s) y cuál para precisión.
3. Informá si CasADi/IPOPT corre en Pyodide. Si no lo sabés, verificalo o decí que no lo sabés.

### T7. Empaquetado y documentación

1. `pyproject.toml`, licencia abierta (proponé MIT o BSD-3 y consultame).
2. README con ejemplo mínimo de 10 líneas.
3. Notebook de ejemplo con las cuatro pistas de la tesis.
4. CLI: `trayopt resolver pista.csv --mu 1.2 --salida resultado.json`.

## Entregables

- Librería en `v2\python\`.
- `v2\REPORTE_FASE2.md` con:
  - Comparación MATLAB vs Python (tabla).
  - Tabla de rendimiento (T6).
  - Recomendación de arquitectura para la web: navegador puro, servidor o híbrido. Con motivos.
  - API pública estable que usará la Fase 3.
- Hallazgos nuevos en `v2\PENDIENTES_MODELO.md`.
- Guardá `REPORTE_FASE2.md` en el Project.

## Reglas

- Escribí en español técnico controlado. Frases cortas.
- Código y nombres en español o inglés, pero consistentes. Consultame antes de elegir.
- Si no sabés algo, decilo.
- Mostrame un plan breve antes de empezar. Esperá mi aprobación.
- Reportá avance al terminar cada tarea.
