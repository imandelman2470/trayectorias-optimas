# ESTADO DEL ARTE — Etapa 1

**Trayectoria de tiempo mínimo para una vuelta en una pista cerrada. Niveles N0–N6.**

- Fecha: 2026-10-02. Versión 1.
- Trabajo evaluado: trabajo especial de Licenciatura en Matemática (FaMAF–UNC, 2017).
- Archivos asociados: `estado_del_arte.bib`, `referencias_verificacion.csv`, `busquedas.csv`.
- Estado: borrador para revisión del autor. Etapa 1 detenida aquí.

---

## 0. Convenciones

- [FUENTE: clave] indica que la afirmación está en un resumen o texto leído.
- [INFERENCIA] indica una deducción propia.
- [CONJETURA] indica una hipótesis no probada.
- [DESCONOCIDO] indica que no lo sé.
- Una [FUENTE] cubre solo lo leído. Casi siempre es el resumen, no el texto completo.
- Las ecuaciones de "formulación estándar" son mías. Llevan [INFERENCIA] salvo indicación.
- [VERIFICADA]: metadatos y resumen (o descripción, índice o texto) leídos.
- [PARCIAL]: solo metadatos. No sostiene afirmaciones de contenido.
- [NO VERIFICADA]: no cuenta como evidencia. No quedó ninguna en la lista final.
- "Búsqueda negativa" significa "no encontré". No prueba que el resultado no exista.
- Las claves remiten a `estado_del_arte.bib`.
- [FUENTE: 00_CONTEXTO], [FUENTE: bloque común] y similares remiten a documentos del autor.

---

## 1. Resumen ejecutivo

1. Verifiqué 127 referencias: 117 [VERIFICADA] y 10 [PARCIAL].
2. N1 (camino fijo) tiene teoría sólida: factibilidad, optimalidad y algoritmos exactos [FUENTE: consolini2020lattice, velenis2008].
3. N2 (camino libre) es casi solo numérico, con predominio de DTO [INFERENCIA].
4. No encontré existencia del minimizante en espacio funcional para la vuelta de masa puntual [búsqueda negativa].
5. No encontré análisis de v → 0 ni del número de vueltas en este problema [búsqueda negativa].
6. Las herramientas generales existen: existencia, restricciones mixtas, consistencia, Γ-convergencia [FUENTE: cesari1983, clarke2010, schwartz1996, buttazzo1982].
7. CA, CB, CC y CD parecen huecos reales [INFERENCIA]. CF y CG tienen precedentes fuertes; CE, parciales [INFERENCIA].
8. Tres semillas tenían autores o año incorrectos. Quedaron corregidas.
9. Límite principal: no consulté MathSciNet, zbMATH, Scopus ni Google Scholar.

---

## 2. Alcance y método

### 2.1 Bases y volumen

- OpenAlex: 191 consultas temáticas, ordenadas por relevancia. Clave de API propia.
- CrossRef: 94 consultas bibliográficas. Sirven para confirmar DOI, autores y año.
- arXiv: 24 consultas. Sirven para resúmenes de preprints.
- OpenAlex citantes: 21 consultas hacia adelante. OpenAlex referencias: 1 consulta hacia atrás.
- GitHub: 15 consultas. PyPI: 3 consultas. Web: 3 consultas. OpenAlex autorías: 1 consulta.
- Total registrado: 353 consultas. Detalle completo en el Apéndice A y en `busquedas.csv`.

### 2.2 Lectura de resúmenes

- Fuentes del resumen: OpenAlex, páginas de Springer, arXiv, textos locales y tres páginas web.
- Los textos locales están en `D:\ESCRI\trabajofinal`. Los leí en modo lectura.
- Muchos resúmenes de Elsevier y Taylor & Francis no están en las API abiertas.
- Esas referencias quedaron [PARCIAL] cuando no hallé otra copia del resumen.

### 2.3 Seguimiento de citas

- Hacia adelante: velenis2008, lipp2014, kaya2017, consolini2017, heilmeier2020, dalbianco2019 y massaro2021.
- Filtros usados sobre citantes: "convergence", "existence" y "Pontryagin".
- Hacia atrás: las 108 referencias de massaro2021. Revisé las anteriores a 2006.
- Autores clave revisados por CrossRef: 50 consultas dirigidas.

### 2.4 Incidencias del protocolo

- La primera tanda de N0 salió sin orden por relevancia. El ruido fue alto.
- Repetí esa tanda con orden por relevancia. Ambas quedan registradas.
- El cupo de búsqueda web se agotó tras 3 consultas.
- Por eso las herramientas comerciales de N6 quedaron sin verificar.
- Ninguna búsqueda falló tres veces seguidas.

---

## 3. Verificación de las referencias semilla

- Semillas: 42 entradas. Se expanden a 45 registros (S05, S15 y S24 tienen dos partes).
- Resultado: 42 [VERIFICADA] y 3 [PARCIAL]. Ninguna resultó inexistente.
- Detalle por semilla en la tabla siguiente y en `semillas_verificacion.csv`.

| sid | semilla (como se dio) | clave verificada | autores (registro) | año | etiqueta | nota |
|---|---|---|---|---|---|---|
| S01 | Bobrow–Dubowsky–Gibson (1985) | bobrow1985 | Bobrow; Dubowsky; Gibson | 1985 | [VERIFICADA] | Existe. Es robótica (manipuladores), camino especificado; no vehículo. |
| S02 | Shin–McKay (1985) | shin1985 | Shin; McKay | 1985 | [VERIFICADA] | Existe. Robótica; camino geométrico fijo. |
| S03 | Verscheure et al. (2009) | verscheure2009 | Verscheure; Demeulenaere; Swevers et al. | 2009 | [VERIFICADA] | Existe. Cambio de variables no lineal -> problema convexo. |
| S04 | Lipp–Boyd (2014) | lipp2014 | Lipp; Boyd | 2014 | [VERIFICADA] | Existe. Online 2013, vol. 2014. Vehículo sobre camino fijo; cambio de variables convexo. |
| S05a | Velenis–Tsiotras (2005) | velenis2005a | Velenis; Tsiotras | 2005 | [VERIFICADA] | Existe (ACC 2005, 'theoretical analysis'). Prueba de optimalidad semi-analítica. |
| S05b | Velenis–Tsiotras (2005) | velenis2005b | Velenis; Tsiotras | 2005 | [VERIFICADA] | Existe (ACC 2005, 'receding horizon implementation'). |
| S06 | Velenis–Tsiotras (2008) | velenis2008 | Velenis; Tsiotras | 2008 | [VERIFICADA] | Existe. Resumen leído en Springer. |
| S07 | Casanova–Limebeer–Sharp (2000) | casanova2000 | Casanova; Sharp; Symonds | 2000 | [VERIFICADA] | CORREGIDA: autores reales Casanova, Sharp, Symonds (no Limebeer). Cuerpo extendido (yaw). |
| S08 | Kelly–Sharp (2010) | kelly2010 | Kelly; Sharp | 2010 | [VERIFICADA] | Existe. |
| S09 | Theodosis–Gerdes (2012) | theodosis2012 | Theodosis; Gerdes | 2012 | [VERIFICADA] | Existe (ASME DSCC 2012). Hay versión previa DSCC 2011. |
| S10 | Kapania–Subosits–Gerdes (2016) | kapania2016 | Kapania; Subosits; Gerdes | 2016 | [VERIFICADA] | Existe. Versión de congreso DSCC 2015. |
| S11 | Heilmeier et al. (2020) | heilmeier2020 | Heilmeier; Wischnewski; Hermansdorfer et al. | 2020 | [VERIFICADA] | Existe. Online 2019; VSD 58(10), 2020. |
| S12 | Christ et al. (2021) | christ2021 | Christ; Wischnewski; Heilmeier et al. | 2021 | [VERIFICADA] | Existe. Online 2019; VSD 59(4), 2021. |
| S13 | Rucco–Notarstefano–Hauser (2012) | rucco2012 | Rucco; Notarstefano; Hauser | 2012 | [VERIFICADA] | Existe. Ya citada en la tesis. |
| S14 | Perantoni–Limebeer (2014) | perantoni2014 | Perantoni; Limebeer | 2014 | [VERIFICADA] | Existe. |
| S15a | Limebeer–Perantoni (2019, pista 3D) | perantoni2015 | Perantoni; Limebeer | 2015 | [VERIFICADA] | CORREGIDA: año real 2015 (JDSMC 137(5), Parte 1, Perantoni–Limebeer). No encontré versión 2019. |
| S15b | Limebeer–Perantoni (2019, pista 3D) | limebeer2015 | Limebeer; Perantoni | 2015 | [VERIFICADA] | CORREGIDA: año real 2015 (JDSMC 137(5), Parte 2, Limebeer–Perantoni). No encontré versión 2019. |
| S16 | Lot–Biral (2014) | lot2014 | Lot; Biral | 2014 | [VERIFICADA] | Existe. Resumen leído vía web (Semantic Scholar); no está en las API abiertas. |
| S17 | Lot–Dal Bianco (2016) | lot2016 | Lot; Dal Bianco | 2016 | [VERIFICADA] | Existe. Online 2015; VSD 54(2), 2016. |
| S18 | Dal Bianco et al. (2019) | dalbianco2019 | Dal Bianco; Bertolazzi; Biral et al. | 2019 | [VERIFICADA] | Existe. Autores: Dal Bianco, Bertolazzi, Biral, Massaro. Online 2018; VSD 57(5), 2019. |
| S19 | Limebeer–Rao (2015) | limebeer2015csm | Limebeer; Rao | 2015 | [VERIFICADA] | Existe. Revisión (IEEE Control Systems Magazine). |
| S20 | Filippov (1962) | filippov1962 | Filippov | 1962 | [PARCIAL] | Existe. Artículo de 1962 sin resumen; texto no accesible. |
| S21 | Cesari (1983) | cesari1983 | Cesari | 1983 | [VERIFICADA] | Existe (Springer, Applications of Mathematics 17). Leída la descripción del editor. |
| S22 | Vinter (2000) | vinter2010 | Vinter | 2010 | [VERIFICADA] | Existe. Original 2000; DOI corresponde a reimpresión 2010 (Modern Birkhäuser Classics). |
| S23 | Clarke (2013) | clarke2013 | Clarke | 2013 | [VERIFICADA] | Existe (GTM 264). Descripción del editor muy breve. |
| S24a | Ioffe (1977) | ioffe1977a | Ioffe | 1977 | [VERIFICADA] | Existe (parte I). |
| S24b | Ioffe (1977) | ioffe1977b | Ioffe | 1977 | [VERIFICADA] | Existe (parte II). |
| S25 | Hartl–Sethi–Vickson (1995) | hartl1995 | Hartl; Sethi; Vickson | 1995 | [VERIFICADA] | Existe. |
| S26 | Maurer (1977) | maurer1977 | Maurer | 1977 | [VERIFICADA] | Existe. |
| S27 | Bonnans–Hermant (2009) | bonnans2009 | Bonnans; Hermant | 2009 | [VERIFICADA] | Existe. Online 2008; AIHP-C 26(2), 2009. |
| S28 | Gilbert (1977) | gilbert1977 | Gilbert | 1977 | [VERIFICADA] | Existe. |
| S29 | Bittanti–Colaneri–Guardabassi (1973) | bittanti1973 | Bittanti; Fronza; Guardabassi | 1973 | [VERIFICADA] | CORREGIDA: autores reales Bittanti, Fronza, Guardabassi (no Colaneri). |
| S30 | Hager (2000) | hager2000 | Hager | 2000 | [VERIFICADA] | Existe. Resumen leído en Springer. |
| S31 | Dontchev–Hager (1993) | dontchev1993 | Dontchev; Hager | 1993 | [VERIFICADA] | Existe. Hay versión 1998 con restricciones de estado (SICON 36). |
| S32 | Dontchev–Hager–Veliov (2000) | dontchev2000rk | Dontchev; Hager; Veliov | 2000 | [VERIFICADA] | Existe. |
| S33 | Malanowski–Büskens–Maurer (1998) | malanowski1998 | Malanowski; Büskens; Maurer | 1998 | [VERIFICADA] | Existe. Capítulo en 'Mathematical Programming with Data Perturbations' (Fiacco ed., 1998); DOI de la reedición CRC 2020. |
| S34 | Gong–Ross–Kang–Fahroo (2008) | gong2008 | Gong; Ross; Kang et al. | 2008 | [VERIFICADA] | Existe. Online 2007; COAP 41(3), 2008. |
| S35 | Betts (2010) | betts2010 | Betts | 2010 | [PARCIAL] | Existe (SIAM, 2.ª ed.). Sin descripción leída. |
| S36 | Braides (2002) | braides2002 | Braides | 2002 | [VERIFICADA] | Existe. |
| S37 | Dal Maso (1993) | dalmaso1993 | Dal Maso | 1993 | [VERIFICADA] | Existe. Leído el índice. |
| S38 | Dubins (1957) | dubins1957 | Dubins | 1957 | [PARCIAL] | Existe. Sin resumen (1957). |
| S39 | Reeds–Shepp (1990) | reeds1990 | Reeds; Shepp | 1990 | [VERIFICADA] | Existe. |
| S40 | Boissonnat et al. (1994) | boissonnat1994 | Boissonnat; Cérézo; Leblond | 1994 | [VERIFICADA] | Existe. Resumen leído en Springer. |
| S41 | CasADi (Andersson et al. 2019) | andersson2019 | Andersson; Gillis; Horn et al. | 2019 | [VERIFICADA] | Existe. Online 2018; MPC 11(1), 2019. Texto completo leído (resumen). |
| S42 | IPOPT (Wächter–Biegler 2006) | waechter2006 | Wächter; Biegler | 2006 | [VERIFICADA] | Existe. Online 2005; Math. Program. 106, 2006. |

Otras discrepancias detectadas:

- La bibliografía de la tesis registra xiong2010 como tesis doctoral [FUENTE: bibliografia.bib].
- El PDF local dice "Master of Science" [FUENTE: xiong2010]. Es tesis de maestría.
- Varias semillas citan el año en línea, no el del volumen [FUENTE: CrossRef]. Uso el año del volumen.
- vinter2010: el DOI corresponde a la reimpresión de 2010 de la edición de 2000 [FUENTE: CrossRef].
- malanowski1998: el DOI corresponde a la reedición digital de 2020 [FUENTE: CrossRef].

Semillas que no dicen exactamente lo supuesto:

- bobrow1985 y shin1985 tratan manipuladores robóticos, no vehículos [FUENTE: bobrow1985, shin1985].
- casanova2000 y rucco2012 son cuerpo extendido, no masa puntual [FUENTE: casanova2000, rucco2012].
- gilbert1977 y bittanti1973 preguntan si ciclar mejora al régimen estacionario [FUENTE: gilbert1977, bittanti1973].
- Ninguno de los dos minimiza el período como costo [INFERENCIA].

---

## 4. Nivel N0 — Fundamentos

### N0.1 Formulación estándar

Problema de tiempo mínimo, tiempo final libre, en forma de inclusión diferencial [INFERENCIA]:

```
min  T
s.a. X'(t) ∈ F(X(t))           c.t.p. en [0, T]
     X(t) ∈ K                   para todo t ∈ [0, T]     (restricción de estado)
     (X(0), X(T)) ∈ B           B cerrado; caso periódico: X(0) = X(T)
con  F(X) = { f(X, u) : u ∈ U(X) }                       (U(X): restricción mixta)
```

- Un costo integral ∫ L dt se lleva a esta forma con un estado extra [INFERENCIA].
- Curvas de curvatura acotada: x' = (cos θ, sen θ), θ' = u, |u| ≤ 1/R [INFERENCIA].

### N0.2 Resultados teóricos conocidos

Existencia:

- Enunciado tipo Filippov (informal): valores de F convexos y compactos, F semicontinua superior. [INFERENCIA]
- Además: K y B cerrados, T acotado y una trayectoria admisible. Entonces hay minimizante. [INFERENCIA]
- No leí ese enunciado en filippov1962 ni en cesari1983. Debe verificarse en el texto.
- cesari1983 incluye teoremas de existencia y teoría del valor [FUENTE: cesari1983].
- Para costos integrales hace falta convexidad del conjunto epigráfico [INFERENCIA; no verificado en el texto].
- cesari1965 trata existencia en problemas de Pontryagin y Lagrange. Solo metadatos [PARCIAL].
- ioffe1977a da condición necesaria y suficiente de semicontinuidad inferior de ∫ f(t, x, y) [FUENTE: ioffe1977a].
- La convergencia es fuerte en x y débil en y [FUENTE: ioffe1977a, ioffe1977b].

Restricciones de estado y mixtas:

- hartl1995 revisa las formas del principio del máximo con restricciones de estado [FUENTE: hartl1995].
- También muestra relaciones entre los distintos conjuntos de condiciones [FUENTE: hartl1995].
- maurer1977 da condiciones en uniones de arcos interiores y de borde [FUENTE: maurer1977].
- arutyunov2011 prueba un principio del máximo sin regularidad a priori de la trayectoria [FUENTE: arutyunov2011].
- También propone conceptos de regularidad que evitan la degeneración [FUENTE: arutyunov2011].
- clarke2010 da condiciones necesarias generales con restricciones mixtas estado-control [FUENTE: clarke2010].
- bonnans2009 da segundo orden con estado puro y restricciones mixtas [FUENTE: bonnans2009].
- bonnans2009 supone control continuo y Legendre–Clebsch reforzado [FUENTE: bonnans2009].
- galbraith2003 da controles óptimos Lipschitz con restricciones de estado [FUENTE: galbraith2003].
- galbraith2003 exige costo coercivo y control en un convexo cerrado [FUENTE: galbraith2003].

Control periódico:

- gilbert1977 da condiciones necesarias de primer orden para control periódico [FUENTE: gilbert1977].
- bittanti1973 da un test frecuencial para decidir si ciclar mejora [FUENTE: bittanti1973].
- speyer1984 da una condición suficiente con período libre [FUENTE: speyer1984].
- speyer1984 usa la matriz de monodromía sobre la órbita cerrada [FUENTE: speyer1984].
- colonius1988 es una monografía del tema. Solo verifiqué metadatos [PARCIAL].

Curvas de curvatura acotada:

- Dubins probó que el camino mínimo tiene a lo sumo tres arcos [FUENTE: kaya2017].
- Con marcha atrás aparecen cúspides [FUENTE: reeds1990].
- boissonnat1994 rehace ambos resultados con el principio de Pontryagin [FUENTE: boissonnat1994].
- ayala2018 caracteriza los caminos mínimos con un enfoque geométrico [FUENTE: ayala2018].
- kaya2017 formula Markov–Dubins como control óptimo [FUENTE: kaya2017].
- howard1995 trata una desigualdad isoperimétrica inversa para curvatura acotada. Solo leí el título [PARCIAL].
- saba2014 interpola curvas cerradas mediante su curvatura con signo [FUENTE: saba2014].

### N0.3 Métodos

- Método directo: compacidad de minimizantes más semicontinuidad inferior [INFERENCIA].
- Principio del máximo con multiplicadores medida para restricciones de estado [INFERENCIA; ver hartl1995].
- Análisis no suave [FUENTE: clarke2013, vinter2010].

### N0.4 Papers clave

| clave | aporte en una línea | etiqueta |
|---|---|---|
| cesari1983 | Tratado de optimización con EDO; incluye teoremas de existencia. | [VERIFICADA] |
| filippov1962 | Origen del teorema de existencia tipo Filippov. | [PARCIAL] |
| ioffe1977a | Semicontinuidad inferior: condición necesaria y suficiente. | [VERIFICADA] |
| clarke2010 | Condiciones necesarias con restricciones mixtas. | [VERIFICADA] |
| hartl1995 | Revisión del principio del máximo con restricciones de estado. | [VERIFICADA] |
| arutyunov2011 | Principio del máximo no degenerado con restricciones de estado. | [VERIFICADA] |
| speyer1984 | Condición suficiente con período libre. | [VERIFICADA] |
| gilbert1977 | Condiciones necesarias de control periódico. | [VERIFICADA] |
| boissonnat1994 | Dubins y Reeds–Shepp vía Pontryagin. | [VERIFICADA] |
| kaya2017 | Markov–Dubins como control óptimo. | [VERIFICADA] |

### N0.5 Huecos abiertos

- No encontré existencia con período libre y restricción de estado juntos [búsqueda negativa: N0.3, N0.3b].
- No encontré resultados sobre curvas cerradas de curvatura acotada con número de vueltas fijo [búsqueda negativa: N0.4b].
- Busqué "Pestov Ionin" como posible herramienta. No obtuve resultados [búsqueda negativa].

### N0.6 Relación con el trabajo evaluado

- V2 encaja en la forma de N0.1 con X = (x, x') [INFERENCIA].
- F(X) = {(x', u) : u ∈ E(x')} tiene valores convexos y compactos si x' ≠ 0 [INFERENCIA].
- En x' = 0 la orientación de la elipse no está definida [INFERENCIA].
- El límite superior de E(y) cuando y → 0 es el disco de radio g·max(μt, μn) [INFERENCIA].
- Ese disco es la menor extensión semicontinua superior con valores convexos [INFERENCIA].
- Si μt = μn, la elipse es un disco y el problema desaparece [INFERENCIA].
- La condición periódica define un conjunto B cerrado [INFERENCIA].
- La pista es cerrada si sus bordes son curvas de Jordan [INFERENCIA].
- Faltan dos piezas: acotar T y exhibir una trayectoria admisible [INFERENCIA].
- La tesis supone la condición de Robinson sin probarla [FUENTE: 00_CONTEXTO].
- clarke2010 y arutyunov2011 estudian hipótesis de ese tipo [INFERENCIA].
- El hueco "desigualdad isoperimétrica sin curva simple" podría vincularse con howard1995 [DESCONOCIDO].

---

## 5. Nivel N1 — Masa puntual, camino fijo

### N1.1 Formulación estándar

Camino γ de longitud L y curvatura κ(s). Variable b(s) = v(s)² [INFERENCIA]:

```
min  T = ∫₀ᴸ b(s)^(-1/2) ds
s.a. b'(s) = 2 a_t(s)
     (a_t / (μt g))² + (κ(s) b(s) / (μn g))² ≤ 1      (elipse de fricción)
     b(s) ≥ 0;     vuelta cerrada: b(0) = b(L)
```

- El cambio de variables vuelve convexo el problema de camino fijo [FUENTE: verscheure2009].
- Ese cambio se conoce desde los años ochenta [FUENTE: lipp2014].
- Su convexidad se notó recién después [FUENTE: lipp2014].
- b^(-1/2) es convexa en b > 0. La elipse es un cono en (b, b') [INFERENCIA].

### N1.2 Resultados teóricos conocidos

- velenis2005a prueba la optimalidad de un perfil semi-analítico con control óptimo [FUENTE: velenis2005a].
- velenis2008 deriva condiciones necesarias explícitas [FUENTE: velenis2008].
- Con ellas construye la solución en forma semi-analítica [FUENTE: velenis2008].
- consolini2020lattice da condición necesaria y suficiente de factibilidad [FUENTE: consolini2020lattice].
- El conjunto factible, si no es vacío, es un retículo [FUENTE: consolini2020lattice].
- El supremo de ese retículo es la solución óptima [FUENTE: consolini2020lattice].
- La solución sale de un operador basado en dos EDO [FUENTE: consolini2020lattice].
- Consecuencia: existencia y unicidad del perfil óptimo bajo esas hipótesis [INFERENCIA].
- Ese operador es la pasada adelante–atrás escrita como supremo [INFERENCIA].
- consolini2017 da un algoritmo de complejidad lineal, óptimo tras discretizar [FUENTE: consolini2017].
- consolini2020 prueba que el muestreo espacial alcanza precisión arbitraria [FUENTE: consolini2020].
- spasojevic2019 prueba convergencia al óptimo de un algoritmo TOPP [FUENTE: spasojevic2019].
- selvaratnam2022 da perfiles explícitos para curvatura estrictamente monótona [FUENTE: selvaratnam2022].
- Allí la optimalidad global se prueba desde primeros principios [FUENTE: selvaratnam2022].
- frego2017 resuelve caminos de clotoides en forma semi-analítica [FUENTE: frego2017].
- Su método detecta si existe solución óptima [FUENTE: frego2017].
- bertolazzi2018 agrega arrastre y aceleración longitudinal asimétrica [FUENTE: bertolazzi2018].
- El diagrama g-g da las aceleraciones longitudinal y lateral máximas [FUENTE: massaro2024].
- brayshaw2005 obtiene un diagrama GG de velocidad como resultado intermedio [FUENTE: brayshaw2005].

Estructura de la solución:

- Hay arcos con elipse saturada: aceleración máxima o frenado máximo [INFERENCIA].
- Hay arcos a la velocidad límite de curva, con a_t = 0 [INFERENCIA].
- Los cambios ocurren en puntos de conmutación aislados para curvatura regular [CONJETURA].

### N1.3 Métodos numéricos usados

- Integración numérica en el plano de fase. Es rápida pero poco robusta [FUENTE: pham2018].
- Optimización convexa. Es robusta pero más lenta [FUENTE: pham2018].
- Análisis de alcanzabilidad con programas lineales pequeños [FUENTE: pham2018].
- Pasada adelante–atrás con límites de fricción [FUENTE: kapania2016, heilmeier2020].
- Soluciones semi-analíticas sobre clotoides [FUENTE: frego2017].
- Origen en robótica: bobrow1985 y shin1985 [FUENTE: bobrow1985, shin1985].

### N1.4 Papers clave

| clave | aporte en una línea | etiqueta |
|---|---|---|
| velenis2008 | Condiciones necesarias explícitas; solución semi-analítica. | [VERIFICADA] |
| consolini2020lattice | Factibilidad, retículo y supremo óptimo. | [VERIFICADA] |
| consolini2017 | Algoritmo lineal óptimo tras discretizar. | [VERIFICADA] |
| consolini2020 | Convergencia del muestreo espacial. | [VERIFICADA] |
| lipp2014 | Convexidad del problema de velocidad en camino fijo. | [VERIFICADA] |
| verscheure2009 | Cambio de variables que convexifica. | [VERIFICADA] |
| bobrow1985 | Origen del tiempo mínimo sobre camino dado. | [VERIFICADA] |
| pham2018 | TOPP por alcanzabilidad. | [VERIFICADA] |
| selvaratnam2022 | Perfiles exactos y optimalidad global. | [VERIFICADA] |
| frego2017 | Semi-analítico sobre clotoides; detecta existencia. | [VERIFICADA] |

### N1.5 Huecos abiertos

- No sé si hay teoría para caminos con curvatura no acotada [DESCONOCIDO].
- No hice una búsqueda específica sobre ese punto. Queda para la etapa 2.
- No encontré la condición periódica b(0) = b(L) tratada en un teorema [DESCONOCIDO].
- Las pruebas de convergencia leídas cubren camino fijo, no camino libre [FUENTE: consolini2020, spasojevic2019; INFERENCIA].

### N1.6 Relación con el trabajo evaluado

- En V1, con c fija, el problema en (a, v0) es un problema N1 [INFERENCIA].
- La variable v² = 2p∫a + v0² es b, escalada por p [INFERENCIA].
- La curvatura física es κ = |c''|/p. La elipse de V1 es la de N1 [INFERENCIA].
- Por eso la formulación bi-nivel de `PENDIENTES_MODELO.md` tiene base sólida [INFERENCIA].
- Su nivel interno sería convexo y con solución única [INFERENCIA, apoyada en consolini2020lattice].

Prueba de la hipótesis de degeneración en N1:

- |a| ≤ μt g implica |d(v²)/ds| ≤ 2pμt g. Luego v² es Lipschitz [INFERENCIA].
- La elipse impone v² ≤ μn g p / |c''| [INFERENCIA].
- En H², c'' está en L². La curvatura puede no estar acotada [INFERENCIA].
- Ejemplo: |c''(s)| ~ |s − s0|^(−1/3) está en L² y no en L∞ [INFERENCIA].
- Tomar v² = C|s − s0| cerca de s0, con C < 2pμt g [INFERENCIA].
- Ese perfil es Lipschitz y cumple la elipse cerca de s0 [INFERENCIA].
- Allí v → 0 y ∫ ds/v sigue finita [INFERENCIA].
- Luego las restricciones de V1 en H² no excluyen v → 0 con tiempo finito [INFERENCIA].
- Esto no prueba que un minimizante se comporte así [INFERENCIA].

---

## 6. Nivel N2 — Masa puntual, camino libre dentro de la pista

### N2.1 Formulación estándar

(a) En tiempo. Coincide con V2 [INFERENCIA]:

```
min T   s.a.   x'' = u,   u ∈ E(x'),   x(t) ∈ P,   x(0) = x(T),   x'(0) = x'(T)
```

(b) En abscisa curvilínea σ de la línea media γ [INFERENCIA en las fórmulas]:

```
x(σ) = γ(σ) + w(σ) N(σ),          w_min(σ) ≤ w(σ) ≤ w_max(σ)
dt/dσ = (1 − w κ_γ) / (v cos ξ)    (ξ: ángulo respecto de la tangente de γ)
min  ∫₀^Λ (1 − w κ_γ) / (v cos ξ) dσ
```

- Usar la posición sobre la pista como variable independiente es práctica establecida [FUENTE: lot2014, rucco2012].
- También lo hacen perantoni2014 y christ2021 [FUENTE: perantoni2014, christ2021].

(c) Curvatura mínima: minimizar ∫ κ² sobre w con cotas [INFERENCIA en la fórmula].

- heilmeier2020 lo resuelve como QP iterado [FUENTE: heilmeier2020].

(d) Dos pasos: perfil de velocidad y trayectoria, alternados [FUENTE: kapania2016].

- El perfil sale de una integración adelante–atrás [FUENTE: kapania2016].
- La trayectoria sale de un problema convexo de curvatura mínima [FUENTE: kapania2016].

(e) Cuasi-estacionario con trayectoria libre, basado en superficies g-g-v [FUENTE: veneri2020].

### N2.2 Resultados teóricos conocidos

- La trayectoria de carrera equilibra distancia corta y velocidad alta [FUENTE: theodosis2012].
- La de curvatura mínima se acerca a la de tiempo mínimo en curvas [FUENTE: tumftm_gto].
- Difiere donde no se agotan los límites de aceleración [FUENTE: tumftm_gto].
- El QP iterado reduce errores de linealización en curvas [FUENTE: heilmeier2020].
- veneri2020 discute el efecto de trayectoria libre frente a fija [FUENTE: veneri2020].
- subosits2021 mide el efecto de la fidelidad de modelo con un vehículo real [FUENTE: subosits2021].
- Sus modelos van de doble vía con transferencia de carga a masa puntual [FUENTE: subosits2021].
- No encontré teoremas de existencia ni de estructura para N2 [búsqueda negativa: N2.1–N2.3, N3.1].

### N2.3 Métodos numéricos usados

- Transcripción directa y PNL [FUENTE: casanova2000, perantoni2014].
- christ2021 usa colocación de Gauss–Legendre, IPOPT y CasADi [FUENTE: christ2021].
- Método indirecto basado en Pontryagin [FUENTE: lot2014, dalbianco2019].
- timings2013 maximiza la distancia sobre la línea media con dinámica linealizada [FUENTE: timings2013].
- eshof2025 usa programación convexa secuencial y baja minutos a segundos [FUENTE: eshof2025].
- jain2020 usa optimización bayesiana [FUENTE: jain2020].
- cardamone2010 usa algoritmos genéticos [FUENTE: cardamone2010].
- liniger2015 maximiza el progreso sobre la pista con control predictivo [FUENTE: liniger2015].
- rosolia2020 trata la carrera como tarea iterativa de tiempo mínimo [FUENTE: rosolia2020].
- braghin2008 propone un modelo de piloto. Solo verifiqué metadatos [PARCIAL].
- sharp2011 revisa control óptimo vehicular, incluido el tiempo mínimo [FUENTE: sharp2011].
- xiong2010 usa espiral de Euler, IA y PNL [FUENTE: xiong2010].
- romero2016 usa segmentos rectos y elipse centrada y descentrada [FUENTE: romero2016].

### N2.4 Papers clave

| clave | aporte en una línea | etiqueta |
|---|---|---|
| metz1989 | Control casi óptimo de vehículos de carrera. | [PARCIAL] |
| hendrikx1996 | Simulación inversa de tiempo mínimo. | [VERIFICADA] |
| kelly2010 | Trayectoria y controles simultáneos de tiempo mínimo. | [VERIFICADA] |
| theodosis2012 | Compromiso entre distancia y velocidad. | [VERIFICADA] |
| lot2014 | Abscisa curvilínea y método indirecto. | [VERIFICADA] |
| kapania2016 | Algoritmo de dos pasos. | [VERIFICADA] |
| heilmeier2020 | Curvatura mínima por QP iterado. | [VERIFICADA] |
| christ2021 | Tiempo mínimo con fricción variable. | [VERIFICADA] |
| veneri2020 | Trayectoria libre cuasi-estacionaria con mapas g-g. | [VERIFICADA] |
| massaro2021 | Revisión del tiempo mínimo de vuelta. | [VERIFICADA] |

Antecedentes locales leídos:

| clave | aporte en una línea | etiqueta |
|---|---|---|
| tmai2014 | Formulación funcional original del "problema del TC". | [VERIFICADA] |
| romero2016 | Masa puntual, pista por segmentos, elipse descentrada; MATLAB. | [VERIFICADA] |
| xiong2010 | Cuatro métodos de trayectoria en 2D y 3D. | [VERIFICADA] |
| vankoutrik2015 | Maniobras cortas de tiempo mínimo con control óptimo. | [VERIFICADA] |

### N2.5 Huecos abiertos

- No encontré teoría que relacione curvatura mínima y tiempo mínimo [búsqueda negativa: N2.3].
- Las afirmaciones al respecto son empíricas o heurísticas [FUENTE: tumftm_gto; INFERENCIA].
- No sé si hay estudios de convergencia en malla para métodos de N2 [DESCONOCIDO].
- perantoni2014 resuelve un problema auxiliar para cerrar la línea media [FUENTE: perantoni2014].
- Ese problema evita la deriva de integración [FUENTE: perantoni2014].

### N2.6 Relación con el trabajo evaluado

- El trabajo es N2: masa puntual, camino libre, elipse de fricción, vuelta cerrada [INFERENCIA].
- Su parametrización por longitud de arco de la trayectoria aparece en tmai2014 [FUENTE: tmai2014].
- No la hallé en la literatura internacional leída [INFERENCIA].
- La literatura leída usa la abscisa de la línea media [FUENTE: lot2014, christ2021].
- Esa elección evita el acoplamiento de parámetros de la tesis [INFERENCIA].
- La pista como franja con cotas en w es estándar [INFERENCIA].
- La "lente" de dos discos de la tesis no aparece en lo leído [INFERENCIA].
- CF tiene precedentes fuertes [FUENTE: lot2014, perantoni2014, rucco2012, christ2021].
- CF sola no sería un aporte nuevo [INFERENCIA].
- tmai2014 y romero2016 son antecedentes locales directos [FUENTE: tmai2014, romero2016].
- La "elipse descentrada" de romero2016 podría modelar la asimetría tracción/frenado [CONJETURA].

---

## 7. Nivel N3 — Masa puntual, teoría en espacio funcional

### N3.1 Formulación estándar

V2 como inclusión diferencial de primer orden [INFERENCIA]:

```
X = (x, y),   x' = y,   y' ∈ E(y),   x(t) ∈ P,   X(0) = X(T),   min T
E(y) = R(θ(y)) · diag(μt g, μn g) · B̄      si y ≠ 0     (θ(y): dirección de y)
E(0) = g · max(μt, μn) · B̄                  (extensión semicontinua superior)
```

- B̄ es el disco unidad cerrado. R(θ) es la rotación de ángulo θ [INFERENCIA].

### N3.2 Resultados teóricos conocidos

- sanfelice2014 estudia tiempo mínimo con radio de giro mínimo por regiones [FUENTE: sanfelice2014].
- Deriva condiciones necesarias y una ley de refracción en las fronteras [FUENTE: sanfelice2014].
- Allí la rapidez está fijada por región. No es un control [FUENTE: sanfelice2014; INFERENCIA].
- kaya2013 estudia curvas que minimizan la norma L∞ de la aceleración [FUENTE: kaya2013].
- kaya2013 caracteriza soluciones con controles singulares y no singulares [FUENTE: kaya2013].
- kaya2019 formula la interpolación de Markov–Dubins como control óptimo [FUENTE: kaya2019].
- benham2020 calcula la vuelta de tiempo mínimo en un velódromo [FUENTE: benham2020].
- Trata al ciclista como partícula activa sobre una superficie [FUENTE: benham2020].
- golubev2010 resuelve la braquistócrona con fricción seca y viscosa [FUENTE: golubev2010].
- Allí el control es la componente normal de la reacción [FUENTE: golubev2010].
- velenis2008 da la estructura en camino fijo, no en camino libre [FUENTE: velenis2008].
- galbraith2003 da regularidad Lipschitz con costo coercivo [FUENTE: galbraith2003].
- El costo de tiempo mínimo no es coercivo en u [INFERENCIA].
- Por eso se esperan controles bang-bang o singulares, no Lipschitz [INFERENCIA].

### N3.3 Métodos

- Teoremas de existencia tipo Filippov–Cesari [FUENTE: cesari1983; enunciado no leído].
- Principio del máximo con restricciones de estado y mixtas [FUENTE: hartl1995, clarke2010].
- Herramientas de sistemas híbridos para fronteras entre regiones [FUENTE: sanfelice2014].

### N3.4 Análisis propio de la hipótesis de degeneración

1. |a| ≤ μt g implica que v² es Lipschitz en s [INFERENCIA].
2. Luego v puede anularse como |s − s0|^(1/2) con ∫ ds/v finita [INFERENCIA].
3. La elipse da |c''| ≤ μn g p / v² [INFERENCIA].
4. Si v ≥ v_min > 0, entonces c está en W^{2,∞} ⊂ H² [INFERENCIA].
5. En V2, x'' acotada implica x ∈ W^{2,∞}(0, T) [INFERENCIA].
6. La curva geométrica puede tener cúspide donde x' = 0 [INFERENCIA].
7. Ejemplo: x(t) = (t², t³) tiene x'' acotada y una cúspide en t = 0 [INFERENCIA].
8. reeds1990 muestra cúspides análogas al invertir el sentido de marcha [FUENTE: reeds1990; INFERENCIA en la analogía].
9. Una esquina en V2 da c' discontinua. Esa c no está en H² [INFERENCIA].
10. Si un minimizante de V2 se detiene, V1 puede no alcanzar su ínfimo en H² [INFERENCIA].
11. Con ancho positivo y bordes regulares, los minimizantes de V2 extendido no se detienen [CONJETURA].
12. Idea de prueba: reemplazar la detención por un arco de radio pequeño [CONJETURA; FUENTE: 04_PROMPT_TEORIA].
13. Si 11 vale, V2 extendido y V2 original tienen el mismo mínimo [INFERENCIA].
14. No encontré literatura que pruebe o refute 11 [búsqueda negativa: N3.4].

### N3.5 Número de vueltas

- Hay dos invariantes distintos [INFERENCIA].
- Número de vueltas: giros de x alrededor de un punto q interior al borde interno [INFERENCIA].
- Índice de giro: giros de la tangente x'/|x'| [INFERENCIA].
- El número de vueltas se conserva bajo convergencia uniforme si las curvas evitan q [INFERENCIA].
- En la pista, las curvas evitan la región interior. Basta convergencia uniforme [INFERENCIA].
- El índice de giro exige x' ≠ 0 y convergencia C¹ [INFERENCIA].
- El índice de giro puede perderse si v → 0 [INFERENCIA].
- `00_CONTEXTO.md` habla de winding number [FUENTE: 00_CONTEXTO].
- El bloque común habla de índice de giro [FUENTE: bloque común].
- Conviene fijar uno de los dos [INFERENCIA]. Ver preguntas al autor.
- No encontré trabajos de carreras con esta restricción [búsqueda negativa: N3.5].

### N3.6 Papers clave

| clave | aporte en una línea | etiqueta |
|---|---|---|
| sanfelice2014 | Tiempo mínimo con curvatura acotada por regiones. | [VERIFICADA] |
| kaya2013 | Curvas con aceleración mínima en L∞. | [VERIFICADA] |
| kaya2017 | Markov–Dubins como control óptimo. | [VERIFICADA] |
| kaya2019 | Interpolación de Markov–Dubins. | [VERIFICADA] |
| benham2020 | Vuelta de tiempo mínimo de una partícula en velódromo. | [VERIFICADA] |
| golubev2010 | Braquistócrona con fricción. | [VERIFICADA] |
| velenis2008 | Estructura en camino fijo. | [VERIFICADA] |
| galbraith2003 | Regularidad con restricciones de estado. | [VERIFICADA] |
| clarke2010 | Condiciones necesarias con restricciones mixtas. | [VERIFICADA] |
| reeds1990 | Cúspides al invertir el sentido. | [VERIFICADA] |

### N3.7 Huecos abiertos

- Existencia del minimizante de la vuelta de masa puntual en espacio funcional [búsqueda negativa: N3.1].
- Espacio natural de la trayectoria (W^{2,∞}, W^{2,1}, BV) para este problema [búsqueda negativa: N3.2].
- Principio del máximo con borde de pista y elipse, en vuelta periódica [búsqueda negativa: N3.3].
- Cota v ≥ v_min o ejemplo de detención óptima [búsqueda negativa: N3.4].
- Conservación del número de vueltas en este problema [búsqueda negativa: N3.5].

### N3.8 Relación con el trabajo evaluado

- CA (existencia) parece un hueco real. Las herramientas generales existen [INFERENCIA].
- CB (cota o ejemplo) parece un hueco real [INFERENCIA].
- CD (optimalidad y estructura) parece un hueco real para camino libre [INFERENCIA].
- La sección N3.4 da indicios a favor de la hipótesis de degeneración en V1 [INFERENCIA].
- Esos indicios no prueban que el ínfimo de V1 no se alcance [INFERENCIA].

---

## 8. Nivel N4 — Análisis numérico de la discretización

### N4.1 Formulación estándar

Problema discreto P_n y problema continuo P [INFERENCIA]:

```
P_n:  min J_n(z)   s.a.  G_n(z) ≤ 0 en los nodos s_j,   z ∈ R^{N(n)}
P:    min J(x)     s.a.  G(x) ≤ 0 para todo s
Γ-convergencia: (i) liminf J_n(z_n) ≥ J(x) si z_n → x;
                (ii) existe z_n → x con limsup J_n(z_n) ≤ J(x);
                (iii) equicoercividad  ⇒  convergencia de mínimos y minimizantes.
```

- El índice de dalmaso1993 incluye convergencia de mínimos y de minimizantes [FUENTE: dalmaso1993].
- En la tesis: base de Fourier, colocación en n nodos y SQP [FUENTE: 00_CONTEXTO].

### N4.2 Resultados teóricos conocidos

Runge–Kutta y Euler:

- hager2000 determina tasas de convergencia de Runge–Kutta en control óptimo [FUENTE: hager2000].
- Usa la conexión entre multiplicadores discretos y adjuntos continuos [FUENTE: hager2000].
- bonnans2006 reduce las condiciones de orden a Runge–Kutta particionado simpléctico [FUENTE: bonnans2006].
- dontchev2000rk trata Runge–Kutta de segundo orden con restricciones de control [FUENTE: dontchev2000rk].
- Supone coercividad y derivada del control de variación acotada [FUENTE: dontchev2000rk].
- dontchev2001 trata Euler con restricciones de estado [FUENTE: dontchev2001].
- Pide independencia de restricciones activas y coercividad [FUENTE: dontchev2001].
- bonnans2017 obtiene orden 1 en L∞ para estado de primer orden [FUENTE: bonnans2017].
- alt2012 obtiene orden h en el valor óptimo, caso lineal-cuadrático [FUENTE: alt2012].
- Con estructura bang-bang da cotas adicionales [FUENTE: alt2012].
- veliov1997 construye discretizaciones de orden mayor que uno para sistemas afines [FUENTE: veliov1997].
- malanowski1998 estudia la convergencia vía estabilidad y el teorema de Robinson [FUENTE: malanowski1998].

Aproximaciones consistentes y Γ-convergencia:

- schwartz1996 define consistencia por epiconvergencia [FUENTE: schwartz1996].
- Exige también hipoconvergencia de las funciones de optimalidad [FUENTE: schwartz1996].
- Así, estacionarios discretos solo convergen a estacionarios continuos [FUENTE: schwartz1996].
- Lo mismo vale para soluciones globales [FUENTE: schwartz1996].
- schwartz1996 cubre restricciones de control y de estado [FUENTE: schwartz1996].
- Advierte que hace falta un producto interno no euclídeo [FUENTE: schwartz1996].
- polak1997 da la teoría abstracta: PNL, semi-infinita y control [FUENTE: polak1997].
- buttazzo1982 aplica Γ-convergencia a límites de problemas de control [FUENTE: buttazzo1982].
- Epiconvergencia y Γ-convergencia coinciden en el marco secuencial usual [INFERENCIA].

Pseudoespectral y colocación:

- gong2008 da consistencia pseudoespectral con restricciones mixtas [FUENTE: gong2008].
- El mapeo de covectores acerca métodos directos e indirectos [FUENTE: gong2008].
- kang2007 admite controles discontinuos en sistemas linealizables [FUENTE: kang2007].
- hager2016 y hager2018 dan tasas para colocación de Gauss [FUENTE: hager2016, hager2018].
- Ambos suponen convexidad fuerte del hamiltoniano [FUENTE: hager2016, hager2018].

Independencia de malla:

- allgower1986 enuncia el principio de independencia de malla para Newton [FUENTE: allgower1986].
- dontchev2000mesh prueba convergencia de Newton uniforme en la discretización [FUENTE: dontchev2000mesh].

Restricciones entre nodos:

- hettich1993 revisa la programación semi-infinita [FUENTE: hettich1993].
- loxton2009 trata restricciones continuas sobre el estado. Solo metadatos [PARCIAL].
- nie2023 no impone la dinámica solo en puntos. Usa el residuo integrado [FUENTE: nie2023].
- neuenhofen2018 prueba convergencia sin calificación de restricciones [FUENTE: neuenhofen2018].
- elango2024 satisface restricciones en tiempo continuo [FUENTE: elango2024].

Fourier y problemas periódicos:

- elgindy2022 propone un método pseudoespectral integral de Fourier [FUENTE: elgindy2022].
- Supone soluciones suficientemente suaves [FUENTE: elgindy2022].

Aplicación a tiempo de vuelta:

- dalbianco2019 compara métodos directos e indirectos en problemas vehiculares [FUENTE: dalbianco2019].
- caillau2022 es una guía de métodos numéricos en dimensión finita [FUENTE: caillau2022].

### N4.3 Métodos numéricos usados

- Runge–Kutta, Euler y esquemas simplécticos [FUENTE: hager2000, bonnans2006].
- Colocación de Gauss y pseudoespectral [FUENTE: hager2016, gong2008].
- Fourier integral [FUENTE: elgindy2022].
- Mecánica discreta [FUENTE: oberblobaum2011].
- Texto de referencia con EDO y EAD [FUENTE: gerdts2012].
- Penalización-barrera con elementos finitos [FUENTE: neuenhofen2018].
- Métodos indirectos simbólico-numéricos [FUENTE: bertolazzi2005].

### N4.4 Papers clave

| clave | aporte en una línea | etiqueta |
|---|---|---|
| schwartz1996 | Aproximaciones consistentes por Runge–Kutta. | [VERIFICADA] |
| polak1997 | Teoría abstracta de aproximaciones consistentes. | [VERIFICADA] |
| buttazzo1982 | Γ-convergencia en control óptimo. | [VERIFICADA] |
| hager2000 | Runge–Kutta y adjunto transformado. | [VERIFICADA] |
| dontchev2001 | Euler con restricciones de estado. | [VERIFICADA] |
| bonnans2017 | Orden 1 en L∞ con estado de primer orden. | [VERIFICADA] |
| gong2008 | Mapeo de covectores. | [VERIFICADA] |
| allgower1986 | Independencia de malla. | [VERIFICADA] |
| elgindy2022 | Fourier para control periódico. | [VERIFICADA] |
| dalbianco2019 | Directo frente a indirecto en tiempo de vuelta. | [VERIFICADA] |

### N4.5 Huecos abiertos

- No encontré Γ-convergencia de Fourier más colocación para tiempo mínimo con estado [búsqueda negativa: N4.4, N4.6].
- Las tasas leídas piden convexidad fuerte o coercividad [FUENTE: hager2016, dontchev2001].
- El tiempo mínimo con elipse no cumple convexidad fuerte en u [INFERENCIA].
- elgindy2022 supone suavidad. Las soluciones bang-bang no son suaves [FUENTE: elgindy2022; INFERENCIA].
- Con Fourier se espera fenómeno de Gibbs en los controles [INFERENCIA].
- No encontré análisis de restricciones solo en nodos para Fourier [búsqueda negativa: N4.5].

### N4.6 Relación con el trabajo evaluado

- La tesis es DTO: Fourier, colocación y SQP [FUENTE: 00_CONTEXTO].
- schwartz1996 ofrece una plantilla para CC [INFERENCIA].
- Con nodos densos y cotas uniformes, el límite cumple la restricción en todo s [INFERENCIA].
- La dificultad está en la equicoercividad [INFERENCIA].
- El hueco "|c'| = 1 solo en nodos" ataca justamente esas cotas [INFERENCIA].
- CC parece un hueco real en esta aplicación [INFERENCIA].
- CE tiene precedentes: métodos indirectos de vuelta y teoría de independencia de malla [FUENTE: dalbianco2019, allgower1986].
- Un OTD con independencia de malla probada para V2 sería nuevo aquí [INFERENCIA].
- El análogo del adjunto transformado para Fourier es [DESCONOCIDO].

---

## 9. Nivel N5 — Cuerpo extendido (en escalera)

### N5.1 Formulación estándar

- N5a bicicleta: guiñada, ángulo de dirección, neumáticos y transferencia de carga [FUENTE: rucco2012, casanova2000].
- N5b cuatro ruedas: suspensiones, giro de ruedas, fuerzas de neumático y reglajes [FUENTE: dalbianco2018, perantoni2014].
- N5c pista 3D: curvaturas geodésica y normal, y torsión relativa [FUENTE: limebeer2015].
- N5c moto en pista 3D cerrada [FUENTE: leonelli2020].
- N5c multicuerpo de 14 grados de libertad [FUENTE: dalbianco2018].
- Reducción cuasi-estacionaria: masa puntual con envolvente g-g-v o g-g-g [FUENTE: veneri2020, lovato2022].

Forma típica de N5a [INFERENCIA]:

```
estados:  (x, y, ψ, v_x, v_y, r, δ)       entradas: (δ', F_x)
m(v_x' − v_y r) = F_x,f cos δ − F_y,f sen δ + F_x,r
m(v_y' + v_x r) = F_x,f sen δ + F_y,f cos δ + F_y,r
I_z r'           = l_f (F_y,f cos δ + F_x,f sen δ) − l_r F_y,r
F_y,i = Φ_i(α_i, F_z,i) con saturación;   F_z,i depende de la transferencia de carga
```

### N5.2 Resultados teóricos conocidos

- La inercia de guiñada importa en maniobras de tiempo mínimo [FUENTE: casanova2000].
- Optimizar reglajes por pista reduce el tiempo de vuelta [FUENTE: perantoni2014].
- La fidelidad de modelo cambia el resultado. Se probó con un vehículo real [FUENTE: subosits2021].
- lovato2021 extiende la pista plana con curvatura lateral [FUENTE: lovato2021].
- veneri2021 estudia el efecto de la dirección Ackermann [FUENTE: veneri2021].
- velenis2008trail estudia el trail-braking. Solo metadatos [PARCIAL].
- Ningún resumen leído de N5 trata existencia, convexidad o relajación [búsqueda negativa: N5 teoría].

### N5.3 Foco teórico: convexidad y relajación

- En masa puntual, el conjunto de aceleraciones es la elipse. Es convexo [INFERENCIA].
- En bicicleta, el conjunto de velocidades depende de curvas de neumático con pico [INFERENCIA].
- Ese conjunto puede no ser convexo [CONJETURA].
- Sin convexidad, el teorema tipo Filippov no se aplica directamente [INFERENCIA].
- Entonces se necesita relajación: controles relajados o envolvente convexa [INFERENCIA].
- La relajación puede bajar el ínfimo o dar soluciones de alta oscilación [INFERENCIA].
- La reducción cuasi-estacionaria lleva el problema a masa puntual con envolvente [FUENTE: veneri2020].
- Si la envolvente es convexa, la teoría de N3 podría extenderse [CONJETURA].
- No sé si las envolventes g-g reales son convexas [DESCONOCIDO].

### N5.4 Foco numérico: DTO y OTD

- DTO domina: transcripción directa y PNL [FUENTE: casanova2000, perantoni2014, christ2021].
- OTD aparece en métodos indirectos simbólico-numéricos [FUENTE: bertolazzi2005, lot2016, dalbianco2018].
- En multicuerpo aparecen EAD [FUENTE: bertolazzi2005].
- dalbianco2019 compara ambos enfoques en problemas vehiculares [FUENTE: dalbianco2019].

### N5.5 Papers clave

| clave | aporte en una línea | etiqueta |
|---|---|---|
| casanova2000 | Inercia de guiñada en tiempo mínimo. | [VERIFICADA] |
| rucco2012 | Monopista con neumáticos y transferencia de carga. | [VERIFICADA] |
| kelly2010 | Método numérico que reemplaza al piloto. | [VERIFICADA] |
| perantoni2014 | F1 con optimización de reglajes. | [VERIFICADA] |
| limebeer2015 | F1 en pista 3D. | [VERIFICADA] |
| dalbianco2018 | GP2 multicuerpo con método indirecto. | [VERIFICADA] |
| leonelli2020 | Moto en pista 3D cerrada. | [VERIFICADA] |
| lovato2022 | Trayectoria libre cuasi-estacionaria en 3D. | [VERIFICADA] |
| subosits2021 | Fidelidad de modelo, de doble vía a masa puntual. | [VERIFICADA] |
| limebeer2018 | Libro de modelado y control óptimo vehicular. | [VERIFICADA] |

### N5.6 Huecos abiertos

- Existencia y relajación para modelos de cuerpo extendido [búsqueda negativa: N5 teoría].
- Convexidad de envolventes g-g-v [DESCONOCIDO].
- Justificación teórica de la reducción cuasi-estacionaria [búsqueda negativa parcial].

### N5.7 Relación con el trabajo evaluado

- El trabajo no entra en N5. Es masa puntual [FUENTE: 00_CONTEXTO].
- La escalera indica qué resultados de N3 podrían transferirse (ver sección 11.4).
- Las ideas de `PENDIENTES_MODELO.md` sobre bicicleta remiten a rucco2012 [FUENTE: PENDIENTES_MODELO, rucco2012].

---

## 10. Nivel N6 — Software y herramientas

| herramienta | lenguaje y licencia | qué hace [FUENTE] | qué no hace o no sé |
|---|---|---|---|
| tumftm_gto | Python; LGPL-3.0 | Camino más corto, curvatura mínima iterada, tiempo mínimo, mapas de fricción. Remite a heilmeier2020 y christ2021. | Interfaz web: [DESCONOCIDO]. Garantías teóricas: no las menciona el README [INFERENCIA]. |
| tumftm_lts | Python; LGPL-3.0 | Simulación cuasi-estacionaria de vuelta; incluye curvatura mínima. | Tiempo mínimo dinámico: [DESCONOCIDO]. |
| tumftm_rtdb | datos; LGPL-3.0 | Líneas medias, anchos y trayectorias de más de 20 pistas. | No optimiza. Sirve como banco de pruebas [INFERENCIA]. |
| tumftm_tph | Python (PyPI 0.79) | Funciones auxiliares de planificación. | — |
| openlap | MATLAB; GPL-3.0 | Vehículo, pista, recta y vuelta en módulos separados. | Optimización de trayectoria: [DESCONOCIDO]. |
| openlapsim | Python; GPL-3.0 | Simulación de vuelta en estado estacionario. | Trayectoria libre: [DESCONOCIDO]. |
| mpcc | C++ y MATLAB; Apache-2.0 | Control predictivo de contorno; sigue un camino de referencia. | No calcula la trayectoria global por sí solo [INFERENCIA]. |
| clothoids | C++; también en MATLAB File Exchange | Ajuste G1 y G2 con clotoides. | No optimiza tiempo [INFERENCIA]. |
| forzaeth | Python; licencia no declarada | Pila de carrera autónoma a escala. | Detalle: [DESCONOCIDO]. |
| andersson2019 (CasADi) | C++, Python, MATLAB | Modelado y solución de optimización con EDO. | — |
| waechter2006 (IPOPT) | C++ | Punto interior con filtro. | — |

- OpenAlex devuelve 47 trabajos para la consulta "OptimumLap" [FUENTE: registro de búsquedas].
- No verifiqué si todas son menciones reales [INFERENCIA].
- No leí descripciones de OptimumLap, ChassisSim ni Canopy. Sus funciones son [DESCONOCIDO].
- No encontré una herramienta web pública consolidada para ingresar una pista [búsqueda negativa: GitHub].
- Solo hallé repositorios menores con interfaz web, de seis estrellas o menos [FUENTE: GitHub].
- tumftm_gto es el competidor abierto más cercano a CG [INFERENCIA].
- Una aplicación web con dibujo libre de pista sería nueva como software [INFERENCIA].
- No sería un aporte matemático [INFERENCIA].

---

## 11. Entregables globales

### 11.1 Mapa de dependencias entre niveles

```
                 N0  Fundamentos
   (existencia Filippov–Cesari, PMP con estado y mixtas, periódico, Dubins)
          │                         │                          │
          ▼                         ▼                          ▼
   N1 camino fijo  ───────────►  N2 camino libre  ───────►  N5 cuerpo extendido
   (convexo, retículo,           (DTO dominante,            (convexidad perdida,
    adelante–atrás)               abscisa curvilínea)        reducción g-g-v)
          │                         │                          │
          │                         ▼                          │
          │                  N3 teoría funcional ◄─────────────┘
          │                  (existencia, v → 0, PMP,     (si la envolvente es convexa)
          │                   número de vueltas)
          ▼                         │
   N4 análisis numérico  ◄──────────┘
   (consistencia, Γ-convergencia, DTO/OTD, independencia de malla)
          │
          ▼
   N6 software (TUM, OpenLAP, CasADi/IPOPT, aplicación web)
```

- Las flechas indican "usa resultados de" [INFERENCIA].
- N3 es el nivel con menos literatura específica [búsqueda negativa].

### 11.2 Línea de tiempo de hitos

| año | hito | clave |
|---|---|---|
| 1957 | Caminos mínimos de curvatura acotada | dubins1957 [PARCIAL] |
| 1962 | Teorema de existencia tipo Filippov | filippov1962 [PARCIAL] |
| 1973 | Test frecuencial de control periódico | bittanti1973 |
| 1977 | Control periódico; uniones de arcos; semicontinuidad | gilbert1977, maurer1977, ioffe1977a |
| 1982 | Γ-convergencia en control óptimo | buttazzo1982 |
| 1983 | Tratado de Cesari | cesari1983 |
| 1984 | Período libre: condición suficiente | speyer1984 |
| 1985 | Tiempo mínimo sobre camino dado (robótica) | bobrow1985, shin1985 |
| 1986 | Independencia de malla | allgower1986 |
| 1989 | Control casi óptimo de vehículos de carrera | metz1989 [PARCIAL] |
| 1990 | Caminos con marcha atrás | reeds1990 |
| 1995 | Revisión de restricciones de estado | hartl1995 |
| 1996 | Aproximaciones consistentes; simulación inversa | schwartz1996, hendrikx1996 |
| 2000 | Transcripción directa en tiempo mínimo; Runge–Kutta | casanova2000, hager2000 |
| 2005 | Método indirecto multicuerpo; diagrama GG | bertolazzi2005, brayshaw2005 |
| 2008 | Condiciones necesarias en camino fijo; covectores | velenis2008, gong2008 |
| 2009 | Convexificación del camino fijo | verscheure2009 |
| 2010 | Restricciones mixtas; piloto ideal numérico | clarke2010, kelly2010 |
| 2014 | Abscisa curvilínea; convexidad en camino fijo; TMAI | lot2014, lipp2014, tmai2014 |
| 2015 | Pista 3D | perantoni2015, limebeer2015 |
| 2016 | Dos pasos; antecedente UTN | kapania2016, romero2016 |
| 2017 | Algoritmo lineal; Euler orden 1 | consolini2017, bonnans2017 |
| 2020 | Curvatura mínima abierta; trayectoria libre g-g; retículo | heilmeier2020, veneri2020, consolini2020lattice |
| 2021 | Revisión de tiempo de vuelta; fricción variable | massaro2021, christ2021 |
| 2022 | Revisión de carreras autónomas; 3D cuasi-estacionario | betz2022, lovato2022 |
| 2024–2025 | Restricciones continuas; convexo secuencial | elango2024, eshof2025 |

### 11.3 Autores y grupos activos

Afiliaciones según metadatos de OpenAlex de los trabajos leídos [FUENTE: metadatos OpenAlex]. Pueden estar desactualizadas.

| grupo (institución) | autores | claves |
|---|---|---|
| Universidad de Padua | Massaro, Lot, Lovato, Veneri, Dal Bianco | massaro2021, veneri2020, lovato2022, lovato2021, lot2014, lot2016, dalbianco2019 |
| Universidad de Trento | Biral, Bertolazzi, Frego, Palopoli, Fontanelli | frego2017, bertolazzi2018, dalbianco2019, lot2014 |
| Oxford; Johannesburgo; Pretoria | Limebeer, Perantoni, Leonelli | perantoni2014, limebeer2015, leonelli2020, massaro2021 |
| Stanford | Gerdes, Kapania, Subosits, Theodosis; Boyd, Lipp | kapania2016, subosits2021, theodosis2012, lipp2014 |
| TU Múnich | Lohmann, Lienkamp, Heilmeier, Christ, Wischnewski, Betz | heilmeier2020, christ2021, betz2022 |
| ETH Zúrich; UPenn | Morari, Liniger, Jain, Mangharam | liniger2015, jain2020, betz2022 |
| Universidad de Parma | Consolini, Locatelli, Minari, Laurini | consolini2017, consolini2020 |
| Georgia Tech | Tsiotras, Velenis | velenis2008 |
| Univ. de Australia del Sur | Kaya | kaya2017 |
| MIT; Arizona | Frazzoli, Sanfelice; Karaman | sanfelice2014, spasojevic2019 |
| École Polytechnique / Inria | Bonnans | bonnans2017 |

- Antecedente local: UTN Córdoba y FaMAF–UNC [FUENTE: romero2016, tmai2014].
- Los grupos de Padua y Trento trabajan OTD (método indirecto) [FUENTE: lot2014, bertolazzi2005].
- El grupo de TU Múnich publica código abierto [FUENTE: tumftm_gto].

### 11.4 Escalera de masa puntual a cuerpo extendido

| paso | modelo | conjunto de control o de velocidades | hipótesis que se pierde | etiqueta |
|---|---|---|---|---|
| N1 | masa puntual, camino fijo | intervalo en a_t, acoplado a b por la elipse | ninguna: problema convexo | [FUENTE: lipp2014; INFERENCIA] |
| N2–N3 | masa puntual, camino libre | elipse orientada E(x') | convexidad global; continuidad de E en x' = 0 | [INFERENCIA] |
| QSS | masa puntual con envolvente g-g-v | envolvente G(v) | forma elíptica explícita; convexidad de G | [FUENTE: veneri2020; DESCONOCIDO] |
| N5a | bicicleta | fuerzas de neumático con saturación | convexidad de f(x, U); estado de baja dimensión | [CONJETURA] |
| N5b | cuatro ruedas | deslizamientos por rueda; diferencial | lo anterior; estructura simple de la transferencia | [INFERENCIA] |
| N5c | pista 3D, moto, multicuerpo | EAD; geometría 3D | EDO explícita; pista plana | [FUENTE: bertolazzi2005, lovato2021; INFERENCIA] |

### 11.5 Diez referencias más cercanas al trabajo evaluado

| # | clave | por qué es cercana |
|---|---|---|
| 1 | tmai2014 | Misma formulación funcional de origen. |
| 2 | romero2016 | Masa puntual, elipse, MATLAB, mismo entorno académico. |
| 3 | veneri2020 | Trayectoria libre con modelo cuasi-estacionario de masa puntual. |
| 4 | kapania2016 | Separa perfil de velocidad y trayectoria, como el bi-nivel propuesto. |
| 5 | heilmeier2020 | Curvatura mínima y perfil adelante–atrás; código abierto. |
| 6 | christ2021 | Tiempo mínimo en vuelta cerrada con abscisa curvilínea. |
| 7 | velenis2008 | Condiciones necesarias para masa puntual en camino fijo. |
| 8 | consolini2020lattice | Existencia y unicidad en camino fijo. |
| 9 | sanfelice2014 | Condiciones necesarias de tiempo mínimo con curvatura acotada. |
| 10 | schwartz1996 | Plantilla de consistencia para CC. |

- La selección es [INFERENCIA]. La revisión de entrada recomendada es massaro2021.

### 11.6 Cobertura de los aportes candidatos (vista preliminar)

| aporte | literatura más cercana | estado | etiqueta |
|---|---|---|---|
| CA existencia | cesari1983, clarke2010, kaya2013 | sin precedente específico | [INFERENCIA] |
| CB cota o degeneración | reeds1990, galbraith2003 | sin precedente específico | [INFERENCIA] |
| CC Γ-convergencia | schwartz1996, buttazzo1982, elgindy2022 | marco general; sin caso Fourier + estado | [INFERENCIA] |
| CD optimalidad | velenis2008, sanfelice2014, clarke2010 | camino fijo resuelto; camino libre abierto | [INFERENCIA] |
| CE OTD | dalbianco2019, lot2014, allgower1986 | precedente parcial | [INFERENCIA] |
| CF coordenadas curvilíneas | lot2014, perantoni2014, christ2021 | precedente fuerte | [FUENTE; INFERENCIA] |
| CG software | tumftm_gto, openlap | precedente fuerte; web sin consolidar | [FUENTE; INFERENCIA] |

- La evaluación de novedad corresponde a la etapa 2.

---

## 12. Tabla de búsquedas (resumen por tema)

| tema | bases | n consultas | ejemplo de consulta | resultado |
|---|---|---|---|---|
| N0 arXiv | arXiv | 5 | all:"bounded curvature" AND all:"closed curves" | kaya (Markov–Dubins); elgindy (periódico). Resto: negativa. |
| N0.1 existencia (Filippov–Cesari) | OpenAlex | 12 | Filippov existence theorem optimal control [title_and_abstract.search] | Clásicos de Cesari; nada para vuelta periódica. Primera tanda con ruido alto. |
| N0.2 restricciones mixtas y de estado | OpenAlex | 10 | mixed state control constraints maximum principle [title_and_abstract.search] | hartl1995, bonnans2009, galbraith2003. |
| N0.2b mixtas (Clarke–de Pinho, revisiones) | OpenAlex | 5 | "optimal control problems with mixed constraints" Clarke | arutyunov2011; clarke2010 hallado por CrossRef. |
| N0.3 periódico con tiempo libre | OpenAlex | 10 | optimal periodic control free period [title_and_abstract.search] | gilbert1977, colonius1988. Existencia con período libre: negativa. |
| N0.3b periódico tiempo libre | OpenAlex | 5 | "periodic optimal control" "free" period necessary conditions | speyer1984 (período libre, segundo orden). |
| N0.4 Dubins y curvatura acotada | OpenAlex | 12 | Dubins curves bounded curvature [title_and_abstract.search] | boissonnat1994, kaya2017, ayala2018. |
| N0.4b curvas cerradas curvatura acotada | OpenAlex | 5 | "Pestov" "Ionin" | howard1995. 'Pestov Ionin': negativa. |
| N1.1 perfil de velocidad camino fijo | OpenAlex | 6 | "velocity profile" "fixed path" "minimum time" | pham2018, consolini, frego, bertolazzi2018. |
| N1.2 convexo / abscisa curvilínea | OpenAlex | 5 | "convex optimization" "speed" "fixed path" minimum time | verscheure2009, consolini2017. |
| N1.3 elipse de fricción y g-g | OpenAlex | 6 | "g-g diagram" "lap time" | brayshaw2005, massaro2024, lovato2022. |
| N1.4 existencia, unicidad, estructura | OpenAlex | 5 | "existence" "uniqueness" "velocity profile" "minimum time" | selvaratnam2022, spasojevic2019; consolini2020lattice vía web. |
| N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima | OpenAlex | 6 | "minimum curvature" "racing line" | jain2020, cardamone2010. Teoría: negativa. |
| N2.2 formulación en tiempo vs en abscisa | OpenAlex | 6 | "curvilinear coordinates" "minimum lap time" | lot2014, perantoni2014, liniger2015, lovato2021. |
| N2.3 dos pasos y relación curvatura–tiempo | OpenAlex | 5 | "two-step" "racing" trajectory "minimum curvature" "velocity profile" | kapania2016, heilmeier2020. Relación teórica: negativa. |
| N2.4 carreras autónomas | OpenAlex | 6 | "autonomous racing" survey | betz2022, rosolia2020, subosits2021. |
| N3 arXiv | arXiv | 6 | all:"racing line" | eshof2025, benham2020. Existencia: negativa. |
| N3.1 existencia del minimizante (circuito, masa puntual) | OpenAlex | 6 | "existence" "minimum lap time" | Solo sanfelice2014. Existencia: negativa. |
| N3.2 espacio natural y regularidad de curvas | OpenAlex | 5 | "bounded curvature" curves compactness "Arzela" | Ruido (geometría métrica). Negativa. |
| N3.3 principio del máximo en carreras | OpenAlex | 5 | "maximum principle" "minimum lap time" | Solo dalbianco2019 (indirecto). Teoría: negativa. |
| N3.4 v -> 0, paradas y pérdida de coercitividad | OpenAlex | 6 | "Dubins" "variable speed" "time-optimal" | golubev2010. Para la vuelta: negativa. |
| N3.5 número de vueltas bajo convergencia | OpenAlex | 5 | "winding number" "uniform convergence" curves | Negativa. |
| N4 arXiv | arXiv | 3 | ti:"algorithmic guide" AND ti:"optimal control" | caillau2022, neuenhofen2018. |
| N4.1 DTO vs OTD, covectores, adjuntos | OpenAlex | 5 | "discretize-then-optimize" "optimize-then-discretize" "optimal control" | gong2008, bonnans2006, oberblobaum2011. |
| N4.2 convergencia de colocación / pseudoespectral / RK | OpenAlex | 6 | "convergence" "pseudospectral" "optimal control" | dontchev2001, hager2016, hager2018, polak1997, schwartz1996, alt2012. |
| N4.3 independencia de malla | OpenAlex | 5 | "mesh independence" "optimal control" | allgower1986, dontchev2000mesh. |
| N4.4 Gamma-convergencia de discretizaciones | OpenAlex | 5 | "Gamma-convergence" "optimal control" discretization | buttazzo1982 por CrossRef. Fourier con estado: negativa. |
| N4.5 restricciones solo en nodos / semi-infinitas | OpenAlex | 6 | "constraint violation" "between collocation points" | nie2023, elango2024, loxton2009, hettich1993. |
| N4.6 Fourier en problemas periódicos | OpenAlex | 6 | "Fourier" "pseudospectral" "optimal control" periodic | elgindy2022. Fourier con bang-bang y estado: negativa. |
| N5 teoría: convexidad y relajación | OpenAlex | 6 | "relaxed controls" vehicle "optimal control" existence | Negativa. |
| N5a bicicleta (guiñada, dirección, transferencia) | OpenAlex | 5 | "single-track" "minimum lap time" "load transfer" | rucco2012, casanova2000, subosits2021. |
| N5b cuatro ruedas, neumáticos, diferencial | OpenAlex | 5 | "double-track" "minimum lap time" | perantoni2014, veneri2021, dalbianco2019. |
| N5c pista 3D, motocicleta, multicuerpo | OpenAlex | 5 | "three-dimensional" track "minimum lap time" | leonelli2020, lovato2021, lovato2022. |
| N6 software | GitHub, PyPI | 18 | racing line optimization (repositorios, orden estrellas) | TUM, OpenLAP, OpenLapSim, MPCC, Clothoids, ForzaETH. Web pública: negativa. |
| N6 software (literatura) | OpenAlex | 5 | "OptimumLap" | OptimumLap mencionado; funciones no verificadas. |
| Autores clave (CrossRef) | CrossRef | 50 | Clarke de Pinho 2010 Optimal control problems with mixed constraints SIAM Journa | 50 obras dirigidas; todas halladas por DOI. |
| Citas hacia adelante | OpenAlex (citantes) | 21 | cites:W2088363568 | Hallados consolini2020, spasojevic2019, bertolazzi2018, frego2017, massaro2024. |
| Semillas (CrossRef) | CrossRef, OpenAlex | 43 | Bobrow Dubowsky Gibson 1985 Time-optimal control of robotic manipulators along s | 42 semillas halladas. 3 con autores o año corregidos. |
| Verificación puntual | CrossRef, arXiv, web | 15 | ti:"optimal complexity algorithm" AND ti:"velocity planning" | Resúmenes de consolini2017, frego2017, lot2014; versiones arXiv. |
| grupos activos | OpenAlex (autorías) | 1 | instituciones de 40 trabajos clave | Afiliaciones de 40 trabajos clave. |
| hacia atrás | OpenAlex (referencias) | 1 | referenced_works de Massaro–Limebeer 2021 | 108 referencias de massaro2021; linaje clásico confirmado (metz1989, hendrikx1996, casanova2000). |

---

## 13. Tabla de referencias

| clave | nivel | etiqueta | autores | año | título | revista o editorial | vol(núm):págs | identificador | fuente del resumen |
|---|---|---|---|---|---|---|---|---|---|
| filippov1962 | N0 | [PARCIAL] | Filippov | 1962 | On Certain Questions in the Theory of Optimal Control | Journal of the Society for Industrial and Applied Mathematics Series A Control | 1(1):76--84 | doi:10.1137/0301006 | sin resumen (1962); texto no accesible |
| cesari1965 | N0 | [PARCIAL] | Cesari | 1965 | Existence Theorems for Optimal Solutions in Pontryagin and Lagrange Problems | Journal of the Society for Industrial and Applied Mathematics Series A Control | 3(3):475--498 | doi:10.1137/0303032 | sin resumen en las API |
| cesari1983 | N0 | [VERIFICADA] | Cesari | 1983 | Optimization—Theory and Applications | Springer New York |  | doi:10.1007/978-1-4613-8165-5 | descripción del editor (Springer) |
| ioffe1977a | N0 | [VERIFICADA] | Ioffe | 1977 | On Lower Semicontinuity of Integral Functionals. I | SIAM Journal on Control and Optimization | 15(4):521--538 | doi:10.1137/0315035 | OpenAlex |
| ioffe1977b | N0 | [VERIFICADA] | Ioffe | 1977 | On Lower Semicontinuity of Integral Functionals. II | SIAM Journal on Control and Optimization | 15(6):991--1000 | doi:10.1137/0315064 | OpenAlex |
| vinter2010 | N0 | [VERIFICADA] | Vinter | 2010 | Optimal Control | Birkhäuser Boston |  | doi:10.1007/978-0-8176-8086-2 | descripción del editor (OpenAlex) |
| clarke2013 | N0 | [VERIFICADA] | Clarke | 2013 | Functional Analysis, Calculus of Variations and Optimal Control | Graduate Texts in Mathematics |  | doi:10.1007/978-1-4471-4820-3 | descripción del editor (Springer), muy breve |
| hartl1995 | N0 | [VERIFICADA] | Hartl; Sethi; Vickson | 1995 | A Survey of the Maximum Principles for Optimal Control Problems with State Constraints | SIAM Review | 37(2):181--218 | doi:10.1137/1037043 | OpenAlex |
| maurer1977 | N0 | [VERIFICADA] | Maurer | 1977 | On Optimal Control Problems with Bounded State Variables and Control Appearing Linearly | SIAM Journal on Control and Optimization | 15(3):345--362 | doi:10.1137/0315023 | OpenAlex |
| bonnans2009 | N0 | [VERIFICADA] | Bonnans; Hermant | 2009 | Second-order analysis for optimal control problems with pure state constraints and mixed control-state constraints | Annales de l'Institut Henri Poincaré C, Analyse non linéaire | 26(2):561--598 | doi:10.1016/j.anihpc.2007.12.002 | OpenAlex |
| clarke2010 | N0 | [VERIFICADA] | Clarke; de Pinho | 2010 | Optimal Control Problems with Mixed Constraints | SIAM Journal on Control and Optimization | 48(7):4500--4524 | doi:10.1137/090757642 | OpenAlex |
| arutyunov2011 | N0 | [VERIFICADA] | Arutyunov; Karamzin; Pereira | 2011 | The Maximum Principle for Optimal Control Problems with State Constraints by R.V. Gamkrelidze: Revisited | Journal of Optimization Theory and Applications | 149(3):474--493 | doi:10.1007/s10957-011-9807-5 | Springer |
| galbraith2003 | N0 | [VERIFICADA] | Galbraith; Vinter | 2003 | Lipschitz Continuity of Optimal Controls for State Constrained Problems | SIAM Journal on Control and Optimization | 42(5):1727--1744 | doi:10.1137/s0363012902404711 | OpenAlex |
| gilbert1977 | N0 | [VERIFICADA] | Gilbert | 1977 | Optimal Periodic Control: A General Theory of Necessary Conditions | SIAM Journal on Control and Optimization | 15(5):717--746 | doi:10.1137/0315046 | OpenAlex |
| bittanti1973 | N0 | [VERIFICADA] | Bittanti; Fronza; Guardabassi | 1973 | Periodic control: A frequency domain approach | IEEE Transactions on Automatic Control | 18(1):33--38 | doi:10.1109/tac.1973.1100225 | OpenAlex |
| speyer1984 | N0 | [VERIFICADA] | Speyer; Evans | 1984 | A second variational theory for optimal periodic processes | IEEE Transactions on Automatic Control | 29(2):138--148 | doi:10.1109/tac.1984.1103482 | OpenAlex |
| colonius1988 | N0 | [PARCIAL] | Colonius | 1988 | Optimal Periodic Control | Lecture Notes in Mathematics |  | doi:10.1007/bfb0077931 | sin descripción accesible |
| dubins1957 | N0 | [PARCIAL] | Dubins | 1957 | On Curves of Minimal Length with a Constraint on Average Curvature, and with Prescribed Initial and Terminal Positions and Tangents | American Journal of Mathematics | 79(3):497 | doi:10.2307/2372560 | sin resumen (1957) |
| reeds1990 | N0 | [VERIFICADA] | Reeds; Shepp | 1990 | Optimal paths for a car that goes both forwards and backwards | Pacific Journal of Mathematics | 145(2):367--393 | doi:10.2140/pjm.1990.145.367 | OpenAlex |
| boissonnat1994 | N0 | [VERIFICADA] | Boissonnat; Cérézo; Leblond | 1994 | Shortest paths of bounded curvature in the plane | Journal of Intelligent &amp; Robotic Systems | 11(1-2):5--20 | doi:10.1007/bf01258291 | Springer |
| kaya2017 | N0 | [VERIFICADA] | Kaya | 2017 | Markov–Dubins path via optimal control theory | Computational Optimization and Applications | 68(3):719--747 | doi:10.1007/s10589-017-9923-8 | OpenAlex |
| ayala2018 | N0 | [VERIFICADA] | Ayala; Kirszenblat; Rubinstein | 2018 | A Geometric approach to shortest bounded curvature paths | Communications in Analysis and Geometry | 26(4):679--697 | doi:10.4310/cag.2018.v26.n4.a1 | OpenAlex |
| howard1995 | N0 | [PARCIAL] | Howard; Treibergs | 1995 | A Reverse Isoperimetric Inequality, Stability and Extremal Theorems for Plane Curves with Bounded Curvature | Rocky Mountain Journal of Mathematics | 25(2) | doi:10.1216/rmjm/1181072242 | sin resumen en las API |
| saba2014 | N0 | [VERIFICADA] | Saba; Schneider; Hormann et al. | 2014 | Curvature-based blending of closed planar curves | Graphical Models | 76(5):263--272 | doi:10.1016/j.gmod.2014.04.005 | texto local (D:\ESCRI\trabajofinal) |
| bobrow1985 | N1 | [VERIFICADA] | Bobrow; Dubowsky; Gibson | 1985 | Time-Optimal Control of Robotic Manipulators Along Specified Paths | The International Journal of Robotics Research | 4(3):3--17 | doi:10.1177/027836498500400301 | OpenAlex |
| shin1985 | N1 | [VERIFICADA] | Shin; McKay | 1985 | Minimum-time control of robotic manipulators with geometric path constraints | IEEE Transactions on Automatic Control | 30(6):531--541 | doi:10.1109/tac.1985.1104009 | OpenAlex |
| verscheure2009 | N1 | [VERIFICADA] | Verscheure; Demeulenaere; Swevers et al. | 2009 | Time-Optimal Path Tracking for Robots: A Convex Optimization Approach | IEEE Transactions on Automatic Control | 54(10):2318--2327 | doi:10.1109/tac.2009.2028959 | OpenAlex |
| lipp2014 | N1 | [VERIFICADA] | Lipp; Boyd | 2014 | Minimum-time speed optimisation over a fixed path | International Journal of Control | 87(6):1297--1311 | doi:10.1080/00207179.2013.875224 | OpenAlex |
| velenis2005a | N1 | [VERIFICADA] | Velenis; Tsiotras | 2005 | Optimal velocity profile generation for given acceleration limits: theoretical analysis | Proceedings of the 2005, American Control Conference, 2005. | :1478--1483 | doi:10.1109/acc.2005.1470174 | OpenAlex |
| velenis2005b | N1 | [VERIFICADA] | Velenis; Tsiotras | 2005 | Optimal velocity profile generation for given acceleration limits: receding horizon implementation | Proceedings of the 2005, American Control Conference, 2005. | :2147--2152 | doi:10.1109/acc.2005.1470288 | OpenAlex |
| velenis2008 | N1 | [VERIFICADA] | Velenis; Tsiotras | 2008 | Minimum-Time Travel for a Vehicle with Acceleration Limits: Theoretical Analysis and Receding-Horizon Implementation | Journal of Optimization Theory and Applications | 138(2):275--296 | doi:10.1007/s10957-008-9381-7 | Springer |
| consolini2017 | N1 | [VERIFICADA] | Consolini; Locatelli; Minari et al. | 2017 | An optimal complexity algorithm for minimum-time velocity planning | Systems &amp; Control Letters | 103:50--57 | doi:10.1016/j.sysconle.2017.02.001 | web (ScienceDirect) |
| consolini2020lattice | N1 | [VERIFICADA] | Consolini; Laurini; Locatelli et al. | 2020 | A solution of the minimum-time speed planning problem based on lattice theory | Journal of the Franklin Institute | 357(12):7617--7637 | doi:10.1016/j.jfranklin.2020.05.024 | arXiv:1809.01959 |
| consolini2020 | N1 | [VERIFICADA] | Consolini; Laurini; Locatelli et al. | 2020 | Convergence Analysis of Spatial-Sampling-Based Algorithms for Time-Optimal Smooth Velocity Planning | Journal of Optimization Theory and Applications | 184(3):1083--1108 | doi:10.1007/s10957-019-01626-4 | Springer |
| frego2017 | N1 | [VERIFICADA] | Frego; Bertolazzi; Biral et al. | 2017 | Semi-analytical minimum time solutions with velocity constraints for trajectory following of vehicles | Automatica | 86:18--28 | doi:10.1016/j.automatica.2017.08.020 | web (ResearchGate) |
| bertolazzi2018 | N1 | [VERIFICADA] | Bertolazzi; Frego | 2018 | Semianalytical minimum‐time solution for the optimal control of a vehicle subject to limited acceleration | Optimal Control Applications and Methods | 39(2):774--791 | doi:10.1002/oca.2376 | OpenAlex |
| pham2018 | N1 | [VERIFICADA] | Pham; Pham | 2018 | A New Approach to Time-Optimal Path Parameterization Based on Reachability Analysis | IEEE Transactions on Robotics | 34(3):645--659 | doi:10.1109/tro.2018.2819195 | OpenAlex |
| spasojevic2019 | N1 | [VERIFICADA] | Spasojevic; Murali; Karaman | 2019 | Asymptotic Optimality of a Time Optimal Path Parametrization Algorithm | IEEE Control Systems Letters | 3(4):835--840 | doi:10.1109/lcsys.2019.2919809 | OpenAlex |
| selvaratnam2022 | N1 | [VERIFICADA] | Selvaratnam; Cantoni; Manzie | 2022 | Explicit Time-Optimal Speed Profiles for Planar Paths with Monotone Curvature | arXiv |  | arxiv:2208.12135 | arXiv |
| brayshaw2005 | N1 | [VERIFICADA] | Brayshaw; Harrison | 2005 | A quasi steady state approach to race car lap simulation in order to understand the effects of racing line and centre of gravity location | Proceedings of the Institution of Mechanical Engineers, Part D: Journal of Automobile Engineering | 219(6):725--739 | doi:10.1243/095440705x11211 | OpenAlex |
| massaro2024 | N1 | [VERIFICADA] | Massaro; Lovato; Veneri | 2024 | An optimal control approach to the computation of g-g diagrams | Vehicle System Dynamics | 62(2):448--462 | doi:10.1080/00423114.2023.2178467 | OpenAlex |
| metz1989 | N2 | [PARCIAL] | Metz; Williams | 1989 | Near time-optimal control of racing vehicles | Automatica | 25(6):841--857 | doi:10.1016/0005-1098(89)90052-6 | sin resumen en las API |
| hendrikx1996 | N2 | [VERIFICADA] | HENDRIKX; MEIJLINK; KRIENS | 1996 | Application of Optimal Control Theory to Inverse Simulation of Car Handling | Vehicle System Dynamics | 26(6):449--461 | doi:10.1080/00423119608969319 | OpenAlex |
| casanova2000 | N2 | [VERIFICADA] | Casanova; Sharp; Symonds | 2000 | Minimum Time Manoeuvring: The Significance of Yaw Inertia | Vehicle System Dynamics | 34(2):77--115 | doi:10.1076/0042-3114(200008)34:2;1-g;ft077 | OpenAlex |
| braghin2008 | N2 | [PARCIAL] | Braghin; Cheli; Melzi et al. | 2008 | Race driver model | Computers &amp; Structures | 86(13-14):1503--1516 | doi:10.1016/j.compstruc.2007.04.028 | sin resumen en las API |
| kelly2010 | N2 | [VERIFICADA] | Kelly; Sharp | 2010 | Time-optimal control of the race car: a numerical method to emulate the ideal driver | Vehicle System Dynamics | 48(12):1461--1474 | doi:10.1080/00423110903514236 | OpenAlex |
| theodosis2012 | N2 | [VERIFICADA] | Theodosis; Gerdes | 2012 | Nonlinear Optimization of a Racing Line for an Autonomous Racecar Using Professional Driving Techniques | ASME 2012 5th Annual Dynamic Systems and Control Conference joint with the JSME 2012 11th Motion and Vibration Conference |  | doi:10.1115/dscc2012-movic2012-8620 | OpenAlex |
| lot2014 | N2 | [VERIFICADA] | Lot; Biral | 2014 | A Curvilinear Abscissa Approach for the Lap Time Optimization of Racing Vehicles | IFAC Proceedings Volumes | 47(3):7559--7565 | doi:10.3182/20140824-6-za-1003.00868 | web (Semantic Scholar) |
| kapania2016 | N2 | [VERIFICADA] | Kapania; Subosits; Gerdes | 2016 | A Sequential Two-Step Algorithm for Fast Generation of Vehicle Racing Trajectories | Journal of Dynamic Systems, Measurement, and Control | 138(9):091005 | doi:10.1115/1.4033311 | OpenAlex |
| heilmeier2020 | N2 | [VERIFICADA] | Heilmeier; Wischnewski; Hermansdorfer et al. | 2020 | Minimum curvature trajectory planning and control for an autonomous race car | Vehicle System Dynamics | 58(10):1497--1527 | doi:10.1080/00423114.2019.1631455 | OpenAlex |
| christ2021 | N2 | [VERIFICADA] | Christ; Wischnewski; Heilmeier et al. | 2021 | Time-optimal trajectory planning for a race car considering variable tyre-road friction coefficients | Vehicle System Dynamics | 59(4):588--612 | doi:10.1080/00423114.2019.1704804 | OpenAlex |
| veneri2020 | N2 | [VERIFICADA] | Veneri; Massaro | 2020 | A free-trajectory quasi-steady-state optimal-control method for minimum lap-time of race vehicles | Vehicle System Dynamics | 58(6):933--954 | doi:10.1080/00423114.2019.1608364 | OpenAlex |
| jain2020 | N2 | [VERIFICADA] | Jain; Morari | 2020 | Computing the racing line using Bayesian optimization | 2020 59th IEEE Conference on Decision and Control (CDC) | :6192--6197 | doi:10.1109/cdc42340.2020.9304147 | OpenAlex |
| liniger2015 | N2 | [VERIFICADA] | Liniger; Domahidi; Morari | 2015 | Optimization‐based autonomous racing of 1:43 scale RC cars | Optimal Control Applications and Methods | 36(5):628--647 | doi:10.1002/oca.2123 | OpenAlex |
| timings2013 | N2 | [VERIFICADA] | Timings; Cole | 2013 | Minimum Maneuver Time Calculation Using Convex Optimization | Journal of Dynamic Systems, Measurement, and Control | 135(3):031015 | doi:10.1115/1.4023400 | OpenAlex |
| cardamone2010 | N2 | [VERIFICADA] | Cardamone; Loiacono; Lanzi et al. | 2010 | Searching for the optimal racing line using genetic algorithms | Proceedings of the 2010 IEEE Conference on Computational Intelligence and Games | :388--394 | doi:10.1109/itw.2010.5593330 | OpenAlex |
| sharp2011 | N2 | [VERIFICADA] | Sharp; Peng | 2011 | Vehicle dynamics applications of optimal control theory | Vehicle System Dynamics | 49(7):1073--1111 | doi:10.1080/00423114.2011.586707 | OpenAlex |
| limebeer2015csm | N2 | [VERIFICADA] | Limebeer; Rao | 2015 | Faster, Higher, and Greener: Vehicular Optimal Control | IEEE Control Systems | 35(2):36--56 | doi:10.1109/mcs.2014.2384951 | OpenAlex |
| massaro2021 | N2 | [VERIFICADA] | Massaro; Limebeer | 2021 | Minimum-lap-time optimisation and simulation | Vehicle System Dynamics | 59(7):1069--1113 | doi:10.1080/00423114.2021.1910718 | OpenAlex |
| betz2022 | N2 | [VERIFICADA] | Betz; Zheng; Liniger et al. | 2022 | Autonomous Vehicles on the Edge: A Survey on Autonomous Vehicle Racing | IEEE Open Journal of Intelligent Transportation Systems | 3:458--488 | doi:10.1109/ojits.2022.3181510 | OpenAlex |
| rosolia2020 | N2 | [VERIFICADA] | Rosolia; Borrelli | 2020 | Learning How to Autonomously Race a Car: A Predictive Control Approach | IEEE Transactions on Control Systems Technology | 28(6):2713--2719 | doi:10.1109/tcst.2019.2948135 | OpenAlex |
| eshof2025 | N2 | [VERIFICADA] | van den Eshof; de Vries; van Kampen et al. | 2025 | A Sequential Convex Programming Approach to Free-trajectory Minimum-lap-time Optimization of Racing Cars | arXiv |  | arxiv:2511.13522 | arXiv |
| xiong2010 | N2 | [VERIFICADA] | Xiong | 2010 | Racing Line Optimization | Massachusetts Institute of Technology |  | local:706825301-MIT.pdf | texto local |
| vankoutrik2015 | N2 | [VERIFICADA] | van Koutrik | 2015 | Optimal Control for Race Car Minimum Time Maneuvering | Delft University of Technology |  | local:mscThesis_SvenvanKoutrik.pdf | texto local |
| romero2016 | N2 | [VERIFICADA] | Romero; Bottaro; López et al. | 2016 | Optimización de trayectorias en circuitos de competición automovilísticas | Mecánica Computacional, Vol. XXXIV | :3273--3289 | local:5200-22400-1-PB.pdf | texto local |
| tmai2014 | N2 | [VERIFICADA] | Argañaraz; Castillo; Díaz Martín et al. | 2014 | Optimización del tiempo de vuelta para un auto de TC | Taller de Matemática Aplicada a la Industria 2014, FaMAF--UNC |  | local:tmai14.pdf | texto local |
| sanfelice2014 | N3 | [VERIFICADA] | Sanfelice; Yong; Frazzoli | 2014 | On minimum-time paths of bounded curvature with position-dependent constraints | Automatica | 50(2):537--546 | doi:10.1016/j.automatica.2013.11.016 | arXiv:1310.2578 |
| kaya2013 | N3 | [VERIFICADA] | Kaya; Noakes | 2013 | Finding Interpolating Curves Minimizing $L^\infty$ Acceleration in the Euclidean Space via Optimal Control Theory | SIAM Journal on Control and Optimization | 51(1):442--464 | doi:10.1137/12087880x | OpenAlex |
| kaya2019 | N3 | [VERIFICADA] | Kaya | 2019 | Markov–Dubins interpolating curves | Computational Optimization and Applications | 73(2):647--677 | doi:10.1007/s10589-019-00076-y | Springer |
| benham2020 | N3 | [VERIFICADA] | Benham; Cohen; Brunet et al. | 2020 | Brachistochrone on a velodrome | Proceedings of the Royal Society A: Mathematical, Physical and Engineering Sciences | 476(2238):20200153 | doi:10.1098/rspa.2020.0153 | OpenAlex |
| golubev2010 | N3 | [VERIFICADA] | Golubev | 2010 | Brachistochrone with friction | Journal of Computer and Systems Sciences International | 49(5):719--730 | doi:10.1134/s1064230710050060 | OpenAlex |
| hager2000 | N4 | [VERIFICADA] | Hager | 2000 | Runge-Kutta methods in optimal control and the transformed adjoint system | Numerische Mathematik | 87(2):247--282 | doi:10.1007/s002110000178 | Springer |
| dontchev1993 | N4 | [VERIFICADA] | Dontchev; Hager | 1993 | Lipschitzian Stability in Nonlinear Control and Optimization | SIAM Journal on Control and Optimization | 31(3):569--603 | doi:10.1137/0331026 | OpenAlex |
| dontchev2000rk | N4 | [VERIFICADA] | Dontchev; Hager; Veliov | 2000 | Second-Order Runge--Kutta Approximations in Control Constrained Optimal Control | SIAM Journal on Numerical Analysis | 38(1):202--226 | doi:10.1137/s0036142999351765 | OpenAlex |
| dontchev2001 | N4 | [VERIFICADA] | Dontchev; Hager | 2001 | The Euler approximation in state constrained optimal control | Mathematics of Computation | 70(233):173--203 | doi:10.1090/s0025-5718-00-01184-4 | OpenAlex |
| bonnans2017 | N4 | [VERIFICADA] | Bonnans; Festa | 2017 | Error Estimates for the Euler Discretization of an Optimal Control Problem with First-Order State Constraints | SIAM Journal on Numerical Analysis | 55(2):445--471 | doi:10.1137/140999621 | OpenAlex |
| malanowski1998 | N4 | [VERIFICADA] | Malanowski; Büskens; Maurer | 1998 | Convergence of Approximations to Nonlinear Optimal Control Problems | Mathematical Programming with Data Perturbations | :253--284 | doi:10.1201/9781003072119-12 | OpenAlex |
| veliov1997 | N4 | [VERIFICADA] | Veliov | 1997 | On the Time-Discretization of Control Systems | SIAM Journal on Control and Optimization | 35(5):1470--1486 | doi:10.1137/s0363012995288987 | OpenAlex |
| alt2012 | N4 | [VERIFICADA] | Alt; Baier; Gerdts et al. | 2012 | Error bounds for Euler approximation of linear-quadratic control problems with bang-bang solutions | Numerical Algebra, Control and Optimization | 2(3):547--570 | doi:10.3934/naco.2012.2.547 | OpenAlex |
| schwartz1996 | N4 | [VERIFICADA] | Schwartz; Polak | 1996 | Consistent Approximations for Optimal Control Problems Based on Runge–Kutta Integration | SIAM Journal on Control and Optimization | 34(4):1235--1269 | doi:10.1137/s0363012994267352 | OpenAlex |
| polak1997 | N4 | [VERIFICADA] | Polak | 1997 | Optimization | Applied Mathematical Sciences |  | doi:10.1007/978-1-4612-0663-7 | descripción del editor (Springer) |
| buttazzo1982 | N4 | [VERIFICADA] | Buttazzo; Dal Maso | 1982 | Γ-convergence and optimal control problems | Journal of Optimization Theory and Applications | 38(3):385--407 | doi:10.1007/bf00935345 | Springer |
| braides2002 | N4 | [VERIFICADA] | Braides | 2002 | Gamma-Convergence for Beginners | Oxford University Press |  | doi:10.1093/acprof:oso/9780198507840.001.0001 | OpenAlex |
| dalmaso1993 | N4 | [VERIFICADA] | Dal Maso | 1993 | An Introduction to Γ-Convergence | Birkhäuser Boston |  | doi:10.1007/978-1-4612-0327-8 | índice (OpenAlex) |
| gong2008 | N4 | [VERIFICADA] | Gong; Ross; Kang et al. | 2008 | Connections between the covector mapping theorem and convergence of pseudospectral methods for optimal control | Computational Optimization and Applications | 41(3):307--335 | doi:10.1007/s10589-007-9102-4 | Springer |
| kang2007 | N4 | [VERIFICADA] | Kang; Gong; Ross et al. | 2007 | On the convergence of nonlinear optimal control using pseudospectral methods for feedback linearizable systems | International Journal of Robust and Nonlinear Control | 17(14):1251--1277 | doi:10.1002/rnc.1166 | OpenAlex |
| hager2016 | N4 | [VERIFICADA] | Hager; Hou; Rao | 2016 | Convergence Rate for a Gauss Collocation Method Applied to Unconstrained Optimal Control | Journal of Optimization Theory and Applications | 169(3):801--824 | doi:10.1007/s10957-016-0929-7 | OpenAlex |
| hager2018 | N4 | [VERIFICADA] | Hager; Liu; Mohapatra et al. | 2018 | Convergence Rate for a Gauss Collocation Method Applied to Constrained Optimal Control | SIAM Journal on Control and Optimization | 56(2):1386--1411 | doi:10.1137/16m1096761 | OpenAlex |
| allgower1986 | N4 | [VERIFICADA] | Allgower; Böhmer; Potra et al. | 1986 | A Mesh-Independence Principle for Operator Equations and Their Discretizations | SIAM Journal on Numerical Analysis | 23(1):160--169 | doi:10.1137/0723011 | OpenAlex |
| dontchev2000mesh | N4 | [VERIFICADA] | Dontchev; Hager; Veliov | 2000 | Uniform Convergence and Mesh Independence of Newton's Method for Discretized Variational Problems | SIAM Journal on Control and Optimization | 39(3):961--980 | doi:10.1137/s0363012998338570 | OpenAlex |
| hettich1993 | N4 | [VERIFICADA] | Hettich; Kortanek | 1993 | Semi-Infinite Programming: Theory, Methods, and Applications | SIAM Review | 35(3):380--429 | doi:10.1137/1035089 | OpenAlex |
| loxton2009 | N4 | [PARCIAL] | Loxton; Teo; Rehbock et al. | 2009 | Optimal control problems with a continuous inequality constraint on the state and the control | Automatica | 45(10):2250--2257 | doi:10.1016/j.automatica.2009.05.029 | sin resumen en las API |
| nie2023 | N4 | [VERIFICADA] | Nie; Kerrigan | 2023 | Solving Dynamic Optimization Problems to a Specified Accuracy: An Alternating Approach Using Integrated Residuals | IEEE Transactions on Automatic Control | 68(1):548--555 | doi:10.1109/tac.2022.3144131 | OpenAlex |
| neuenhofen2018 | N4 | [VERIFICADA] | Neuenhofen; Kerrigan | 2018 | Dynamic Optimization with Convergence Guarantees | arXiv |  | arxiv:1810.04059 | arXiv |
| elango2024 | N4 | [VERIFICADA] | Elango; Luo; Kamath et al. | 2024 | Successive Convexification for Trajectory Optimization with Continuous-Time Constraint Satisfaction | arXiv |  | arxiv:2404.16826 | arXiv |
| elgindy2022 | N4 | [VERIFICADA] | Elgindy | 2022 | Numerical Solution of Nonlinear Periodic Optimal Control Problems Using a Fourier Integral Pseudospectral Method | arXiv |  | arxiv:2208.04305 | arXiv |
| bonnans2006 | N4 | [VERIFICADA] | Bonnans; Laurent-Varin | 2006 | Computation of order conditions for symplectic partitioned Runge-Kutta schemes with application to optimal control | Numerische Mathematik | 103(1):1--10 | doi:10.1007/s00211-005-0661-y | OpenAlex |
| dalbianco2019 | N4 | [VERIFICADA] | Dal Bianco; Bertolazzi; Biral et al. | 2019 | Comparison of direct and indirect methods for minimum lap time optimal control problems | Vehicle System Dynamics | 57(5):665--696 | doi:10.1080/00423114.2018.1480048 | OpenAlex |
| caillau2022 | N4 | [VERIFICADA] | Caillau; Ferretti; Trélat et al. | 2022 | An algorithmic guide for finite-dimensional optimal control problems | arXiv |  | arxiv:2212.03157 | arXiv |
| gerdts2012 | N4 | [VERIFICADA] | Gerdts | 2012 | Optimal Control of ODEs and DAEs | DE GRUYTER |  | doi:10.1515/9783110249996 | OpenAlex |
| oberblobaum2011 | N4 | [VERIFICADA] | Ober-Blöbaum; Junge; Marsden | 2011 | Discrete mechanics and optimal control: An analysis | ESAIM: Control, Optimisation and Calculus of Variations | 17(2):322--352 | doi:10.1051/cocv/2010012 | OpenAlex |
| betts2010 | N4 | [PARCIAL] | Betts | 2010 | Practical Methods for Optimal Control and Estimation Using Nonlinear Programming | Society for Industrial and Applied Mathematics |  | doi:10.1137/1.9780898718577 | sin descripción leída |
| bertolazzi2005 | N4 | [VERIFICADA] | Bertolazzi; Biral; Da Lio | 2005 | Symbolic–Numeric Indirect Method for Solving Optimal Control Problems for Large Multibody Systems | Multibody System Dynamics | 13(2):233--252 | doi:10.1007/s11044-005-3987-4 | Springer |
| rucco2012 | N5 | [VERIFICADA] | Rucco; Notarstefano; Hauser | 2012 | Computing minimum lap-time trajectories for a single-track car with load transfer | 2012 IEEE 51st IEEE Conference on Decision and Control (CDC) | :6321--6326 | doi:10.1109/cdc.2012.6426265 | OpenAlex |
| perantoni2014 | N5 | [VERIFICADA] | Perantoni; Limebeer | 2014 | Optimal control for a Formula One car with variable parameters | Vehicle System Dynamics | 52(5):653--678 | doi:10.1080/00423114.2014.889315 | OpenAlex |
| perantoni2015 | N5 | [VERIFICADA] | Perantoni; Limebeer | 2015 | Optimal Control of a Formula One Car on a Three-Dimensional Track—Part 1: Track Modeling and Identification | Journal of Dynamic Systems, Measurement, and Control | 137(5):051018 | doi:10.1115/1.4028253 | OpenAlex |
| limebeer2015 | N5 | [VERIFICADA] | Limebeer; Perantoni | 2015 | Optimal Control of a Formula One Car on a Three-Dimensional Track—Part 2: Optimal Control | Journal of Dynamic Systems, Measurement, and Control | 137(5):051019 | doi:10.1115/1.4029466 | OpenAlex |
| lot2016 | N5 | [VERIFICADA] | Lot; Dal Bianco | 2016 | Lap time optimisation of a racing go-kart | Vehicle System Dynamics | 54(2):210--230 | doi:10.1080/00423114.2015.1125514 | OpenAlex |
| dalbianco2018 | N5 | [VERIFICADA] | Dal Bianco; Lot; Gadola | 2018 | Minimum time optimal control simulation of a GP2 race car | Proceedings of the Institution of Mechanical Engineers, Part D: Journal of Automobile Engineering | 232(9):1180--1195 | doi:10.1177/0954407017728158 | web (SAGE) |
| leonelli2020 | N5 | [VERIFICADA] | Leonelli; Limebeer | 2020 | Optimal control of a road racing motorcycle on a three-dimensional closed track | Vehicle System Dynamics | 58(8):1285--1309 | doi:10.1080/00423114.2019.1617886 | OpenAlex |
| lovato2022 | N5 | [VERIFICADA] | Lovato; Massaro | 2022 | A three-dimensional free-trajectory quasi-steady-state optimal-control method for minimum-lap-time of race vehicles | Vehicle System Dynamics | 60(5):1512--1530 | doi:10.1080/00423114.2021.1878242 | OpenAlex |
| lovato2021 | N5 | [VERIFICADA] | Lovato; Massaro; Limebeer | 2021 | Curved-ribbon-based track modelling for minimum lap-time optimisation | Meccanica | 56(8):2139--2152 | doi:10.1007/s11012-021-01387-3 | OpenAlex |
| limebeer2018 | N5 | [VERIFICADA] | Limebeer; Massaro | 2018 | Dynamics and Optimal Control of Road Vehicles | Oxford University PressOxford |  | doi:10.1093/oso/9780198825715.001.0001 | OpenAlex |
| veneri2021 | N5 | [VERIFICADA] | Veneri; Massaro | 2021 | The effect of Ackermann steering on the performance of race cars | Vehicle System Dynamics | 59(6):907--927 | doi:10.1080/00423114.2020.1730917 | OpenAlex |
| subosits2021 | N5 | [VERIFICADA] | Subosits; Gerdes | 2021 | Impacts of Model Fidelity on Trajectory Optimization for Autonomous Vehicles in Extreme Maneuvers | IEEE Transactions on Intelligent Vehicles | 6(3):546--558 | doi:10.1109/tiv.2021.3051325 | OpenAlex |
| velenis2008trail | N5 | [PARCIAL] | Velenis; Tsiotras; Lu | 2008 | Optimality Properties and Driver Input Parameterization for Trail-braking Cornering | European Journal of Control | 14(4):308--320 | doi:10.3166/ejc.14.308-320 | sin resumen en las API |
| andersson2019 | N6 | [VERIFICADA] | Andersson; Gillis; Horn et al. | 2019 | CasADi: a software framework for nonlinear optimization and optimal control | Mathematical Programming Computation | 11(1):1--36 | doi:10.1007/s12532-018-0139-4 | texto completo (repositorio KU Leuven) |
| waechter2006 | N6 | [VERIFICADA] | Wächter; Biegler | 2006 | On the implementation of an interior-point filter line-search algorithm for large-scale nonlinear programming | Mathematical Programming | 106(1):25--57 | doi:10.1007/s10107-004-0559-y | Springer |
| tumftm_gto | N6 | [VERIFICADA] | TUMFTM | 2026 | global\_racetrajectory\_optimization | GitHub |  | url:https://github.com/TUMFTM/global_racetrajectory_optimization | README (GitHub) |
| tumftm_lts | N6 | [VERIFICADA] | TUMFTM | 2026 | laptime-simulation | GitHub |  | url:https://github.com/TUMFTM/laptime-simulation | README (GitHub) |
| tumftm_rtdb | N6 | [VERIFICADA] | TUMFTM | 2026 | racetrack-database | GitHub |  | url:https://github.com/TUMFTM/racetrack-database | README (GitHub) |
| tumftm_tph | N6 | [VERIFICADA] | TUMFTM | 2026 | trajectory\_planning\_helpers | GitHub |  | url:https://github.com/TUMFTM/trajectory_planning_helpers | descripción (GitHub, PyPI v0.79) |
| openlap | N6 | [VERIFICADA] | mc12027 | 2026 | OpenLAP-Lap-Time-Simulator | GitHub |  | url:https://github.com/mc12027/OpenLAP-Lap-Time-Simulator | README (GitHub) |
| openlapsim | N6 | [VERIFICADA] | dstrassera | 2026 | OpenLapSim | GitHub |  | url:https://github.com/dstrassera/OpenLapSim | README (GitHub) |
| mpcc | N6 | [VERIFICADA] | alexliniger | 2026 | MPCC | GitHub |  | url:https://github.com/alexliniger/MPCC | README (GitHub) |
| clothoids | N6 | [VERIFICADA] | ebertolazzi | 2026 | Clothoids | GitHub |  | url:https://github.com/ebertolazzi/Clothoids | README (GitHub) |
| forzaeth | N6 | [VERIFICADA] | ForzaETH | 2026 | race\_stack | GitHub |  | url:https://github.com/ForzaETH/race_stack | descripción (GitHub) |

---

## 14. Incertidumbres

1. Las búsquedas negativas de N3, N4.4, N4.6 y N5 no prueban ausencia.
2. No consulté MathSciNet, zbMATH, Scopus, Web of Science ni Google Scholar.
3. Las tesis doctorales no indexadas pueden contener resultados de N3.
4. Leí resúmenes, no textos completos. Las [FUENTE] se limitan a ellos.
5. Diez referencias quedaron [PARCIAL]. No sostienen afirmaciones de contenido.
6. Los enunciados de existencia tipo Filippov son reconstruidos. No los leí en la fuente.
7. Los libros se verificaron por descripción del editor o índice.
8. Las afiliaciones vienen de OpenAlex y pueden estar desactualizadas.
9. Las herramientas comerciales de N6 quedaron sin verificar.
10. El orden por relevancia de OpenAlex puede ocultar trabajos pertinentes.
11. El análisis de N3.4 y N3.5 es propio. Debe revisarse con rigor en la etapa 2.
12. La extensión de E en x' = 0 es una elección de modelado. Puede no ser física.

---

## 15. Preguntas para el autor

1. ¿"Número de vueltas" es winding number alrededor de un punto o índice de giro de la tangente?
2. ¿La teoría debe cubrir μt ≠ μn? Con μt = μn desaparece el problema en x' = 0.
3. ¿Acepta el disco de radio g·max(μt, μn) como extensión en x' = 0?
4. ¿Qué regularidad quiere para los bordes de la pista: C², C^{1,1} o Lipschitz?
5. ¿Interesa solo la vuelta lanzada periódica o también la salida detenida?
6. ¿Tiene acceso a MathSciNet, zbMATH o Scopus para la etapa 2?
7. ¿Tiene acceso al texto de filippov1962, cesari1983 y clarke2013?
8. ¿Prioriza en la etapa 2 los aportes teóricos (CA–CD) o los aplicados (CE–CG)?
9. ¿Mantiene μn = 7 y μt = 1,9 en los casos de referencia?
10. ¿Corrige xiong2010 a tesis de maestría en la bibliografía de la tesis?
11. ¿Quiere comparar resultados con romero2016 en las mismas pistas?
12. ¿Autoriza registrar esta etapa en `v2\ESTADO.md`? No lo modifiqué.

---

## Apéndice A — Registro completo de búsquedas

Columnas: id, fecha, base, consulta, n (coincidencias informadas por la base), nota, tema.
En OpenAlex, n es el total de coincidencias del índice, no los resultados revisados.
Se revisaron los primeros 25 por consulta, salvo indicación.

| id | fecha | base | consulta | n | nota | tema |
|---|---|---|---|---|---|---|
| 1 | 2026-10-01 | CrossRef | Bobrow Dubowsky Gibson 1985 Time-optimal control of robotic manipulators along specified paths | 3 |  | semilla S01 |
| 2 | 2026-10-01 | CrossRef | Shin McKay 1985 Minimum-time control of robotic manipulators with geometric path constraints | 3 |  | semilla S02 |
| 3 | 2026-10-01 | CrossRef | Verscheure Demeulenaere Swevers De Schutter Diehl 2009 Time-optimal path tracking for robots convex optimization approach | 3 |  | semilla S03 |
| 4 | 2026-10-01 | CrossRef | Lipp Boyd 2014 Minimum-time speed optimisation over a fixed path | 3 |  | semilla S04 |
| 5 | 2026-10-01 | CrossRef | Velenis Tsiotras 2005 optimal velocity profile generation given acceleration limits | 3 |  | semilla S05 |
| 6 | 2026-10-01 | CrossRef | Velenis Tsiotras 2008 Minimum-time travel for a vehicle with acceleration limits theoretical analysis receding-horizon | 3 |  | semilla S06 |
| 7 | 2026-10-01 | CrossRef | Casanova Sharp Symonds 2000 Minimum time manoeuvring significance of yaw inertia | 3 |  | semilla S07 |
| 8 | 2026-10-01 | CrossRef | Kelly Sharp 2010 Time-optimal control of the race car numerical method to emulate the ideal driver | 3 |  | semilla S08 |
| 9 | 2026-10-01 | CrossRef | Theodosis Gerdes 2012 Nonlinear optimization of a racing line for an autonomous racecar using professional driving techniques | 3 |  | semilla S09 |
| 10 | 2026-10-01 | CrossRef | Kapania Subosits Gerdes 2016 sequential two-step algorithm for fast generation of vehicle racing trajectories | 3 |  | semilla S10 |
| 11 | 2026-10-01 | CrossRef | Heilmeier Wischnewski Hermansdorfer Betz Lienkamp Lohmann 2020 Minimum curvature trajectory planning and control for an autonomous race car | 3 |  | semilla S11 |
| 12 | 2026-10-01 | CrossRef | Christ Wischnewski Heilmeier Lohmann 2021 Time-optimal trajectory planning race car variable tyre-road friction coefficients | 3 |  | semilla S12 |
| 13 | 2026-10-01 | CrossRef | Rucco Notarstefano Hauser 2012 Computing minimum lap-time trajectories for a single-track car with load transfer | 3 |  | semilla S13 |
| 14 | 2026-10-01 | CrossRef | Perantoni Limebeer 2014 Optimal control for a Formula One car with variable parameters | 3 |  | semilla S14 |
| 15 | 2026-10-01 | CrossRef | Limebeer Perantoni Optimal control of a Formula One car on a three-dimensional track | 3 |  | semilla S15 |
| 16 | 2026-10-01 | CrossRef | Lot Biral 2014 curvilinear abscissa approach for the lap time optimization of racing vehicles | 3 |  | semilla S16 |
| 17 | 2026-10-01 | CrossRef | Lot Dal Bianco 2016 Lap time optimisation of a racing go-kart | 3 |  | semilla S17 |
| 18 | 2026-10-01 | CrossRef | Dal Bianco Bertolazzi Biral Massaro 2019 Comparison of direct and indirect methods for minimum lap time optimal control problems | 3 |  | semilla S18 |
| 19 | 2026-10-01 | CrossRef | Limebeer Rao 2015 Faster higher and greener vehicular optimal control | 3 |  | semilla S19 |
| 20 | 2026-10-01 | CrossRef | Filippov 1962 On certain questions in the theory of optimal control | 3 |  | semilla S20 |
| 21 | 2026-10-01 | CrossRef | Cesari 1983 Optimization theory and applications problems with ordinary differential equations | 3 |  | semilla S21 |
| 22 | 2026-10-01 | CrossRef | Vinter 2000 Optimal Control Birkhauser | 3 |  | semilla S22 |
| 23 | 2026-10-01 | CrossRef | Clarke 2013 Functional Analysis Calculus of Variations and Optimal Control | 3 |  | semilla S23 |
| 24 | 2026-10-01 | CrossRef | Ioffe 1977 On lower semicontinuity of integral functionals | 3 |  | semilla S24 |
| 25 | 2026-10-01 | CrossRef | Hartl Sethi Vickson 1995 survey of the maximum principles for optimal control problems with state constraints | 3 |  | semilla S25 |
| 26 | 2026-10-01 | CrossRef | Maurer 1977 On optimal control problems with bounded state variables and control appearing linearly | 3 |  | semilla S26 |
| 27 | 2026-10-01 | CrossRef | Bonnans Hermant 2009 second-order analysis optimal control pure state constraints mixed control-state constraints | 3 |  | semilla S27 |
| 28 | 2026-10-01 | CrossRef | Gilbert 1977 Optimal periodic control a general theory of necessary conditions | 3 |  | semilla S28 |
| 29 | 2026-10-01 | CrossRef | Bittanti Fronza Guardabassi 1973 Periodic control a frequency domain approach | 3 |  | semilla S29 |
| 30 | 2026-10-01 | CrossRef | Hager 2000 Runge-Kutta methods in optimal control and the transformed adjoint system | 3 |  | semilla S30 |
| 31 | 2026-10-01 | CrossRef | Dontchev Hager 1993 Lipschitzian stability in nonlinear control and optimization | 3 |  | semilla S31 |
| 32 | 2026-10-01 | CrossRef | Dontchev Hager Veliov 2000 Second-order Runge-Kutta approximations in control constrained optimal control | 3 |  | semilla S32 |
| 33 | 2026-10-01 | CrossRef | Malanowski Buskens Maurer 1998 Convergence of approximations to nonlinear optimal control problems | 3 |  | semilla S33 |
| 34 | 2026-10-01 | CrossRef | Gong Ross Kang Fahroo 2008 Connections between the covector mapping theorem and convergence of pseudospectral methods | 3 |  | semilla S34 |
| 35 | 2026-10-01 | CrossRef | Betts 2010 Practical methods for optimal control and estimation using nonlinear programming | 3 |  | semilla S35 |
| 36 | 2026-10-01 | CrossRef | Braides 2002 Gamma-convergence for beginners | 3 |  | semilla S36 |
| 37 | 2026-10-01 | CrossRef | Dal Maso 1993 An introduction to Gamma-convergence | 3 |  | semilla S37 |
| 38 | 2026-10-01 | CrossRef | Dubins 1957 On curves of minimal length with a constraint on average curvature | 3 |  | semilla S38 |
| 39 | 2026-10-01 | CrossRef | Reeds Shepp 1990 Optimal paths for a car that goes both forwards and backwards | 3 |  | semilla S39 |
| 40 | 2026-10-01 | CrossRef | Boissonnat Cerezo Leblond 1994 Shortest paths of bounded curvature in the plane | 3 |  | semilla S40 |
| 41 | 2026-10-01 | CrossRef | Andersson Gillis Horn Rawlings Diehl 2019 CasADi a software framework for nonlinear optimization and optimal control | 3 |  | semilla S41 |
| 42 | 2026-10-01 | CrossRef | Wachter Biegler 2006 On the implementation of an interior-point filter line-search algorithm for large-scale nonlinear programming | 3 |  | semilla S42 |
| 43 | 2026-10-01 | OpenAlex | Limebeer three-dimensional track minimum lap time | 78 |  | semilla S15 (año 2019) |
| 44 | 2026-10-01 | OpenAlex | Filippov existence theorem optimal control [title_and_abstract.search] | 50 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.1 existencia (Filippov–Cesari) |
| 45 | 2026-10-01 | OpenAlex | existence of optimal controls state constraints [title_and_abstract.search] | 1275 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.1 existencia (Filippov–Cesari) |
| 46 | 2026-10-01 | OpenAlex | existence minimum time optimal control problem [title_and_abstract.search] | 423 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.1 existencia (Filippov–Cesari) |
| 47 | 2026-10-01 | OpenAlex | Filippov Cesari existence theorem convexity [title_and_abstract.search] | 4 | 4 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.1 existencia (Filippov–Cesari) |
| 48 | 2026-10-01 | OpenAlex | existence optimal control differential inclusion compactness trajectories [title_and_abstract.search] | 9 | 9 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.1 existencia (Filippov–Cesari) |
| 49 | 2026-10-01 | OpenAlex | lower semicontinuity integral functionals existence optimal control [title_and_abstract.search] | 15 | 15 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.1 existencia (Filippov–Cesari) |
| 50 | 2026-10-01 | OpenAlex | mixed state control constraints maximum principle [title_and_abstract.search] | 79 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.2 restricciones mixtas y de estado |
| 51 | 2026-10-01 | OpenAlex | optimal control mixed constraints necessary conditions [title_and_abstract.search] | 293 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.2 restricciones mixtas y de estado |
| 52 | 2026-10-01 | OpenAlex | pure state constraints maximum principle regularity multiplier [title_and_abstract.search] | 1 | 1 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.2 restricciones mixtas y de estado |
| 53 | 2026-10-01 | OpenAlex | state constrained optimal control junction conditions [title_and_abstract.search] | 19 | 19 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.2 restricciones mixtas y de estado |
| 54 | 2026-10-01 | OpenAlex | nonsmooth maximum principle state constraints [title_and_abstract.search] | 71 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.2 restricciones mixtas y de estado |
| 55 | 2026-10-01 | OpenAlex | optimal periodic control free period [title_and_abstract.search] | 180 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.3 periódico con tiempo libre |
| 56 | 2026-10-01 | OpenAlex | periodic optimal control necessary conditions period [title_and_abstract.search] | 123 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.3 periódico con tiempo libre |
| 57 | 2026-10-01 | OpenAlex | optimal periodic control existence [title_and_abstract.search] | 589 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.3 periódico con tiempo libre |
| 58 | 2026-10-01 | OpenAlex | minimum time periodic orbit optimal control [title_and_abstract.search] | 31 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.3 periódico con tiempo libre |
| 59 | 2026-10-01 | OpenAlex | optimal control periodic boundary conditions free final time [title_and_abstract.search] | 5 | 5 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.3 periódico con tiempo libre |
| 60 | 2026-10-01 | OpenAlex | Dubins curves bounded curvature [title_and_abstract.search] | 34 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.4 Dubins y curvatura acotada |
| 61 | 2026-10-01 | OpenAlex | closed curves bounded curvature [title_and_abstract.search] | 596 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.4 Dubins y curvatura acotada |
| 62 | 2026-10-01 | OpenAlex | bounded curvature paths homotopy [title_and_abstract.search] | 25 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.4 Dubins y curvatura acotada |
| 63 | 2026-10-01 | OpenAlex | Markov Dubins problem optimal control [title_and_abstract.search] | 31 | 25 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.4 Dubins y curvatura acotada |
| 64 | 2026-10-01 | OpenAlex | curvature constrained shortest path corridor [title_and_abstract.search] | 3 | 3 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.4 Dubins y curvatura acotada |
| 65 | 2026-10-01 | OpenAlex | Pestov Ionin curvature [title_and_abstract.search] | 3 | 3 devueltos; sin orden por relevancia (ruido alto); repetida con orden por relevancia | N0.4 Dubins y curvatura acotada |
| 66 | 2026-10-01 | OpenAlex | "existence theorem" "optimal control" Filippov | 254 | 25 devueltos (orden relevancia) | N0.1 existencia (Filippov–Cesari) |
| 67 | 2026-10-01 | OpenAlex | "existence of optimal controls" "state constraints" | 286 | 25 devueltos (orden relevancia) | N0.1 existencia (Filippov–Cesari) |
| 68 | 2026-10-01 | OpenAlex | "existence" "minimum time" "optimal control" "state constraint" | 402 | 25 devueltos (orden relevancia) | N0.1 existencia (Filippov–Cesari) |
| 69 | 2026-10-01 | OpenAlex | "Filippov" "Cesari" existence optimal solutions | 171 | 25 devueltos (orden relevancia) | N0.1 existencia (Filippov–Cesari) |
| 70 | 2026-10-01 | OpenAlex | "existence of optimal" "differential inclusions" compactness | 348 | 25 devueltos (orden relevancia) | N0.1 existencia (Filippov–Cesari) |
| 71 | 2026-10-01 | OpenAlex | "lower semicontinuity" "integral functionals" "optimal control" existence | 365 | 25 devueltos (orden relevancia) | N0.1 existencia (Filippov–Cesari) |
| 72 | 2026-10-01 | OpenAlex | "mixed constraints" "maximum principle" "optimal control" | 267 | 25 devueltos (orden relevancia) | N0.2 restricciones mixtas y de estado |
| 73 | 2026-10-01 | OpenAlex | "mixed state-control constraints" "necessary conditions" | 84 | 25 devueltos (orden relevancia) | N0.2 restricciones mixtas y de estado |
| 74 | 2026-10-01 | OpenAlex | "state constraints" "maximum principle" survey | 837 | 25 devueltos (orden relevancia) | N0.2 restricciones mixtas y de estado |
| 75 | 2026-10-01 | OpenAlex | "state constrained" "optimal control" "junction" | 144 | 25 devueltos (orden relevancia) | N0.2 restricciones mixtas y de estado |
| 76 | 2026-10-01 | OpenAlex | "nonsmooth maximum principle" "state constraints" | 48 | 25 devueltos (orden relevancia) | N0.2 restricciones mixtas y de estado |
| 77 | 2026-10-01 | OpenAlex | "optimal periodic control" | 359 | 25 devueltos (orden relevancia) | N0.3 periódico con tiempo libre |
| 78 | 2026-10-01 | OpenAlex | "periodic optimal control" period free | 64 | 25 devueltos (orden relevancia) | N0.3 periódico con tiempo libre |
| 79 | 2026-10-01 | OpenAlex | "optimal periodic control" existence | 109 | 25 devueltos (orden relevancia) | N0.3 periódico con tiempo libre |
| 80 | 2026-10-01 | OpenAlex | "periodic" "minimum time" "optimal control" "free final time" | 31 | 25 devueltos (orden relevancia) | N0.3 periódico con tiempo libre |
| 81 | 2026-10-01 | OpenAlex | "optimal periodic" trajectories "unknown period" | 1 | 1 devueltos (orden relevancia) | N0.3 periódico con tiempo libre |
| 82 | 2026-10-01 | OpenAlex | "Dubins" "bounded curvature" paths | 332 | 25 devueltos (orden relevancia) | N0.4 Dubins y curvatura acotada |
| 83 | 2026-10-01 | OpenAlex | "closed curves" "bounded curvature" | 318 | 25 devueltos (orden relevancia) | N0.4 Dubins y curvatura acotada |
| 84 | 2026-10-01 | OpenAlex | "bounded curvature" paths "homotopy" | 246 | 25 devueltos (orden relevancia) | N0.4 Dubins y curvatura acotada |
| 85 | 2026-10-01 | OpenAlex | "Markov-Dubins" "optimal control" | 95 | 25 devueltos (orden relevancia) | N0.4 Dubins y curvatura acotada |
| 86 | 2026-10-01 | OpenAlex | "curvature-constrained" paths corridor | 101 | 25 devueltos (orden relevancia) | N0.4 Dubins y curvatura acotada |
| 87 | 2026-10-01 | OpenAlex | "bounded curvature" "turning number" | 12 | 12 devueltos (orden relevancia) | N0.4 Dubins y curvatura acotada |
| 88 | 2026-10-01 | OpenAlex | "optimal control problems with mixed constraints" Clarke | 56 | 25 devueltos (orden relevancia) | N0.2b mixtas (Clarke–de Pinho, revisiones) |
| 89 | 2026-10-01 | OpenAlex | "mixed constraints" "Euler-Lagrange inclusion" | 16 | 16 devueltos (orden relevancia) | N0.2b mixtas (Clarke–de Pinho, revisiones) |
| 90 | 2026-10-01 | OpenAlex | "maximum principle" "state constraints" revisited survey Arutyunov | 9 | 9 devueltos (orden relevancia) | N0.2b mixtas (Clarke–de Pinho, revisiones) |
| 91 | 2026-10-01 | OpenAlex | "time optimal" "mixed constraints" "state constraints" vehicle | 33 | 25 devueltos (orden relevancia) | N0.2b mixtas (Clarke–de Pinho, revisiones) |
| 92 | 2026-10-01 | OpenAlex | "nondegenerate" "maximum principle" "state constraints" | 132 | 25 devueltos (orden relevancia) | N0.2b mixtas (Clarke–de Pinho, revisiones) |
| 93 | 2026-10-01 | OpenAlex | "periodic optimal control" "free" period necessary conditions | 50 | 25 devueltos (orden relevancia) | N0.3b periódico tiempo libre |
| 94 | 2026-10-01 | OpenAlex | "optimal periodic" "free period" | 12 | 12 devueltos (orden relevancia) | N0.3b periódico tiempo libre |
| 95 | 2026-10-01 | OpenAlex | "period" "optimal control" "periodic trajectory" "minimum time" lap | 1 | 1 devueltos (orden relevancia) | N0.3b periódico tiempo libre |
| 96 | 2026-10-01 | OpenAlex | "optimal cyclic" trajectories "period" optimization | 82 | 25 devueltos (orden relevancia) | N0.3b periódico tiempo libre |
| 97 | 2026-10-01 | OpenAlex | "periodic boundary conditions" "free final time" "optimal control" | 5 | 5 devueltos (orden relevancia) | N0.3b periódico tiempo libre |
| 98 | 2026-10-01 | OpenAlex | "Pestov" "Ionin" | 42 | 25 devueltos (orden relevancia) | N0.4b curvas cerradas curvatura acotada |
| 99 | 2026-10-01 | OpenAlex | "curvature bounded" "closed curve" "contains a disk" | 11 | 11 devueltos (orden relevancia) | N0.4b curvas cerradas curvatura acotada |
| 100 | 2026-10-01 | OpenAlex | "reverse isoperimetric" "bounded curvature" | 37 | 25 devueltos (orden relevancia) | N0.4b curvas cerradas curvatura acotada |
| 101 | 2026-10-01 | OpenAlex | "convex curves" "bounded curvature" "area" | 72 | 25 devueltos (orden relevancia) | N0.4b curvas cerradas curvatura acotada |
| 102 | 2026-10-01 | OpenAlex | "closed curve" "curvature" "rotation index" inequality | 46 | 25 devueltos (orden relevancia) | N0.4b curvas cerradas curvatura acotada |
| 103 | 2026-10-01 | arXiv | all:"bounded curvature" AND all:"closed curves" | 0 | 0 devueltos | N0 arXiv |
| 104 | 2026-10-01 | arXiv | all:"existence" AND all:"minimum time" AND all:"state constraints" | 1 | 1 devueltos | N0 arXiv |
| 105 | 2026-10-01 | arXiv | all:"optimal periodic control" | 8 | 8 devueltos | N0 arXiv |
| 106 | 2026-10-01 | arXiv | all:"Markov-Dubins" | 5 | 5 devueltos | N0 arXiv |
| 107 | 2026-10-01 | arXiv | all:"mixed constraints" AND all:"maximum principle" | 4 | 4 devueltos | N0 arXiv |
| 108 | 2026-10-01 | OpenAlex | "velocity profile" "fixed path" "minimum time" | 47 | 25 devueltos (orden relevancia) | N1.1 perfil de velocidad camino fijo |
| 109 | 2026-10-01 | OpenAlex | "time-optimal path parameterization" | 251 | 25 devueltos (orden relevancia) | N1.1 perfil de velocidad camino fijo |
| 110 | 2026-10-01 | OpenAlex | "speed planning" "acceleration constraints" "optimal" path | 81 | 25 devueltos (orden relevancia) | N1.1 perfil de velocidad camino fijo |
| 111 | 2026-10-01 | OpenAlex | "forward-backward" "velocity profile" vehicle | 202 | 25 devueltos (orden relevancia) | N1.1 perfil de velocidad camino fijo |
| 112 | 2026-10-01 | OpenAlex | "minimum-time" "speed profile" "specified path" vehicle | 26 | 25 devueltos (orden relevancia) | N1.1 perfil de velocidad camino fijo |
| 113 | 2026-10-01 | OpenAlex | "time-optimal path following" robot "phase plane" | 20 | 20 devueltos (orden relevancia) | N1.1 perfil de velocidad camino fijo |
| 114 | 2026-10-01 | OpenAlex | "convex optimization" "speed" "fixed path" minimum time | 126 | 25 devueltos (orden relevancia) | N1.2 convexo / abscisa curvilínea |
| 115 | 2026-10-01 | OpenAlex | "second-order cone" "lap time" | 16 | 16 devueltos (orden relevancia) | N1.2 convexo / abscisa curvilínea |
| 116 | 2026-10-01 | OpenAlex | "convex" "minimum lap time" | 127 | 25 devueltos (orden relevancia) | N1.2 convexo / abscisa curvilínea |
| 117 | 2026-10-01 | OpenAlex | "change of variables" "time-optimal" "path tracking" convex | 40 | 25 devueltos (orden relevancia) | N1.2 convexo / abscisa curvilínea |
| 118 | 2026-10-01 | OpenAlex | "minimum-time" "velocity planning" "linear time" algorithm | 29 | 25 devueltos (orden relevancia) | N1.2 convexo / abscisa curvilínea |
| 119 | 2026-10-01 | OpenAlex | "g-g diagram" "lap time" | 45 | 25 devueltos (orden relevancia) | N1.3 elipse de fricción y g-g |
| 120 | 2026-10-01 | OpenAlex | "friction ellipse" "minimum time" vehicle | 34 | 25 devueltos (orden relevancia) | N1.3 elipse de fricción y g-g |
| 121 | 2026-10-01 | OpenAlex | "quasi-steady-state" "lap time simulation" | 65 | 25 devueltos (orden relevancia) | N1.3 elipse de fricción y g-g |
| 122 | 2026-10-01 | OpenAlex | "g-g-v" diagram race car | 40 | 25 devueltos (orden relevancia) | N1.3 elipse de fricción y g-g |
| 123 | 2026-10-01 | OpenAlex | "performance envelope" "lap time" "point mass" | 15 | 15 devueltos (orden relevancia) | N1.3 elipse de fricción y g-g |
| 124 | 2026-10-01 | OpenAlex | "lap time simulation" "point mass" | 26 | 25 devueltos (orden relevancia) | N1.3 elipse de fricción y g-g |
| 125 | 2026-10-01 | OpenAlex | "existence" "uniqueness" "velocity profile" "minimum time" | 267 | 25 devueltos (orden relevancia) | N1.4 existencia, unicidad, estructura |
| 126 | 2026-10-01 | OpenAlex | "optimal velocity profile" "acceleration limits" "optimal control" proof | 13 | 13 devueltos (orden relevancia) | N1.4 existencia, unicidad, estructura |
| 127 | 2026-10-01 | OpenAlex | "speed planning" "optimal complexity" | 15 | 15 devueltos (orden relevancia) | N1.4 existencia, unicidad, estructura |
| 128 | 2026-10-01 | OpenAlex | "bang-bang" "velocity profile" "friction" "minimum time" | 60 | 25 devueltos (orden relevancia) | N1.4 existencia, unicidad, estructura |
| 129 | 2026-10-01 | OpenAlex | "minimum time" "speed" "path" "Pontryagin" vehicle "acceleration limits" | 23 | 23 devueltos (orden relevancia) | N1.4 existencia, unicidad, estructura |
| 130 | 2026-10-01 | OpenAlex | "minimum curvature" "racing line" | 77 | 25 devueltos (orden relevancia) | N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima |
| 131 | 2026-10-01 | OpenAlex | "racing line" optimization "shortest path" "minimum curvature" | 11 | 11 devueltos (orden relevancia) | N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima |
| 132 | 2026-10-01 | OpenAlex | "racing line" "point mass" "minimum time" | 24 | 24 devueltos (orden relevancia) | N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima |
| 133 | 2026-10-01 | OpenAlex | "optimal racing line" | 114 | 25 devueltos (orden relevancia) | N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima |
| 134 | 2026-10-01 | OpenAlex | "race line" optimization track | 97 | 25 devueltos (orden relevancia) | N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima |
| 135 | 2026-10-01 | OpenAlex | "minimum lap time" "free trajectory" "point mass" | 17 | 17 devueltos (orden relevancia) | N2.1 tiempo mínimo vs curvatura mínima vs longitud mínima |
| 136 | 2026-10-01 | OpenAlex | "curvilinear coordinates" "minimum lap time" | 22 | 22 devueltos (orden relevancia) | N2.2 formulación en tiempo vs en abscisa |
| 137 | 2026-10-01 | OpenAlex | "spatial reformulation" vehicle "optimal control" track | 21 | 21 devueltos (orden relevancia) | N2.2 formulación en tiempo vs en abscisa |
| 138 | 2026-10-01 | OpenAlex | "time-to-space" transformation vehicle trajectory optimization | 5366 | 25 devueltos (orden relevancia) | N2.2 formulación en tiempo vs en abscisa |
| 139 | 2026-10-01 | OpenAlex | "Frenet" "racing line" optimization | 40 | 25 devueltos (orden relevancia) | N2.2 formulación en tiempo vs en abscisa |
| 140 | 2026-10-01 | OpenAlex | "track distance" "independent variable" "lap time" optimal control | 3 | 3 devueltos (orden relevancia) | N2.2 formulación en tiempo vs en abscisa |
| 141 | 2026-10-01 | OpenAlex | "curvilinear abscissa" vehicle optimal control | 199 | 25 devueltos (orden relevancia) | N2.2 formulación en tiempo vs en abscisa |
| 142 | 2026-10-01 | OpenAlex | "two-step" "racing" trajectory "minimum curvature" "velocity profile" | 17 | 17 devueltos (orden relevancia) | N2.3 dos pasos y relación curvatura–tiempo |
| 143 | 2026-10-01 | OpenAlex | "minimum curvature" "minimum time" comparison race trajectory | 45 | 25 devueltos (orden relevancia) | N2.3 dos pasos y relación curvatura–tiempo |
| 144 | 2026-10-01 | OpenAlex | "iterative" "minimum curvature" lap time | 101 | 25 devueltos (orden relevancia) | N2.3 dos pasos y relación curvatura–tiempo |
| 145 | 2026-10-01 | OpenAlex | "bilevel" "racing line" optimization | 3 | 3 devueltos (orden relevancia) | N2.3 dos pasos y relación curvatura–tiempo |
| 146 | 2026-10-01 | OpenAlex | "Euler spiral" OR clothoid "racing line" | 528 | 25 devueltos (orden relevancia) | N2.3 dos pasos y relación curvatura–tiempo |
| 147 | 2026-10-01 | OpenAlex | "autonomous racing" survey | 1137 | 25 devueltos (orden relevancia) | N2.4 carreras autónomas |
| 148 | 2026-10-01 | OpenAlex | "autonomous race car" "trajectory planning" "global" | 143 | 25 devueltos (orden relevancia) | N2.4 carreras autónomas |
| 149 | 2026-10-01 | OpenAlex | "Formula Student" driverless "trajectory optimization" | 12 | 12 devueltos (orden relevancia) | N2.4 carreras autónomas |
| 150 | 2026-10-01 | OpenAlex | "Indy Autonomous Challenge" planning | 152 | 25 devueltos (orden relevancia) | N2.4 carreras autónomas |
| 151 | 2026-10-01 | OpenAlex | "Roborace" trajectory | 95 | 25 devueltos (orden relevancia) | N2.4 carreras autónomas |
| 152 | 2026-10-01 | OpenAlex | "model predictive contouring control" racing | 189 | 25 devueltos (orden relevancia) | N2.4 carreras autónomas |
| 153 | 2026-10-01 | OpenAlex | "existence" "minimum lap time" | 26 | 25 devueltos (orden relevancia) | N3.1 existencia del minimizante (circuito, masa puntual) |
| 154 | 2026-10-01 | OpenAlex | "racing line" "existence" | 52 | 25 devueltos (orden relevancia) | N3.1 existencia del minimizante (circuito, masa puntual) |
| 155 | 2026-10-01 | OpenAlex | "minimum time" "point mass" "friction" existence optimal | 72 | 25 devueltos (orden relevancia) | N3.1 existencia del minimizante (circuito, masa puntual) |
| 156 | 2026-10-01 | OpenAlex | "time-optimal" "race track" "existence of solutions" | 1 | 1 devueltos (orden relevancia) | N3.1 existencia del minimizante (circuito, masa puntual) |
| 157 | 2026-10-01 | OpenAlex | "minimum-time" trajectory "bounded acceleration" "corridor" existence | 2 | 2 devueltos (orden relevancia) | N3.1 existencia del minimizante (circuito, masa puntual) |
| 158 | 2026-10-01 | OpenAlex | "friction circle" "minimum time" "optimal control" particle | 3 | 3 devueltos (orden relevancia) | N3.1 existencia del minimizante (circuito, masa puntual) |
| 159 | 2026-10-01 | OpenAlex | "bounded curvature" curves compactness "Arzela" | 70 | 25 devueltos (orden relevancia) | N3.2 espacio natural y regularidad de curvas |
| 160 | 2026-10-01 | OpenAlex | "curvature" "measure" curves "BV" minimization tangent | 1393 | 25 devueltos (orden relevancia) | N3.2 espacio natural y regularidad de curvas |
| 161 | 2026-10-01 | OpenAlex | "W^{2,infty}" curves optimal | 8 | 8 devueltos (orden relevancia) | N3.2 espacio natural y regularidad de curvas |
| 162 | 2026-10-01 | OpenAlex | "Lipschitz" tangent curves "curvature bounded" variational | 959 | 25 devueltos (orden relevancia) | N3.2 espacio natural y regularidad de curvas |
| 163 | 2026-10-01 | OpenAlex | "regularity" "optimal trajectories" "minimum time" "state constraints" | 118 | 25 devueltos (orden relevancia) | N3.2 espacio natural y regularidad de curvas |
| 164 | 2026-10-01 | OpenAlex | "maximum principle" "minimum lap time" | 15 | 15 devueltos (orden relevancia) | N3.3 principio del máximo en carreras |
| 165 | 2026-10-01 | OpenAlex | "Pontryagin" "racing line" | 6 | 6 devueltos (orden relevancia) | N3.3 principio del máximo en carreras |
| 166 | 2026-10-01 | OpenAlex | "necessary conditions" "minimum time" vehicle "track boundaries" | 5 | 5 devueltos (orden relevancia) | N3.3 principio del máximo en carreras |
| 167 | 2026-10-01 | OpenAlex | "indirect method" "minimum lap time" "boundary arcs" | 0 | 0 devueltos (orden relevancia) | N3.3 principio del máximo en carreras |
| 168 | 2026-10-01 | OpenAlex | "state constraint" "track limits" "optimal control" race car | 3 | 3 devueltos (orden relevancia) | N3.3 principio del máximo en carreras |
| 169 | 2026-10-01 | OpenAlex | "Dubins" "variable speed" "time-optimal" | 38 | 25 devueltos (orden relevancia) | N3.4 v -> 0, paradas y pérdida de coercitividad |
| 170 | 2026-10-01 | OpenAlex | "Markov-Dubins" "acceleration" control speed | 37 | 25 devueltos (orden relevancia) | N3.4 v -> 0, paradas y pérdida de coercitividad |
| 171 | 2026-10-01 | OpenAlex | "brachistochrone" "friction" curve "optimal" | 221 | 25 devueltos (orden relevancia) | N3.4 v -> 0, paradas y pérdida de coercitividad |
| 172 | 2026-10-01 | OpenAlex | "zero velocity" "minimum time" path singular curvature | 36 | 25 devueltos (orden relevancia) | N3.4 v -> 0, paradas y pérdida de coercitividad |
| 173 | 2026-10-01 | OpenAlex | "cusp" "minimum time" "bounded acceleration" path | 0 | 0 devueltos (orden relevancia) | N3.4 v -> 0, paradas y pérdida de coercitividad |
| 174 | 2026-10-01 | OpenAlex | "time-optimal" "bounded acceleration" planar "double integrator" path | 7 | 7 devueltos (orden relevancia) | N3.4 v -> 0, paradas y pérdida de coercitividad |
| 175 | 2026-10-01 | OpenAlex | "winding number" "uniform convergence" curves | 237 | 25 devueltos (orden relevancia) | N3.5 número de vueltas bajo convergencia |
| 176 | 2026-10-01 | OpenAlex | "turning number" constraint "optimal control" | 2 | 2 devueltos (orden relevancia) | N3.5 número de vueltas bajo convergencia |
| 177 | 2026-10-01 | OpenAlex | "rotation index" closed curve optimization constraint | 41 | 25 devueltos (orden relevancia) | N3.5 número de vueltas bajo convergencia |
| 178 | 2026-10-01 | OpenAlex | "winding number" "optimal control" closed trajectory | 70 | 25 devueltos (orden relevancia) | N3.5 número de vueltas bajo convergencia |
| 179 | 2026-10-01 | OpenAlex | "homotopy class" constraint "trajectory optimization" | 151 | 25 devueltos (orden relevancia) | N3.5 número de vueltas bajo convergencia |
| 180 | 2026-10-01 | arXiv | all:"racing line" | 29 | 29 devueltos | N3 arXiv |
| 181 | 2026-10-01 | arXiv | all:"minimum lap time" | 22 | 22 devueltos | N3 arXiv |
| 182 | 2026-10-01 | arXiv | all:"minimum-lap-time" | 22 | 22 devueltos | N3 arXiv |
| 183 | 2026-10-01 | arXiv | all:"time-optimal" AND all:"race track" | 12 | 12 devueltos | N3 arXiv |
| 184 | 2026-10-01 | arXiv | all:"Dubins" AND all:"variable speed" | 3 | 3 devueltos | N3 arXiv |
| 185 | 2026-10-01 | arXiv | all:"winding number" AND all:"optimal control" | 1 | 1 devueltos | N3 arXiv |
| 186 | 2026-10-01 | CrossRef | Clarke de Pinho 2010 Optimal control problems with mixed constraints SIAM Journal on Control and Optimization | 2 |  | autor clave C01 |
| 187 | 2026-10-01 | CrossRef | Colonius 1988 Optimal periodic control Lecture Notes in Mathematics 1313 | 2 |  | autor clave C02 |
| 188 | 2026-10-01 | CrossRef | Kaya 2019 Markov-Dubins interpolating curves Computational Optimization and Applications | 2 |  | autor clave C03 |
| 189 | 2026-10-01 | CrossRef | Kaya Noakes 2013 Finding interpolating curves minimizing L infinity acceleration in the Euclidean space via optimal control theory | 2 |  | autor clave C04 |
| 190 | 2026-10-01 | CrossRef | Frego Bertolazzi Biral Fontanelli Palopoli 2017 Semi-analytical minimum time solutions with velocity constraints for trajectory following of vehicles Automatica | 2 |  | autor clave C05 |
| 191 | 2026-10-01 | CrossRef | Metz Williams 1989 Near time-optimal control of racing vehicles Automatica | 2 |  | autor clave C06 |
| 192 | 2026-10-01 | CrossRef | Hendrikx Meijlink Kriens 1996 Application of optimal control theory to inverse simulation of car handling Vehicle System Dynamics | 2 |  | autor clave C07 |
| 193 | 2026-10-01 | CrossRef | Brayshaw Harrison 2005 quasi steady state approach to race car lap simulation racing line centre of gravity | 2 |  | autor clave C08 |
| 194 | 2026-10-01 | CrossRef | Veneri Massaro 2020 A free-trajectory quasi-steady-state optimal-control method for minimum lap-time of race vehicles | 2 |  | autor clave C09 |
| 195 | 2026-10-01 | CrossRef | Lovato Massaro 2022 three-dimensional free-trajectory quasi-steady-state optimal-control method minimum-lap-time race vehicles | 2 |  | autor clave C10 |
| 196 | 2026-10-01 | CrossRef | Massaro Limebeer 2021 Minimum-lap-time optimisation and simulation Vehicle System Dynamics | 2 |  | autor clave C11 |
| 197 | 2026-10-01 | CrossRef | Sharp Peng 2011 Vehicle dynamics applications of optimal control theory Vehicle System Dynamics | 2 |  | autor clave C12 |
| 198 | 2026-10-01 | CrossRef | Braghin Cheli Melzi Sabbioni 2008 Race driver model Computers and Structures | 2 |  | autor clave C13 |
| 199 | 2026-10-01 | CrossRef | Timings Cole 2013 Minimum maneuver time calculation using convex optimization | 2 |  | autor clave C14 |
| 200 | 2026-10-01 | CrossRef | Velenis Tsiotras Lu 2008 Optimality properties and driver input parameterization for trail-braking cornering European Journal of Control | 2 |  | autor clave C15 |
| 201 | 2026-10-01 | CrossRef | Cardamone Loiacono Lanzi Bardelli 2010 Searching for the optimal racing line using genetic algorithms | 2 |  | autor clave C16 |
| 202 | 2026-10-01 | CrossRef | Limebeer Massaro 2018 Dynamics and optimal control of road vehicles Oxford University Press | 2 |  | autor clave C17 |
| 203 | 2026-10-01 | CrossRef | Bertolazzi Biral Da Lio 2005 Symbolic-numeric indirect method for solving optimal control problems for large multibody systems time-optimal racing vehicle | 2 |  | autor clave C18 |
| 204 | 2026-10-01 | CrossRef | Soner 1986 Optimal control with state-space constraint I SIAM Journal on Control and Optimization | 2 |  | autor clave C19 |
| 205 | 2026-10-01 | CrossRef | Sanfelice Frazzoli 2013 On minimum-time paths of bounded curvature with position-dependent constraints Automatica | 2 |  | autor clave C20 |
| 206 | 2026-10-01 | CrossRef | Benham Brower Fisher Crane 2019 Brachistochrone on a velodrome | 2 |  | autor clave C21 |
| 207 | 2026-10-01 | CrossRef | Galbraith Vinter 2003 Lipschitz continuity of optimal controls for state constrained problems | 2 |  | autor clave C22 |
| 208 | 2026-10-01 | CrossRef | Howard Treibergs 1995 A reverse isoperimetric inequality stability and extremal theorems for plane curves with bounded curvature | 2 |  | autor clave C23 |
| 209 | 2026-10-01 | CrossRef | Liniger Domahidi Morari 2015 Optimization-based autonomous racing of 1:43 scale RC cars | 2 |  | autor clave C24 |
| 210 | 2026-10-01 | CrossRef | Betz et al 2022 Autonomous vehicles on the edge a survey on autonomous vehicle racing | 2 |  | autor clave C25 |
| 211 | 2026-10-01 | CrossRef | Pham Pham 2018 A new approach to time-optimal path parameterization based on reachability analysis | 2 |  | autor clave C26 |
| 212 | 2026-10-01 | CrossRef | Consolini Locatelli Minari Piazzi 2017 An optimal complexity algorithm for minimum-time velocity planning Systems Control Letters | 2 |  | autor clave C27 |
| 213 | 2026-10-01 | CrossRef | Jain Morari 2020 Computing the racing line using Bayesian optimization | 2 |  | autor clave C28 |
| 214 | 2026-10-01 | CrossRef | Cesari 1966 Existence theorems for weak and usual optimal solutions in Lagrange problems with unilateral constraints | 2 |  | autor clave C29 |
| 215 | 2026-10-01 | CrossRef | Arutyunov Karamzin Pereira 2011 The maximum principle for optimal control problems with state constraints by R.V. Gamkrelidze revisited | 2 |  | autor clave C30 |
| 216 | 2026-10-01 | arXiv | ti:"optimal complexity algorithm" AND ti:"velocity planning" | 0 | 0 devueltos | versión arXiv C27 |
| 217 | 2026-10-01 | arXiv | ti:"semi-analytical" AND ti:"minimum time" AND ti:"velocity constraints" | 0 | 0 devueltos | versión arXiv C05 |
| 218 | 2026-10-01 | arXiv | ti:"minimum-time paths of bounded curvature" | 1 | 1 devueltos | versión arXiv C20 |
| 219 | 2026-10-01 | arXiv | ti:"reverse isoperimetric" AND ti:"bounded curvature" | 0 | 0 devueltos | versión arXiv C23 |
| 220 | 2026-10-01 | arXiv | ti:"curvilinear abscissa" AND ti:"lap time" | 0 | 0 devueltos | versión arXiv S16 |
| 221 | 2026-10-01 | arXiv | ti:"optimal periodic control" AND au:Colonius | 0 | 0 devueltos | versión arXiv C02 |
| 222 | 2026-10-01 | web | "An optimal complexity algorithm for minimum-time velocity planning" Consolini abstract | 9 | resumen leído (ScienceDirect); hallado arXiv 1809.01959 (lattice) y JOTA 2020 (convergencia) | verificación C27 |
| 223 | 2026-10-01 | web | "Semi-analytical minimum time solutions with velocity constraints for trajectory following of vehicles" | 8 | resumen leído (ResearchGate); Automatica 86:18-28 | verificación C05 |
| 224 | 2026-10-01 | web | "curvilinear abscissa approach for the lap time optimization of racing vehicles" Lot Biral | 10 | resumen leído (Semantic Scholar); IFAC PV 47(3):7559-7565 | verificación S16 |
| 225 | 2026-10-01 | OpenAlex (citantes) | cites:W2088363568 | 87 | 50 devueltos (orden por citas) | citantes Velenis–Tsiotras 2008 |
| 226 | 2026-10-01 | OpenAlex (citantes) | cites:W2136209220 | 141 | 50 devueltos (orden por citas) | citantes Lipp–Boyd 2014 |
| 227 | 2026-10-01 | OpenAlex (citantes) | cites:W2606677490 | 28 | 28 devueltos (orden por citas) | citantes Kaya 2017 |
| 228 | 2026-10-01 | OpenAlex (citantes) | cites:W2604921123 | 46 | 46 devueltos (orden por citas) | citantes Consolini 2017 |
| 229 | 2026-10-01 | OpenAlex (citantes) | cites:W2951357333 + 'minimum time' | 54 | 50 devueltos (orden por citas) | citantes Heilmeier 2020 |
| 230 | 2026-10-01 | OpenAlex (citantes) | cites:W2805397692 | 98 | 50 devueltos (orden por citas) | citantes Dal Bianco 2019 |
| 231 | 2026-10-01 | OpenAlex (citantes) | cites:W2088363568 + 'convergence' | 18 | 18 devueltos | citantes Velenis–Tsiotras 2008 + convergence |
| 232 | 2026-10-01 | OpenAlex (citantes) | cites:W2088363568 + 'existence' | 8 | 8 devueltos | citantes Velenis–Tsiotras 2008 + existence |
| 233 | 2026-10-01 | OpenAlex (citantes) | cites:W2088363568 + 'Pontryagin' | 1 | 1 devueltos | citantes Velenis–Tsiotras 2008 + Pontryagin |
| 234 | 2026-10-01 | OpenAlex (citantes) | cites:W2136209220 + 'convergence' | 32 | 25 devueltos | citantes Lipp–Boyd 2014 + convergence |
| 235 | 2026-10-01 | OpenAlex (citantes) | cites:W2136209220 + 'existence' | 9 | 9 devueltos | citantes Lipp–Boyd 2014 + existence |
| 236 | 2026-10-01 | OpenAlex (citantes) | cites:W2136209220 + 'Pontryagin' | 6 | 6 devueltos | citantes Lipp–Boyd 2014 + Pontryagin |
| 237 | 2026-10-01 | OpenAlex (citantes) | cites:W2604921123 + 'convergence' | 10 | 10 devueltos | citantes Consolini 2017 + convergence |
| 238 | 2026-10-01 | OpenAlex (citantes) | cites:W2604921123 + 'existence' | 2 | 2 devueltos | citantes Consolini 2017 + existence |
| 239 | 2026-10-01 | OpenAlex (citantes) | cites:W2604921123 + 'Pontryagin' | 4 | 4 devueltos | citantes Consolini 2017 + Pontryagin |
| 240 | 2026-10-01 | OpenAlex (citantes) | cites:W3142183352 + 'convergence' | 12 | 12 devueltos | citantes Massaro–Limebeer 2021 + convergence |
| 241 | 2026-10-01 | OpenAlex (citantes) | cites:W3142183352 + 'existence' | 1 | 1 devueltos | citantes Massaro–Limebeer 2021 + existence |
| 242 | 2026-10-01 | OpenAlex (citantes) | cites:W3142183352 + 'Pontryagin' | 0 | 0 devueltos | citantes Massaro–Limebeer 2021 + Pontryagin |
| 243 | 2026-10-01 | OpenAlex (citantes) | cites:W2805397692 + 'convergence' | 15 | 15 devueltos | citantes Dal Bianco 2019 + convergence |
| 244 | 2026-10-01 | OpenAlex (citantes) | cites:W2805397692 + 'existence' | 4 | 4 devueltos | citantes Dal Bianco 2019 + existence |
| 245 | 2026-10-01 | OpenAlex (citantes) | cites:W2805397692 + 'Pontryagin' | 7 | 7 devueltos | citantes Dal Bianco 2019 + Pontryagin |
| 246 | 2026-10-01 | OpenAlex (referencias) | referenced_works de Massaro–Limebeer 2021 | 108 | 108 referencias recuperadas | hacia atrás |
| 247 | 2026-10-01 | OpenAlex | "discretize-then-optimize" "optimize-then-discretize" "optimal control" | 426 | 25 devueltos (orden relevancia) | N4.1 DTO vs OTD, covectores, adjuntos |
| 248 | 2026-10-01 | OpenAlex | "covector mapping theorem" | 94 | 25 devueltos (orden relevancia) | N4.1 DTO vs OTD, covectores, adjuntos |
| 249 | 2026-10-01 | OpenAlex | "adjoint" consistency discretization "optimal control" "Runge-Kutta" | 484 | 25 devueltos (orden relevancia) | N4.1 DTO vs OTD, covectores, adjuntos |
| 250 | 2026-10-01 | OpenAlex | "symplectic" "partitioned Runge-Kutta" "optimal control" | 151 | 25 devueltos (orden relevancia) | N4.1 DTO vs OTD, covectores, adjuntos |
| 251 | 2026-10-01 | OpenAlex | "direct and indirect methods" "optimal control" comparison convergence | 396 | 25 devueltos (orden relevancia) | N4.1 DTO vs OTD, covectores, adjuntos |
| 252 | 2026-10-01 | OpenAlex | "convergence" "pseudospectral" "optimal control" | 2186 | 25 devueltos (orden relevancia) | N4.2 convergencia de colocación / pseudoespectral / RK |
| 253 | 2026-10-01 | OpenAlex | "Gauss collocation" "optimal control" "convergence rate" | 71 | 25 devueltos (orden relevancia) | N4.2 convergencia de colocación / pseudoespectral / RK |
| 254 | 2026-10-01 | OpenAlex | "Euler discretization" "state constraints" "optimal control" error estimates | 147 | 25 devueltos (orden relevancia) | N4.2 convergencia de colocación / pseudoespectral / RK |
| 255 | 2026-10-01 | OpenAlex | "consistent approximations" "optimal control" | 497 | 25 devueltos (orden relevancia) | N4.2 convergencia de colocación / pseudoespectral / RK |
| 256 | 2026-10-01 | OpenAlex | "bang-bang" "discretization" "optimal control" error | 2476 | 25 devueltos (orden relevancia) | N4.2 convergencia de colocación / pseudoespectral / RK |
| 257 | 2026-10-01 | OpenAlex | "Runge-Kutta" "optimal control" "state constraints" convergence | 660 | 25 devueltos (orden relevancia) | N4.2 convergencia de colocación / pseudoespectral / RK |
| 258 | 2026-10-01 | OpenAlex | "mesh independence" "optimal control" | 395 | 25 devueltos (orden relevancia) | N4.3 independencia de malla |
| 259 | 2026-10-01 | OpenAlex | "mesh-independence principle" | 140 | 25 devueltos (orden relevancia) | N4.3 independencia de malla |
| 260 | 2026-10-01 | OpenAlex | "mesh independence" Newton "discretized" control | 802 | 25 devueltos (orden relevancia) | N4.3 independencia de malla |
| 261 | 2026-10-01 | OpenAlex | "mesh-independent" SQP "optimal control" | 48 | 25 devueltos (orden relevancia) | N4.3 independencia de malla |
| 262 | 2026-10-01 | OpenAlex | "mesh independence" "semismooth Newton" | 109 | 25 devueltos (orden relevancia) | N4.3 independencia de malla |
| 263 | 2026-10-01 | OpenAlex | "Gamma-convergence" "optimal control" discretization | 247 | 25 devueltos (orden relevancia) | N4.4 Gamma-convergencia de discretizaciones |
| 264 | 2026-10-01 | OpenAlex | "Gamma-convergence" "finite element" "optimal control" | 45 | 25 devueltos (orden relevancia) | N4.4 Gamma-convergencia de discretizaciones |
| 265 | 2026-10-01 | OpenAlex | "Γ-convergence" "discrete" curves "curvature" | 837 | 25 devueltos (orden relevancia) | N4.4 Gamma-convergencia de discretizaciones |
| 266 | 2026-10-01 | OpenAlex | "Gamma-convergence" "control problems" | 192 | 25 devueltos (orden relevancia) | N4.4 Gamma-convergencia de discretizaciones |
| 267 | 2026-10-01 | OpenAlex | "Gamma-convergence" "numerical approximation" "variational problems" | 76 | 25 devueltos (orden relevancia) | N4.4 Gamma-convergencia de discretizaciones |
| 268 | 2026-10-01 | OpenAlex | "constraint violation" "between collocation points" | 11 | 11 devueltos (orden relevancia) | N4.5 restricciones solo en nodos / semi-infinitas |
| 269 | 2026-10-01 | OpenAlex | "semi-infinite programming" "optimal control" "path constraints" | 38 | 25 devueltos (orden relevancia) | N4.5 restricciones solo en nodos / semi-infinitas |
| 270 | 2026-10-01 | OpenAlex | "continuous-time constraint" satisfaction "direct transcription" | 3 | 3 devueltos (orden relevancia) | N4.5 restricciones solo en nodos / semi-infinitas |
| 271 | 2026-10-01 | OpenAlex | "integrated residual" "optimal control" | 33 | 25 devueltos (orden relevancia) | N4.5 restricciones solo en nodos / semi-infinitas |
| 272 | 2026-10-01 | OpenAlex | "inter-sample" constraint violation "trajectory optimization" | 55 | 25 devueltos (orden relevancia) | N4.5 restricciones solo en nodos / semi-infinitas |
| 273 | 2026-10-01 | OpenAlex | "semi-infinite" constraints "trajectory optimization" guaranteed | 104 | 25 devueltos (orden relevancia) | N4.5 restricciones solo en nodos / semi-infinitas |
| 274 | 2026-10-01 | OpenAlex | "Fourier" "pseudospectral" "optimal control" periodic | 299 | 25 devueltos (orden relevancia) | N4.6 Fourier en problemas periódicos |
| 275 | 2026-10-01 | OpenAlex | "trigonometric" collocation "periodic" "optimal control" | 230 | 25 devueltos (orden relevancia) | N4.6 Fourier en problemas periódicos |
| 276 | 2026-10-01 | OpenAlex | "Fourier series" "trajectory optimization" periodic | 196 | 25 devueltos (orden relevancia) | N4.6 Fourier en problemas periódicos |
| 277 | 2026-10-01 | OpenAlex | "harmonic balance" "optimal control" periodic | 289 | 25 devueltos (orden relevancia) | N4.6 Fourier en problemas periódicos |
| 278 | 2026-10-01 | OpenAlex | "spectral method" "periodic optimal control" | 18 | 18 devueltos (orden relevancia) | N4.6 Fourier en problemas periódicos |
| 279 | 2026-10-01 | OpenAlex | "Fourier" "collocation" "periodic orbits" optimization | 189 | 25 devueltos (orden relevancia) | N4.6 Fourier en problemas periódicos |
| 280 | 2026-10-01 | CrossRef | Schwartz Polak 1996 Consistent approximations for optimal control problems based on Runge-Kutta integration SIAM J Control Optim | 2 |  | autor clave D01 |
| 281 | 2026-10-01 | CrossRef | Buttazzo Dal Maso 1982 Gamma-convergence and optimal control problems Journal of Optimization Theory and Applications | 2 |  | autor clave D02 |
| 282 | 2026-10-01 | CrossRef | Allgower Bohmer Potra Rheinboldt 1986 A mesh-independence principle for operator equations and their discretizations | 2 |  | autor clave D03 |
| 283 | 2026-10-01 | CrossRef | Hettich Kortanek 1993 Semi-infinite programming theory methods and applications SIAM Review | 2 |  | autor clave D04 |
| 284 | 2026-10-01 | CrossRef | Bonnans Festa 2017 Error estimates for the Euler discretization of an optimal control problem with first-order state constraints | 2 |  | autor clave D05 |
| 285 | 2026-10-01 | CrossRef | Garg Patterson Hager Rao Benson Huntington 2010 A unified framework for the numerical solution of optimal control problems using pseudospectral methods Automatica | 2 |  | autor clave D06 |
| 286 | 2026-10-01 | CrossRef | Ross Karpenko 2012 A review of pseudospectral optimal control from theory to flight Annual Reviews in Control | 2 |  | autor clave D07 |
| 287 | 2026-10-01 | CrossRef | Gerdts 2012 Optimal control of ODEs and DAEs De Gruyter | 2 |  | autor clave D08 |
| 288 | 2026-10-01 | CrossRef | Veliov 1997 On the time-discretization of control systems SIAM J Control Optim | 2 |  | autor clave D09 |
| 289 | 2026-10-01 | CrossRef | Alt Baier Gerdts Lempio 2012 Error bounds for Euler approximation of linear-quadratic control problems with bang-bang solutions | 2 |  | autor clave D10 |
| 290 | 2026-10-01 | CrossRef | Spasojevic Murali Karaman 2019 Asymptotic optimality of a time optimal path parametrization algorithm IEEE Control Systems Letters | 2 |  | autor clave D11 |
| 291 | 2026-10-01 | CrossRef | Consolini Laurini Locatelli Cabassi 2020 Convergence analysis of spatial-sampling-based algorithms for time-optimal smooth velocity planning | 2 |  | autor clave D12 |
| 292 | 2026-10-01 | CrossRef | Elgindy 2023 Optimal periodic control of unmanned aerial vehicles based on Fourier integral pseudospectral and edge-detection methods | 2 |  | autor clave D13 |
| 293 | 2026-10-01 | CrossRef | Dontchev Hager 2001 The Euler approximation in state constrained optimal control Mathematics of Computation | 2 |  | autor clave D14 |
| 294 | 2026-10-01 | CrossRef | Dontchev Hager Veliov 2000 Uniform convergence and mesh independence of Newton's method for discretized variational problems | 2 |  | autor clave D15 |
| 295 | 2026-10-01 | CrossRef | Kang Gong Ross 2008 On the convergence of nonlinear optimal control using pseudospectral methods for feedback linearizable systems | 2 |  | autor clave D16 |
| 296 | 2026-10-01 | CrossRef | Neuenhofen Kerrigan 2020 An integral penalty-barrier direct transcription method for optimal control | 2 |  | autor clave D17 |
| 297 | 2026-10-01 | CrossRef | Caillau Ferretti Trelat Zidani 2022 An algorithmic guide for finite-dimensional optimal control problems | 2 |  | autor clave D18 |
| 298 | 2026-10-01 | CrossRef | Ober-Blobaum Junge Marsden 2011 Discrete mechanics and optimal control: an analysis ESAIM | 2 |  | autor clave D19 |
| 299 | 2026-10-01 | CrossRef | Polak 1997 Optimization algorithms and consistent approximations Springer | 2 |  | autor clave D20 |
| 300 | 2026-10-01 | OpenAlex | "single-track" "minimum lap time" "load transfer" | 36 | 25 devueltos (orden relevancia) | N5a bicicleta (guiñada, dirección, transferencia) |
| 301 | 2026-10-01 | OpenAlex | "bicycle model" "minimum time" "trail braking" | 12 | 12 devueltos (orden relevancia) | N5a bicicleta (guiñada, dirección, transferencia) |
| 302 | 2026-10-01 | OpenAlex | "yaw inertia" "minimum time" manoeuvre | 43 | 25 devueltos (orden relevancia) | N5a bicicleta (guiñada, dirección, transferencia) |
| 303 | 2026-10-01 | OpenAlex | "single track" vehicle "time-optimal" cornering | 117 | 25 devueltos (orden relevancia) | N5a bicicleta (guiñada, dirección, transferencia) |
| 304 | 2026-10-01 | OpenAlex | "minimum-time cornering" vehicle model | 47 | 25 devueltos (orden relevancia) | N5a bicicleta (guiñada, dirección, transferencia) |
| 305 | 2026-10-01 | OpenAlex | "double-track" "minimum lap time" | 31 | 25 devueltos (orden relevancia) | N5b cuatro ruedas, neumáticos, diferencial |
| 306 | 2026-10-01 | OpenAlex | "Formula One" "minimum lap time" "optimal control" | 79 | 25 devueltos (orden relevancia) | N5b cuatro ruedas, neumáticos, diferencial |
| 307 | 2026-10-01 | OpenAlex | "two-track" "minimum-time" trajectory vehicle | 92 | 25 devueltos (orden relevancia) | N5b cuatro ruedas, neumáticos, diferencial |
| 308 | 2026-10-01 | OpenAlex | "tyre" "combined slip" "minimum lap time" | 8 | 8 devueltos (orden relevancia) | N5b cuatro ruedas, neumáticos, diferencial |
| 309 | 2026-10-01 | OpenAlex | "differential" "minimum lap time" "optimal control" | 95 | 25 devueltos (orden relevancia) | N5b cuatro ruedas, neumáticos, diferencial |
| 310 | 2026-10-01 | OpenAlex | "three-dimensional" track "minimum lap time" | 73 | 25 devueltos (orden relevancia) | N5c pista 3D, motocicleta, multicuerpo |
| 311 | 2026-10-01 | OpenAlex | "motorcycle" "minimum lap time" "optimal control" | 53 | 25 devueltos (orden relevancia) | N5c pista 3D, motocicleta, multicuerpo |
| 312 | 2026-10-01 | OpenAlex | "multibody" "minimum lap time" | 53 | 25 devueltos (orden relevancia) | N5c pista 3D, motocicleta, multicuerpo |
| 313 | 2026-10-01 | OpenAlex | "road racing motorcycle" "optimal control" track | 9 | 9 devueltos (orden relevancia) | N5c pista 3D, motocicleta, multicuerpo |
| 314 | 2026-10-01 | OpenAlex | "3D" "race track" "optimal control" vehicle | 116 | 25 devueltos (orden relevancia) | N5c pista 3D, motocicleta, multicuerpo |
| 315 | 2026-10-01 | OpenAlex | "relaxed controls" vehicle "optimal control" existence | 96 | 25 devueltos (orden relevancia) | N5 teoría: convexidad y relajación |
| 316 | 2026-10-01 | OpenAlex | "nonconvex" "velocity set" relaxation "optimal control" existence | 24 | 24 devueltos (orden relevancia) | N5 teoría: convexidad y relajación |
| 317 | 2026-10-01 | OpenAlex | "chattering" "minimum time" vehicle | 386 | 25 devueltos (orden relevancia) | N5 teoría: convexidad y relajación |
| 318 | 2026-10-01 | OpenAlex | "existence of optimal solutions" "vehicle dynamics" | 6 | 6 devueltos (orden relevancia) | N5 teoría: convexidad y relajación |
| 319 | 2026-10-01 | OpenAlex | "convexification" "tire forces" "optimal control" | 13 | 13 devueltos (orden relevancia) | N5 teoría: convexidad y relajación |
| 320 | 2026-10-01 | OpenAlex | "Young measures" "optimal control" relaxation existence | 232 | 25 devueltos (orden relevancia) | N5 teoría: convexidad y relajación |
| 321 | 2026-10-01 | arXiv | ti:"algorithmic guide" AND ti:"optimal control" | 1 | 1 devueltos | N4 arXiv |
| 322 | 2026-10-01 | arXiv | ti:"dynamic optimization" AND ti:"convergence guarantees" | 1 | 1 devueltos | N4 arXiv |
| 323 | 2026-10-01 | arXiv | all:"Gamma-convergence" AND all:"discrete" AND all:"elastica" | 0 | 0 devueltos | N4 arXiv |
| 324 | 2026-10-01 | GitHub | racing line optimization (repositorios, orden estrellas) | 45 |  | N6 software |
| 325 | 2026-10-01 | GitHub | lap time simulation (orden estrellas) | 122 | 8 devueltos | N6 software |
| 326 | 2026-10-01 | GitHub | minimum lap time (orden estrellas) | 16 | 8 devueltos | N6 software |
| 327 | 2026-10-01 | GitHub | raceline optimization (orden estrellas) | 24 | 8 devueltos | N6 software |
| 328 | 2026-10-01 | GitHub | race trajectory optimization (orden estrellas) | 5 | 5 devueltos | N6 software |
| 329 | 2026-10-01 | GitHub | minimum curvature trajectory race (orden estrellas) | 2 | 2 devueltos | N6 software |
| 330 | 2026-10-01 | GitHub | racing line web app (orden estrellas) | 2 | 2 devueltos | N6 software |
| 331 | 2026-10-01 | GitHub | repos/TUMFTM/global_racetrajectory_optimization | 1 | existe | N6 software |
| 332 | 2026-10-01 | GitHub | repos/TUMFTM/laptime-simulation | 1 | existe | N6 software |
| 333 | 2026-10-01 | GitHub | repos/TUMFTM/trajectory_planning_helpers | 1 | existe | N6 software |
| 334 | 2026-10-01 | GitHub | repos/TUMFTM/racetrack-database | 1 | existe | N6 software |
| 335 | 2026-10-01 | GitHub | repos/mc12027/OpenLAP-Lap-Time-Simulator | 1 | existe | N6 software |
| 336 | 2026-10-01 | GitHub | repos/alexliniger/MPCC | 1 | existe | N6 software |
| 337 | 2026-10-01 | GitHub | repos/ebertolazzi/Clothoids | 1 | existe | N6 software |
| 338 | 2026-10-01 | GitHub | repos/ForzaETH/race_stack | 1 | existe | N6 software |
| 339 | 2026-10-01 | OpenAlex | "OptimumLap" | 47 | 10 devueltos | N6 software (literatura) |
| 340 | 2026-10-01 | OpenAlex | "ChassisSim" | 11 | 10 devueltos | N6 software (literatura) |
| 341 | 2026-10-01 | OpenAlex | "Canopy Simulations" | 393 | 10 devueltos | N6 software (literatura) |
| 342 | 2026-10-01 | OpenAlex | "lap time simulation" software commercial comparison | 43 | 10 devueltos | N6 software (literatura) |
| 343 | 2026-10-01 | OpenAlex | "lap time simulator" "open source" | 7 | 7 devueltos | N6 software (literatura) |
| 344 | 2026-10-01 | PyPI | trajectory-planning-helpers | 1 | HTTP 200 0.79 | N6 software |
| 345 | 2026-10-01 | PyPI | casadi | 1 | HTTP 200 3.8.1 | N6 software |
| 346 | 2026-10-01 | PyPI | laptimesim | 0 | HTTP 404  | N6 software |
| 347 | 2026-10-01 | arXiv | ti:"minimum-time velocity planning" AND ti:"lattice" | 1 |  | metadatos arXiv 1809.01959 |
| 348 | 2026-10-01 | CrossRef | Saba Schneider Hormann Scateni Curvature-based blending of closed planar curves | 1 |  | metadatos Saba 2014 |
| 349 | 2026-10-01 | CrossRef | Consolini Laurini Locatelli Minari solution of the minimum-time velocity planning problem based on lattice theory | 2 |  | versión publicada arXiv 1809.01959 |
| 350 | 2026-10-01 | arXiv | all:2208.12135 | 1 |  | metadatos arXiv 2208.12135 |
| 351 | 2026-10-01 | arXiv | all:2404.16826 | 1 |  | metadatos arXiv 2404.16826 |
| 352 | 2026-10-01 | arXiv | all:2208.04305 | 1 |  | metadatos arXiv 2208.04305 |
| 353 | 2026-10-01 | OpenAlex (autorías) | instituciones de 40 trabajos clave | 37 | afiliaciones según metadatos OpenAlex | grupos activos |
