# CONTEXTO — Trayectorias de tiempo óptimo en circuitos cerrados

Documento base. Todos los prompts lo usan. Leelo completo antes de trabajar.

## 1. Origen

- Trabajo especial de Licenciatura en Matemática (FaMAF–UNC, 2017).
- Carpeta: `D:\ESCRI\trabajofinal`.
- Texto principal: `planteo_problema.tex`.
- Código MATLAB vigente: `codigos/principalB.m`, `codigos/fobj_fmincon.m`, `codigos/fres_fmincon.m`, `codigos/graficar.m`, `codigos/pista_*.m`.
- Archivos viejos (no usar salvo referencia): `principal.m`, `principal2.m`, `fobj*.m`, `fres*.m`, `min_*.m`, `reg_*.m`.
- Archivos ajenos al trabajo (ejercicios de cátedra): `lab*`, `gseidel*`, `jacobi*`, `newton.m`, `bisec.m`, `horn*`, etc.
- `plan trabajo/plan_trabajo.tex` es un plan doctoral distinto. No forma parte de este proyecto.

## 2. Modelo de la tesis

Partícula puntual. Se minimiza el tiempo de una vuelta.

Incógnitas: `x = (c, a, p, v0) ∈ H²[0,1]² × L²[0,1] × R₊ × R₊`.

- `c`: curva de longitud 1 parametrizada por longitud de arco (|c'| = 1).
- `p`: longitud de la trayectoria. Trayectoria física: `p·c(s)`.
- `a`: aceleración tangencial.
- `v0`: velocidad inicial.
- Velocidad: `v(s)² = 2p ∫₀ˢ a + v0²`.

Problema:

```
min  t_f = ∫₀¹ p / v(s) ds
s.a. |c'(s)|² − 1 = 0
     c, c', c'' periódicas;  ∫₀¹ a = 0;  a(1) = a(0)
     a²/μt² + v⁴ |c''|² / (μn² p²) − g² ≤ 0          (elipse de fricción)
     |p c(s) − α(s)|² − κ(s)² ≤ 0                      (permanencia, borde interno α)
     |p c(s) − β(s)|² − κ(s)² ≤ 0                      (permanencia, borde externo β)
```

κ(s) = |β(s) − α(s)| es el ancho de pista.

Discretización:

- Base de Fourier φ_j (1/2, cos 2πks, sen 2πks), n = 2m + 1 = 113.
- Restricciones funcionales impuestas por colocación en n nodos s_j = (j−1)/n.
- ∫₀ˢ φ_j se calcula en forma exacta (`Mintphi`).
- La integral de t_f usa pesos de Simpson (`qSimp`).
- Solver: `fmincon`, algoritmo `sqp`, gradientes analíticos, sin Hessiano.
- Punto inicial: línea media γ = (α + β)/2, a = 0, v0 compatible con la fricción.

## 3. Problemas detectados

### 3.1 Modelado

1. La pista α(s), β(s) usa el mismo parámetro s que la trayectoria. Ese s es la longitud de arco normalizada de la trayectoria, no de la pista. Esto acopla parámetros y restringe la solución.
2. La región admisible es una "lente" (intersección de dos discos de radio κ). No coincide con la franja real de la pista.
3. Las restricciones valen solo en los nodos. Entre nodos la curva puede salir de la pista. En `graficos/irregular/trayectoria3.jpg` la curva roja parece rozar o cruzar el borde en la horquilla derecha. Falta verificarlo numéricamente.
4. Valores usados: μn = 7, μt = 1.9. No son físicos. Neumáticos reales: μ ≈ 1–1.7.
5. No hay restricción de número de vueltas (winding number = 1).

### 3.2 Código

Revisión de consistencia código ↔ problema discreto de la tesis (30/09/2026, verificada numéricamente):

- OK: base, matrices, restricciones G1, G7, G8, G9 y derivadas coinciden con la tesis.
- OK: gradientes analíticos correctos (error relativo ~1e-10 contra diferencias finitas).
- **ERROR C1 — restricción ∫a = 0.** El código usa `Mintphi(:,end)'*a`, que es ∫₀^{s_n} a con s_n = 1 − 1/n, no ∫₀¹ a. La tesis (G₃) da ∫₀¹ a = a₁/2. Consecuencia: v(1) ≠ v(0). La velocidad y el integrando del objetivo no son periódicos. Error O(1/n). Corrección: imponer a₁ = 0 (o eliminar a₁ como variable).
- **ERROR C2 — cuadratura.** Simpson con pesos normalizados para [0,1] sobre nodos en [0, 1 − 1/n]. Error medido: 1.5e-3 (trapecio: 1e-16) en un integrando periódico suave. Además los pesos alternan 4/2 y los nodos extremos pesan 1/3: el optimizador ve nodos con peso distinto. Corrección: pesos uniformes 1/n. Con C1 corregido el integrando es periódico y la precisión es espectral.
- **ERROR C3 — dominio de v.** No hay restricción v² > 0. El código devuelve f = 1e25 fuera del dominio. Eso rompe la suavidad que supone SQP. Corrección: restricción explícita 2p∫₀^{s_j} a + v₀² ≥ ε en cada nodo.
- Estos errores cambian el problema discreto. La prueba de existencia discreta debe hacerse sobre el problema corregido.

Otros problemas de implementación:

1. (Ver C2.)
2. Sin escalado: p ~ 10³ y c ~ 10⁻³. Probable causa de fallas de convergencia (Figura circ3 de la tesis).
3. Variables `global`.
4. Productos `diag(v)*M` densos: costo O(n³) innecesario.
5. Sin Hessiano exacto (BFGS denso).
6. `interp1(...,'cubic')` en las pistas no es periódico. Produce un salto en el cierre.
7. Punto inicial con diferencias hacia adelante de primer orden.

### 3.3 Texto

1. Erratas en derivadas finitas: ∂G₁/∂c usa φᵢ en lugar de φᵢ'. ∂G₇/∂c usa φᵢφₖ' en lugar de φᵢ''φₖ''. El código está bien.
2. Lo demostrado es **existencia** de solución del problema discreto. No hay resultado de convergencia.
3. Huecos en la prueba de existencia discreta (Sección "Existencia de solución para el problema discretizado"):
   - La Proposición de cota de curvatura exige |c'| = 1 en todo s. El problema discreto la impone solo en nodos.
   - "Tomar n suficientemente grande" aparece dentro de una prueba con n fijo.
   - Se usa |ĉ| ≤ |β|. La restricción solo acota |p ĉ(s_j)| en los nodos.
   - La desigualdad isoperimétrica exige curva simple que encierre α. No está garantizado.
4. Robinson / multiplicadores en dimensión infinita: se asumen, no se prueban.

## 4. Diagnóstico teórico (hipótesis a verificar)

- Como |a| ≤ μt·g, la función s ↦ v(s)² es Lipschitz.
- Entonces v puede anularse en un punto y ∫ 1/v sigue finita. Físicamente: frenar a cero en una esquina y volver a acelerar cuesta tiempo finito.
- Donde v → 0, la cota |c''| ≤ g μn p / v² se pierde.
- Una sucesión minimizante puede formar esquinas y perder regularidad H².
- Posible causa del fracaso de la formulación débil en H².

Rutas propuestas:

- (a) Probar una cota a priori v ≥ v_min > 0 para minimizantes.
- (b) Reformular con controles en L^∞: aceleración dentro de la elipse (conjunto convexo). Aplicar Filippov–Cesari. Obtener existencia en W^{2,∞}.
- (c) Después: Γ-convergencia de las discretizaciones.
- (d) Condiciones de optimalidad en espacio funcional para "optimize-then-discretize".

## 5. Decisiones del usuario (30/09/2026)

- MATLAB R2019a + Optimization Toolbox. Se permite CasADi/IPOPT.
- Modelo: mantener la formulación de la tesis y compararla con una alternativa. Registrar ideas para buscar después el mejor modelo posible (`PENDIENTES_MODELO.md`).
- Herramienta pública: aplicación web en navegador.
- Entrada de pista: dibujo a mano alzada, puntos de control, calcar sobre imagen, importar CSV / circuitos reales, y otras opciones útiles.

## 6. Estructura de trabajo

- No modificar archivos originales.
- Todo lo nuevo va en `D:\ESCRI\trabajofinal\v2\`.
- Cada fase termina con un informe `REPORTE_FASEk.md`. La fase siguiente lo lee.
- Cada fase agrega ideas de modelado a `PENDIENTES_MODELO.md`.
- Guardar informes también en el Project "Trayectorias optimas".

## 7. Ejecución de MATLAB

- MATLAB instalado: **R2019a** (`C:\Program Files\MATLAB\R2019a\bin\matlab.exe`).
- Claude ejecuta MATLAB con un servidor de cola, heredado del proyecto MEF.
- Detalle completo: `v2\SERVIDOR_COLA_MATLAB.md`.
- Archivos: `v2\matlab\arrancar_servidor.bat`, `servidor_claude.m`, `ejecutar_job.m`.
- El usuario arranca el `.bat`. Claude encola `tarea.job.m` + `tarea.ready` y lee `tarea.out.txt` / `tarea.done`.
