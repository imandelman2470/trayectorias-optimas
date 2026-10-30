# PROMPT 4 — Existencia en espacio funcional, convergencia y optimize-then-discretize

> Modelo sugerido: Opus, esfuerzo máximo.
> Conviene tener la Fase 1 terminada (usa sus experimentos). Puede empezar en paralelo.

---

## Rol

Actuá como matemático especialista en cálculo de variaciones, análisis funcional y control óptimo. Rigor total.

## Contexto

1. Leé `00_CONTEXTO.md`, en especial las secciones 3.3 y 4.
2. Leé `planteo_problema.tex` completo. Foco: capítulos 1, 3 y 5.
3. Si existe, leé `v2\REPORTE_FASE1.md`, tarea T5.5 (caso límite).

Trabajá en `v2\teoria\`. Escribí en LaTeX.

Para experimentos numéricos en MATLAB, usá el servidor de cola. Leé `v2\SERVIDOR_COLA_MATLAB.md`. Prefijo de tanda: `t01_...`.

## Objetivo

1. Probar existencia de solución del problema continuo.
2. Probar convergencia de las soluciones discretas a una solución continua.
3. Derivar condiciones de optimalidad en espacio funcional.
4. Diseñar un esquema "optimize-then-discretize".

## Tareas

### T1. Reparar la prueba discreta

1. Analizá la prueba de existencia del problema discretizado.
2. Confirmá o descartá cada hueco listado en el contexto (3.3.3).
3. Si hay huecos reales, proponé hipótesis mínimas y una prueba corregida.

### T2. Formular con precisión el problema continuo

1. Definí la pista como conjunto compacto P entre dos curvas de Jordan. Fijá la regularidad de los bordes.
2. Agregá la restricción de número de vueltas = 1 alrededor de un punto interior.
3. Escribí dos versiones:
   - (V1) La de la tesis, en H² × L² × R × R.
   - (V2) Control óptimo en tiempo: x'' = u, u ∈ E(x'), x(t) ∈ P, condiciones periódicas, tiempo final libre. E(x') es la elipse de fricción orientada según x'. En x' = 0 usá la envolvente convexa semicontinua superior.
4. Discutí la relación entre V1 y V2 cuando v > 0.

### T3. Test de la hipótesis de degeneración

Hipótesis: v puede anularse con ∫ 1/v finita; la curvatura explota; se pierde H².

1. Construí un ejemplo explícito donde el ínfimo de V1 no se alcance en H², o probá que sí se alcanza.
2. Alternativa: probá una cota a priori v ≥ v_min > 0 para minimizantes. Usá ancho positivo y regularidad de bordes. Idea posible: argumento de comparación que reemplaza una esquina por un arco de radio compatible con el ancho.
3. Usá los datos numéricos de la Fase 1 (T5.5) como evidencia. Declarala como evidencia, no como prueba.

### T4. Existencia

Ruta principal (V2):

1. Probá existencia de una trayectoria admisible (construcción explícita).
2. Aplicá un teorema de existencia tipo Filippov–Cesari. Verificá cada hipótesis: convexidad y compacidad de E, semicontinuidad superior, restricción de estado cerrada, cota del tiempo final.
3. Mostrá que el número de vueltas se preserva bajo convergencia uniforme.
4. Concluí existencia con x ∈ W^{2,∞}.

Ruta alternativa (V1 o variante):

1. Método directo con compacidad débil / débil-*.
2. Considerá espacios más grandes: W^{2,1}, tangente en BV (curvatura como medida).
3. Para la elipse de fricción usá semicontinuidad inferior de funcionales integrales convexos en la variable débil (tipo Ioffe).
4. Explicá qué espacio es el natural y por qué H² falla (si falla).

### T5. Convergencia de las discretizaciones

1. Probá Γ-convergencia de los problemas discretos (Galerkin de Fourier + colocación) al problema continuo.
   - Desigualdad liminf.
   - Sucesión de recuperación.
   - Equicoercitividad.
2. Tratá el problema de restricciones impuestas solo en nodos. Opciones: ajuste de restricciones ε_n → 0, malla de verificación, restricciones semi-infinitas.
3. Consecuencia: puntos de acumulación de minimizantes discretos son minimizantes continuos; t_f^n → t_f*.
4. Si podés, estimá tasas de convergencia.

### T6. Condiciones de optimalidad

1. Verificá una condición de calificación en la formulación elegida (Robinson o equivalente). Si no vale, explicá por qué.
2. Derivá condiciones necesarias: principio del máximo con restricciones de estado o KKT en espacios de Banach.
3. Caracterizá la estructura de la solución: arcos sobre el borde de fricción, arcos sobre el borde de pista, arcos interiores.
4. Contrastá con resultados conocidos para camino fijo (Velenis–Tsiotras).

### T7. Optimize-then-discretize

1. Diseñá un algoritmo basado en las condiciones de T6. Opciones: SQP en espacio funcional con independencia de malla, disparo múltiple indirecto inicializado con la solución directa.
2. Discutí ventajas y riesgos frente a discretize-then-optimize.
3. Proponé un experimento numérico para verificar independencia de malla.

## Entregables

- `v2\teoria\teoria.tex`: enunciados y demostraciones completas.
- Cada resultado marcado como: DEMOSTRADO, DEMOSTRADO BAJO HIPÓTESIS (listarlas), CONJETURA, o HUECO.
- `v2\teoria\bibliografia.bib` con referencias verificadas.
- `v2\REPORTE_FASE4.md`: resumen, estado de cada resultado, próximos pasos.
- Hallazgos de modelado en `v2\PENDIENTES_MODELO.md`.
- Guardá `REPORTE_FASE4.md` en el Project.

## Referencias guía

Verificá cada una antes de citarla. Si no la podés verificar, no la cites.

- Cesari (1983), *Optimization — Theory and Applications*.
- Vinter (2000), *Optimal Control*.
- Clarke (2013), *Functional Analysis, Calculus of Variations and Optimal Control*.
- Hartl, Sethi y Vickson (1995), SIAM Review, principios del máximo con restricciones de estado.
- Ioffe (1977), SIAM J. Control Optim., semicontinuidad inferior de funcionales integrales.
- Braides (2002), *Γ-convergence for Beginners*.
- Hager (2000), Numer. Math., Runge–Kutta en control óptimo.
- Bonnans y Shapiro (2000), *Perturbation Analysis of Optimization Problems*.
- Velenis y Tsiotras (2008), JOTA.

## Reglas

- Rigor completo. Nada de "es fácil ver".
- Si una afirmación no está probada, marcala.
- Si no sabés algo, decilo.
- No inventes referencias ni resultados.
- Frenate después de cada teorema principal (T3, T4, T5, T6). Presentame el resultado. Esperá mi revisión.
- Escribí en español técnico controlado. Frases cortas.

## Cierre: evaluación de publicabilidad

Al terminar, redactá `v2\PUBLICABILIDAD.md`:

1. Revisión de literatura reciente (buscá en arXiv y bases académicas).
2. Qué aporte es nuevo y qué ya existe.
3. Revistas candidatas por nivel (nacional, internacional media, internacional alta), con motivo.
4. Qué falta para cada nivel.
5. Esquema de un artículo (secciones y figuras).
