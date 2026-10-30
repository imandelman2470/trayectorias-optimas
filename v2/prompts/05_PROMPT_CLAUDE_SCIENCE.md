# PROMPT 5 — Claude science: estado del arte, novedad y publicabilidad

> Modelo sugerido: Opus, esfuerzo máximo.
> Tres etapas. Cada etapa es un chat nuevo. Revisás cada informe antes de seguir.

## Cómo usar

1. Abrí un chat nuevo en Claude science por etapa.
2. Pegá el **BLOQUE COMÚN** completo.
3. Pegá el texto de la etapa (ETAPA 1, 2 o 3).
4. Guardá el informe de salida como archivo.
5. En la etapa siguiente, pegá también el informe anterior.
6. Si Claude science no ve el Project, conectá una carpeta (ver abajo) o pegá `00_CONTEXTO.md`.

### Carpeta a conectar (solo lectura si es posible)

- Conectá `D:\ESCRI\trabajofinal` (carpeta de la tesis).
- Debe contener `planteo_problema.tex`, la bibliografía de la tesis y la subcarpeta `v2\`.
- Copiá a `v2\` los documentos del Project: `00_CONTEXTO.md`, `PLAN_DE_TRABAJO.md`, `PENDIENTES_MODELO.md`, `04_PROMPT_TEORIA.md`.
- No conectes `D:\ESCRI` completo. Hay material ajeno al trabajo.
- No hace falta conectar el código MATLAB para estas etapas. Es opcional.
- Pedí a Claude science que escriba sus informes en `v2\literatura\`.
- Si no puede escribir en la carpeta, pegá los informes a mano entre etapas.

---

# BLOQUE COMÚN (pegar siempre)

## Rol

Actuá como investigador en control óptimo, cálculo de variaciones y dinámica de vehículos.
Aplicá rigor total.
Evaluá de forma crítica. No adules.
Si no sabés algo, decilo.

## Trabajo a evaluar

Trabajo especial de Licenciatura en Matemática (FaMAF–UNC, 2017). Se retoma en 2026.
Problema: trayectoria de tiempo mínimo para una vuelta en un circuito cerrado.
Modelo: partícula de masa puntual con fricción limitada.

Incógnitas: x = (c, a, p, v0) ∈ H²[0,1]² × L²[0,1] × R₊ × R₊.

- c: curva de longitud 1, parametrizada por longitud de arco (|c'| = 1).
- p: longitud de la trayectoria. La trayectoria física es p·c(s).
- a: aceleración tangencial.
- v0: velocidad inicial.
- v(s)² = 2p ∫₀ˢ a + v0².

Problema (V1):

```
min  t_f = ∫₀¹ p / v(s) ds
s.a. |c'|² − 1 = 0
     c, c', c'' periódicas;  ∫₀¹ a = 0;  a(1) = a(0)
     a²/μt² + v⁴ |c''|² / (μn² p²) − g² ≤ 0        (elipse de fricción)
     |p c(s) − α(s)|² − κ(s)² ≤ 0                    (permanencia, borde interno α)
     |p c(s) − β(s)|² − κ(s)² ≤ 0                    (permanencia, borde externo β)
```

κ(s) = |β(s) − α(s)| es el ancho de pista.

Discretización (problema discreto):

- Base de Fourier, n = 2m + 1 funciones.
- Restricciones impuestas por colocación en n nodos.
- Solver: SQP con gradientes analíticos.

Resultado de la tesis: existencia de solución del **problema discreto**. No hay resultado de convergencia. No hay teoría en el espacio funcional.

## Problemas conocidos del trabajo original

- La pista usa el mismo parámetro s que la trayectoria. Eso acopla parámetros.
- La región admisible es una intersección de dos discos. No es la franja real.
- Las restricciones valen solo en los nodos.
- Falta la restricción de número de vueltas (índice de giro = 1).
- La prueba de existencia discreta tiene huecos: cota de curvatura con |c'| = 1 solo en nodos, "n grande" con n fijo, cota |ĉ| ≤ |β|, desigualdad isoperimétrica sin curva simple.
- Se asumen condiciones de calificación (Robinson) sin probarlas.
- Se detectaron tres errores de código (∫a = 0 mal impuesta, cuadratura, falta de v² > 0). Afectan el problema discreto, no el continuo.

## Hipótesis de degeneración (a evaluar, no a asumir)

- |a| ≤ μt·g implica que v² es Lipschitz.
- Entonces v puede anularse en un punto con ∫ 1/v finita.
- Donde v → 0, se pierde la cota |c''| ≤ g μn p / v².
- Una sucesión minimizante podría formar esquinas y perder regularidad H².
- Esto explicaría el fracaso de la formulación débil en H².

## Rutas teóricas que el autor quiere explorar

- (a) Cota a priori v ≥ v_min > 0 para minimizantes.
- (b) Formulación V2: control óptimo en tiempo, x'' = u, u ∈ E(x'), x(t) ∈ pista. E(x') es la elipse de fricción orientada según x'. Existencia tipo Filippov–Cesari. Solución en W^{2,∞}.
- (c) Γ-convergencia de las discretizaciones.
- (d) Condiciones de optimalidad en espacio funcional. Esquema optimizar-luego-discretizar.

## Aportes candidatos (los que se evalúan)

- CA — Existencia de minimizante en el espacio funcional (V2 o variante débil).
- CB — Cota de velocidad o ejemplo de degeneración (v → 0, pérdida de H²).
- CC — Γ-convergencia de Fourier + colocación, con restricciones solo en nodos.
- CD — Condiciones de optimalidad en espacio funcional y estructura de la solución.
- CE — Algoritmo optimizar-luego-discretizar con independencia de malla.
- CF — Formulación geométrica nueva (coordenadas curvilíneas sobre la línea media).
- CG — Software y aplicación web pública.

## Terminología fija (no uses sinónimos)

- **masa puntual**: partícula sin orientación ni inercia rotacional.
- **cuerpo extendido**: vehículo con orientación, guiñada (yaw), neumáticos o suspensión.
- **problema continuo**: V1 o V2 en espacio funcional.
- **problema discreto**: problema de dimensión finita.
- **DTO**: discretizar-luego-optimizar.
- **OTD**: optimizar-luego-discretizar.
- **pista**: región admisible entre dos bordes.
- **trayectoria**: curva recorrida por el vehículo.

## Reglas de evidencia

- Etiquetá cada afirmación: [FUENTE] (está en un paper que leíste), [INFERENCIA] (la deducís vos), [CONJETURA], [DESCONOCIDO].
- No inventes referencias, teoremas ni números de página.
- No cites un paper sin haber leído al menos su resumen real.
- No cites de memoria. La lista "Referencias semilla" no está verificada.
- Si una búsqueda no encuentra nada, registralo como búsqueda negativa.
- Una búsqueda negativa no prueba que algo no exista. Escribilo así.
- Separá siempre: qué dice la literatura, qué deducís vos, qué no sabés.

## Protocolo de búsqueda

1. Usá todas las herramientas de búsqueda disponibles: arXiv, bases académicas, web.
2. Buscá en inglés. Escribí el informe en español.
3. Probá al menos 5 variantes de palabras clave por tema.
4. Seguí citas hacia atrás (referencias) y hacia adelante (quién cita).
5. Revisá autores clave: sus listas de publicaciones y tesis.
6. Registrá cada búsqueda en una tabla: fecha, base, palabras clave, resultado.
7. Verificá cada referencia: autores, año, título, revista, DOI o arXiv.
8. Marcá cada referencia: [VERIFICADA], [PARCIAL] (solo metadatos), [NO VERIFICADA].
9. Una referencia [NO VERIFICADA] no cuenta como evidencia.

## Referencias semilla (NO verificadas; punto de partida)

Verificá cada una. Descartá las que no existan o no digan lo supuesto.

- Masa puntual, camino fijo: Bobrow–Dubowsky–Gibson (1985); Shin–McKay (1985); Verscheure et al. (2009, formulación convexa); Lipp–Boyd (2014); Velenis–Tsiotras (2005, 2008).
- Línea de carrera: Casanova–Limebeer–Sharp (2000); Kelly–Sharp (2010); Theodosis–Gerdes (2012); Kapania–Subosits–Gerdes (2016); Heilmeier et al. (2020); Christ et al. (2021).
- Cuerpo extendido: Rucco–Notarstefano–Hauser (2012); Perantoni–Limebeer (2014); Limebeer–Perantoni (2019, pista 3D); Lot–Biral (2014, abscisa curvilínea); Lot–Dal Bianco (2016); Dal Bianco et al. (2019, directo vs indirecto); Limebeer–Rao (2015).
- Control óptimo y existencia: Filippov (1962); Cesari (1983); Vinter (2000); Clarke (2013); Ioffe (1977).
- Restricciones de estado: Hartl–Sethi–Vickson (1995); Maurer (1977); Bonnans–Hermant (2009).
- Control periódico: Gilbert (1977); Bittanti–Colaneri–Guardabassi (1973).
- Numérica: Hager (2000); Dontchev–Hager (1993); Dontchev–Hager–Veliov (2000); Malanowski–Büskens–Maurer (1998); Gong–Ross–Kang–Fahroo (2008); Betts (2010).
- Γ-convergencia: Braides (2002); Dal Maso (1993).
- Curvas con curvatura acotada: Dubins (1957); Reeds–Shepp (1990); Boissonnat et al. (1994).
- Software: CasADi (Andersson et al. 2019); IPOPT (Wächter–Biegler 2006); buscá código abierto de línea de carrera (por ejemplo, repositorios universitarios de carreras autónomas).

## Formato de salida

- Informe en Markdown, en español técnico controlado.
- Frases cortas (máximo 15 palabras). Una idea por frase.
- Usá la misma palabra para el mismo concepto.
- Elementos obligatorios: resumen ejecutivo (máximo 10 líneas), cuerpo, tabla de búsquedas, tabla de referencias con etiqueta de verificación, lista de incertidumbres.
- Archivo `.bib` aparte con solo referencias [VERIFICADA] o [PARCIAL].
- Al final, lista "Preguntas para el autor".

## Reglas de conducta

- Frená si una búsqueda falla 3 veces. Explicá qué pasó.
- No rellenes. Si no hay literatura sobre un punto, escribí "no encontré".
- Si dos fuentes se contradicen, mostrá ambas.
- Priorizá calidad sobre cantidad de referencias.

---

# ETAPA 1 — Estado del arte por niveles

## Objetivo

Mapear la literatura en niveles de complejidad creciente.
Empezar por masa puntual. Terminar en cuerpo extendido.
Para cada nivel, decir qué se sabe, qué se probó y qué falta.

## Niveles

**N0 — Fundamentos**

- Existencia en control óptimo: Filippov, Cesari, semicontinuidad inferior.
- Restricciones de estado y de control mezcladas.
- Problemas periódicos con tiempo final libre.
- Curvas de curvatura acotada (Dubins) como caso geométrico base.

**N1 — Masa puntual, camino fijo**

- Perfil de velocidad óptimo. Pasada adelante–atrás.
- Reformulación convexa y en abscisa curvilínea.
- Elipse y diagrama g–g.
- Existencia, unicidad y estructura (arcos saturados).

**N2 — Masa puntual, camino libre dentro de la pista**

- Tiempo mínimo, curvatura mínima, longitud mínima, métodos de dos pasos.
- Formulaciones en tiempo y en abscisa.
- Relación entre línea de curvatura mínima y línea de tiempo mínimo.
- Métodos usados en carreras autónomas.

**N3 — Masa puntual, teoría en espacio funcional**

- Existencia del minimizante. Espacio natural (W^{2,∞}, W^{2,1}, BV).
- Regularidad. Estructura de la solución.
- Principio del máximo con restricciones de estado.
- Comportamiento cuando v → 0. Pérdida de coercitividad.
- Número de vueltas y conservación bajo convergencia.

**N4 — Análisis numérico de la discretización**

- DTO frente a OTD. Mapeo de covectores. Consistencia de adjuntos.
- Convergencia de colocación, pseudoespectral y Runge–Kutta en control óptimo.
- Independencia de malla.
- Γ-convergencia de esquemas de control óptimo.
- Restricciones solo en nodos. Restricciones semi-infinitas.
- Bases de Fourier en problemas periódicos.

**N5 — Cuerpo extendido (en escalera)**

- N5a: modelo bicicleta (guiñada, ángulo de dirección, transferencia de carga).
- N5b: cuatro ruedas, neumáticos con deslizamiento, diferencial.
- N5c: pista 3D, motocicleta, multicuerpo.
- Foco teórico: qué pasa con la convexidad del conjunto de control.
- Foco teórico: cuándo falla Filippov y se necesita relajación.
- Foco numérico: qué cambia en DTO y OTD.

**N6 — Software y herramientas**

- Código abierto de línea de carrera.
- Simuladores de tiempo por vuelta.
- Herramientas web o de escritorio donde se ingresa una pista.
- Qué hace cada una y qué no.

## Entregables por nivel

Para cada nivel N0–N6:

1. Formulación estándar (ecuaciones).
2. Resultados teóricos conocidos, con enunciado informal y fuente.
3. Métodos numéricos usados.
4. Entre 5 y 10 papers clave, con una línea de aporte cada uno.
5. Huecos abiertos.
6. Relación con el trabajo evaluado (qué cubre, qué no).

## Entregables globales

- Mapa de dependencias entre niveles (diagrama de texto).
- Línea de tiempo de los hitos principales.
- Lista de autores y grupos activos.
- Tabla de la escalera de masa puntual a cuerpo extendido: qué hipótesis de la teoría se pierden en cada paso.
- Lista de las 10 referencias más cercanas al trabajo evaluado.

## Salida

Archivo `ESTADO_DEL_ARTE.md` y `estado_del_arte.bib`.
Cerrá con "Preguntas para el autor".
Frená. Esperá revisión.

---

# ETAPA 2 — Novedad y comparación profunda

## Entrada

Pegá `ESTADO_DEL_ARTE.md` de la etapa 1.

## Objetivo

Decidir, aporte por aporte, qué es nuevo y qué ya existe.
Comparar con los trabajos más cercanos.
Estimar la dificultad técnica de cada resultado.

## Tareas

### T1. Búsqueda dirigida de antecedentes

Para cada aporte CA–CG, ejecutá una búsqueda dirigida de antecedentes.
Ejemplos de consultas (ampliá y variá):

- "existence of optimal trajectory minimum lap time"
- "existence minimum-time control friction ellipse state constraints"
- "Gamma-convergence direct collocation optimal control"
- "mesh independence Fourier collocation periodic optimal control"
- "optimize then discretize minimum lap time"
- "minimum time closed track point mass friction circle existence theorem"
- "bounded curvature closed curve minimum time corridor"
- "velocity vanishing minimum time vehicle regularity loss"

Registrá cada consulta y su resultado.

### T2. Tabla de novedad

Para cada aporte, completá:

| campo | contenido |
|---|---|
| aporte | CA a CG |
| enunciado preciso | qué se afirmaría |
| 3 a 5 trabajos más cercanos | referencias verificadas |
| diferencias | qué cambia respecto de cada uno |
| veredicto | NUEVO / PARCIAL / YA EXISTE / INDETERMINADO |
| confianza | alta / media / baja, con motivo |
| evidencia | cita o búsqueda negativa |

Si un resultado "ya existe", citá el teorema y sus hipótesis.
Si es "PARCIAL", decí qué falta cubrir.

### T3. Comparación profunda con los 5 trabajos más cercanos

Para cada uno:

1. Problema que resuelve (ecuaciones).
2. Hipótesis y espacio funcional.
3. Resultado principal.
4. Método de prueba.
5. Qué sí cubre del trabajo evaluado.
6. Qué no cubre.
7. Qué se podría reutilizar de su técnica.

### T4. Dificultad técnica de cada resultado

Para CA, CB, CC, CD y CE:

1. Hipótesis de los teoremas estándar que se usarían.
2. Cuáles se cumplen y cuáles no.
3. Obstáculo principal (por ejemplo: elipse discontinua en x' = 0, restricción de estado, falta de convexidad).
4. Técnica candidata para superarlo.
5. Riesgo: bajo / medio / alto.
6. Estimación de esfuerzo en meses de trabajo de un matemático.

Prestá atención especial a:

- Convexidad y semicontinuidad superior de E(x') en x' = 0.
- Preservación del índice de giro bajo convergencia uniforme.
- Equicoercitividad en Γ-convergencia cuando v puede anularse.
- Calificación de restricciones en dimensión infinita con restricción de estado.
- Restricciones solo en nodos y su efecto en la desigualdad liminf.

### T4b. Esbozo de prueba de cada resultado

Para CA, CB, CC, CD y CE, escribí un esbozo de prueba o una idea de prueba.
Cada esbozo incluye:

1. Enunciado preciso (hipótesis, espacio, conclusión).
2. Estrategia en 5 a 10 pasos.
3. Lemas auxiliares necesarios, con su fuente o su estado (conocido / a probar).
4. Paso más delicado. Explicá por qué es delicado.
5. Estado de cada paso: [FUENTE], [INFERENCIA], [CONJETURA] o [HUECO].
6. Contraejemplo posible o caso límite que podría romper el enunciado.
7. Qué experimento numérico (MATLAB) daría evidencia a favor o en contra.

Guía por resultado:

- **CA.** Ruta V2: Filippov–Cesari con E(x') y restricción de estado. Verificá cada hipótesis. Tratá x' = 0 con la envolvente convexa semicontinua superior. Probá la conservación del índice de giro. Comparar con la ruta débil en W^{2,1} o BV.
- **CB.** Dos opciones: cota v ≥ v_min por comparación (reemplazo de una esquina por un arco), o ejemplo explícito de degeneración. Decidí cuál es plausible y por qué.
- **CC.** Desigualdad liminf, sucesión de recuperación y equicoercitividad. Tratá las restricciones en nodos con ajuste ε_n → 0 o malla de verificación.
- **CD.** Calificación de restricciones y principio del máximo con restricción de estado. Estructura de arcos.
- **CE.** Esquema OTD con independencia de malla. Condición bajo la cual vale (por ejemplo, regularidad de la solución y de los multiplicadores).

Reglas del esbozo:

- No declares "demostrado" lo que es un esbozo.
- Si un paso depende de un teorema que no verificaste, marcalo.
- Si no encontrás camino, escribí "no veo camino" y explicá el bloqueo.
- Si el resultado es falso o requiere cambiar el enunciado, decilo.

### T5. Extensión a cuerpo extendido

Para cada escalón N5a, N5b y N5c, respondé:

1. ¿Sobrevive CA? ¿Con qué cambios?
2. ¿Sobrevive CC? ¿Con qué cambios?
3. ¿Sobrevive CD y CE?
4. ¿El conjunto de control deja de ser convexo? ¿Hace falta relajación?
5. ¿Hay literatura que ya lo trate?
6. ¿Qué parte del trabajo de masa puntual se reutiliza sin cambios?

Proponé el diseño de la formulación para que el marco de masa puntual se extienda sin rehacerlo.

### T6. Formulaciones alternativas

Evaluá si existe una formulación mejor que V1 o V2 para la teoría.
Candidatas:

- Coordenadas curvilíneas sobre la línea media, con desplazamiento lateral w(σ).
- Variable independiente = abscisa de la pista (no de la trayectoria).
- Formulación bi-nivel (curva → perfil de velocidad → curva).
- Energía cinética como estado (e = v²/2). Dinámica afín.
- Relajación convexa de la elipse (cono de segundo orden).

Para cada una: ventajas teóricas, ventajas numéricas, riesgos, antecedentes.

## Salida

Archivo `NOVEDAD_Y_COMPARACION.md` con las tablas T2 y T4. Archivo `ESBOZOS_DE_PRUEBA.md` con T4b.
Actualizá `estado_del_arte.bib`.
Cerrá con "Preguntas para el autor".
Frená. Esperá revisión.

---

# ETAPA 3 — Evaluación de publicabilidad

## Entrada

Pegá `ESTADO_DEL_ARTE.md`, `NOVEDAD_Y_COMPARACION.md` y `ESBOZOS_DE_PRUEBA.md`.

Dato del autor: tiene un director y un posible colaborador. Considerá esto al elegir el escenario y al repartir el trabajo.

- El colaborador sabe de optimización y también de análisis numérico.
- Asigná al colaborador los resultados cercanos a su perfil: CC (Γ-convergencia), CE (OTD, independencia de malla) y la calificación de restricciones en CD.
- Indicá qué queda sin cubrir: teoría de control óptimo con restricciones de estado, existencia (CA, CB) y dinámica de vehículos.
- Preguntá al autor qué perfil tiene el director.

## Objetivo

Decidir si el trabajo tiene potencial de publicación internacional.
Decir qué nivel es realista.
Decir qué falta para cada nivel.

## Tareas

### T1. Puntaje por criterio

Puntuá de 1 a 5 cada criterio, con justificación de dos frases y evidencia:

- Novedad teórica.
- Novedad numérica o de modelado.
- Dificultad técnica (profundidad de las pruebas).
- Relevancia para la comunidad (control óptimo, optimización, dinámica de vehículos).
- Completitud actual.
- Reproducibilidad (código, datos, pistas).
- Claridad del mensaje (una frase de contribución).

### T2. Escenarios de artículo

Evaluá estos escenarios. Para cada uno, definí el resultado central en una frase.

- **Escenario A.** Formulación corregida + experimentos + comparación DTO/OTD. Teoría mínima.
- **Escenario B.** Existencia en W^{2,∞} + Γ-convergencia. Experimentos de apoyo.
- **Escenario C.** Marco completo: existencia, convergencia, optimalidad, OTD, software.
- **Escenario D.** Dos artículos: uno teórico y uno de métodos y software.

Para cada escenario:

1. Contribución central.
2. Qué hay hoy y qué falta.
3. Riesgo principal.
4. Tiempo estimado.
5. Nivel de revista realista.

### T3. Revistas candidatas por nivel

Para cada nivel, listá 3 a 5 revistas.
Verificá en el sitio de cada revista: alcance (aims & scope), tipo de artículo, longitud, política de acceso y cargos.
No inventes factor de impacto. Si no lo verificás, no lo cites.

- **Nacional / regional:** revistas y congresos latinoamericanos de matemática aplicada y mecánica computacional.
- **Internacional media:** por ejemplo JOTA, Optimal Control Applications and Methods, Vehicle System Dynamics, Optimization and Engineering, Structural and Multidisciplinary Optimization. Verificá el ajuste con el alcance.
- **Internacional alta:** por ejemplo SIAM J. Control and Optimization, ESAIM COCV, Mathematical Programming, Automatica, IEEE TAC. Verificá el ajuste.

Para cada revista: ajuste temático, tipo de resultado que aceptan, ejemplos de artículos cercanos publicados allí, y por qué sí o por qué no.

### T4. Brecha por nivel

Para cada nivel de revista:

1. Qué teoremas o resultados se exigen típicamente.
2. Qué falta hoy.
3. Qué trabajo adicional lo cierra.
4. Probabilidad cualitativa de lograrlo (baja / media / alta) y su motivo.

### T5. Revisores adversariales

Simulá tres informes de revisores hostiles:

1. Revisor de control óptimo teórico.
2. Revisor de dinámica de vehículos y carreras.
3. Revisor de análisis numérico.

Cada informe incluye: resumen, tres objeciones principales, tres objeciones menores, recomendación (aceptar / revisión mayor / rechazar).
Sé duro y específico.

### T6. Criterios de abandono y de pivote

Definí con claridad:

- Qué hallazgo haría inviable la publicación (por ejemplo: resultado ya existe).
- Qué hallazgo cambiaría el nivel objetivo.
- Qué experimento o prueba corta resolvería la incertidumbre principal.

### T7. Plan recomendado

1. Decisión: seguir / seguir con cambios / no seguir.
2. Escenario recomendado y nivel de revista.
3. Secuencia de trabajo en 5 a 8 pasos, con criterio de salida en cada uno.
4. Esquema del artículo: secciones, teoremas, figuras, tablas.
5. Qué publicar primero como preprint (categoría de arXiv sugerida).
6. Qué hacer ahora con el modelo de cuerpo extendido.
7. Reparto de tareas entre el autor, su director y un posible colaborador.
8. Qué resultados conviene discutir primero con el director.
9. Cómo definir la autoría según el aporte de cada persona.
10. Qué perfil adicional cubriría los huecos que dejan el director y el colaborador.

## Salida

Archivo `PUBLICABILIDAD.md`.
Incluí: veredicto en una página, tablas T1, T3 y T4, informes de T5, plan T7.
Actualizá `estado_del_arte.bib`.
Cerrá con "Preguntas para el autor" y "Mayores incertidumbres".
