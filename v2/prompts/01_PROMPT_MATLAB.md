# PROMPT 1 — Mejorar y eficientizar el código MATLAB

> Modelo sugerido: Opus, esfuerzo alto.
> Copiá desde "Rol" hasta el final.

---

## Rol

Actuá como especialista en optimización numérica y control óptimo. Dominás MATLAB, fmincon, CasADi e IPOPT.

## Contexto

1. Leé `00_CONTEXTO.md` completo.
2. Leé `planteo_problema.tex`: capítulos 1, 5 y 6.
3. Leé el código vigente: `principalB.m`, `fobj_fmincon.m`, `fres_fmincon.m`, `graficar.m`, `pista_*.m`.
4. Ignorá los archivos marcados como viejos o ajenos en el contexto.

Carpeta: `D:\ESCRI\trabajofinal`. No modifiques archivos originales. Trabajá en `v2\matlab\`.

## Entorno

- MATLAB **R2019a** con Optimization Toolbox. CasADi permitido (verificá compatibilidad con R2019a).
- Ejecutá MATLAB con el **servidor de cola**. Leé `v2\SERVIDOR_COLA_MATLAB.md` antes de empezar.
  - Carpeta: `v2\matlab\`. Cola: `v2\matlab\_cola\`.
  - Escribí `tarea.job.m`, después `tarea.ready`. Leé `tarea.done` y `tarea.out.txt`.
  - Nombres por tanda: `a01_...` (línea base), `b01_...` (refactor), `c01_...` (solvers), `d01_...` (formulación B), `e01_...` (validación).
  - Si `_alive.txt` no se actualiza, pedime que arranque `arrancar_servidor.bat`.
- Respetá las restricciones de R2019a listadas en ese documento.
- Podés usar Octave o Python/CasADi para chequeos cruzados. Declaralo siempre.

## Objetivo

Obtener un código MATLAB correcto, rápido, robusto y documentado. Compararlo con una formulación alternativa. Dejar todo listo para portarlo a Python.

## Tareas

### T1. Línea base

1. Ejecutá `principalB.m` con las cuatro pistas y los parámetros de la tesis.
2. Registrá por caso: tiempo de cómputo, iteraciones, exitflag, t_f, violación máxima de restricciones.
3. Medí la violación también en una malla fina (≥ 20n puntos). Incluí permanencia en pista y fricción.
4. Guardá resultados en `v2\matlab\resultados\baseline.csv` y figuras.

### T2. Refactorización fiel (Formulación A = tesis)

Mantené el mismo modelo matemático. Cambiá solo la implementación.

0. Primero corregí los errores C1, C2 y C3 del contexto (sección 3.2). Hacelo en tres pasos separados. Después de cada uno, corré las cuatro pistas y registrá el cambio en t_f, iteraciones y exitflag. Así se mide el efecto de cada error.
   - C1: reemplazá `G5 = Mintphi(:,end)'*a` por a₁ = 0.
   - C2: reemplazá `qSimp` por pesos 1/n.
   - C3: agregá la restricción v² ≥ ε en los nodos. Eliminá la rama "fuera de dominio".
   - Verificá que v(1) = v(0) en la solución.
1. Eliminá variables `global`. Usá un `struct` de parámetros y funciones anidadas o handles.
2. Reemplazá `diag(v)*M` por expansión implícita (`v.*M`).
3. Reemplazá Simpson por trapecio periódico (pesos 1/n). Justificá con un test de precisión.
4. Hacé periódicas las pistas: spline periódica (`csape(...,'periodic')`) o ajuste de Fourier.
5. Calculá derivadas del punto inicial en forma espectral.
6. Adimensionalizá: longitud por L (longitud de la línea media), velocidad por √(μ g L). Escalá variables y restricciones.
7. Verificá gradientes (`CheckGradients`) en los cuatro casos.
8. Corregí en un archivo aparte las erratas del texto (ver contexto, 3.3.1).

### T3. Solvers

Compará sobre la Formulación A:

- A1: `fmincon` `sqp` con BFGS (mejorado por T2).
- A2: `fmincon` `interior-point` con Hessiano exacto (analítico o vía CasADi).
- A3: CasADi + IPOPT con diferenciación automática.

Agregá continuación:

- En n: m = 8, 16, 32, 56, 100. Usá la solución gruesa como punto inicial de la fina.
- En μ: desde valores altos hacia valores físicos.

### T4. Formulación B (alternativa)

1. Implementá una formulación en coordenadas curvilíneas sobre la línea media.
   - Variable independiente: longitud de arco σ de la línea media.
   - Desplazamiento lateral w(σ) con cotas −w_izq(σ) ≤ w ≤ w_der(σ).
   - Partícula puntual con la misma elipse de fricción.
2. Derivá las ecuaciones en un documento `v2\matlab\formulacionB.md`. Mostrá cada paso.
3. Discretizá con colocación directa (trapecio o Hermite–Simpson). Explotá la dispersión.
4. Resolvé con CasADi + IPOPT.
5. Opcional, Formulación C: bi-nivel. Curva → perfil de velocidad por pasada adelante-atrás → optimización externa de la curva. Evaluá si corre solo con numpy/scipy en el futuro.
6. Referencias guía (verificá cada una antes de citarla):
   - Perantoni y Limebeer (2014), Vehicle System Dynamics.
   - Lot y Biral (2014), IFAC.
   - Velenis y Tsiotras (2008), JOTA.
   - Kapania, Subosits y Gerdes (2016), J. Dyn. Sys. Meas. Control.
   - Heilmeier et al. (2020), Vehicle System Dynamics.

### T5. Validación y comparación

1. Casos: circular, cuadrada, irregular 1, irregular 2.
2. Parámetros: los de la tesis y valores físicos (μ = 1.0, 1.5; μt = μn y μt ≠ μn).
3. Tabla comparativa A1/A2/A3/B(/C): t_f, tiempo de cómputo, iteraciones, violación en malla fina.
4. Estudio de convergencia en n: t_f(n), norma de la diferencia entre soluciones sucesivas. Estimá el orden.
5. Caso límite para la teoría: pista cuadrada angosta y μt ≠ μn. Registrá min v(s) y max curvatura. Informá si v tiende a cero al refinar.

### T6. Paquete para la Fase 2

1. `v2\matlab\ECUACIONES.md`: ecuaciones exactas implementadas en cada formulación, con escalado.
2. `v2\matlab\golden\*.json`: pista, parámetros, solución de referencia y t_f. Sirven como test del port a Python.
3. `v2\matlab\README.md`: uso, requisitos, ejemplos.

## Entregables

- Código en `v2\matlab\`.
- `v2\REPORTE_FASE1.md` con:
  - Resumen de resultados (tabla T5).
  - Formulación recomendada y motivo.
  - Fallas conocidas.
  - Resultados del caso límite (T5.5).
  - Recomendaciones para la Fase 2.
- Agregá hallazgos de modelado en `v2\PENDIENTES_MODELO.md`, sección "Registro de hallazgos".
- Guardá `REPORTE_FASE1.md` en el Project.

## Reglas

- Escribí en español técnico controlado. Frases cortas. Una idea por oración.
- Si no sabés algo, decilo.
- No inventes referencias. Verificá cada cita.
- Antes de cambiar el modelo de la tesis, pedime confirmación.
- Mostrame un plan breve antes de empezar. Esperá mi aprobación.
- Reportá avance al terminar cada tarea T1–T6.
