# PROMPT 3 — Aplicación web para ingresar la pista y ver la trayectoria óptima

> Modelo sugerido: Opus, esfuerzo alto.
> Requisito: Fase 2 terminada (`v2\REPORTE_FASE2.md`).

---

## Rol

Actuá como desarrollador full-stack con experiencia en visualización interactiva y en aplicaciones científicas.

## Contexto

1. Leé `00_CONTEXTO.md`.
2. Leé `v2\REPORTE_FASE2.md` y la API de `v2\python\`.
3. Leé `v2\PENDIENTES_MODELO.md`.

Trabajá en `v2\web\`.

## Objetivo

Crear una aplicación web pública y gratuita. Cualquier persona debe poder ingresar una pista cerrada y obtener la trayectoria óptima, la velocidad y la aceleración. Prioridad: facilidad de uso.

## Fase 3.0 — Evaluación (antes de programar)

Presentame una comparación. Esperá mi decisión.

1. Arquitecturas:
   - (a) Sitio estático + Pyodide (sin servidor, hosting gratis).
   - (b) Frontend + API Python con CasADi (FastAPI u otro).
   - (c) Híbrido: vista previa rápida en navegador y solución precisa en servidor.
2. Para cada una: costo, hosting posible, latencia, límites, mantenimiento, privacidad.
3. Stack de frontend recomendado y motivo.
4. Recomendación final.

## Fase 3.1 — Ingreso de la pista

Implementá estos modos. Todos producen el mismo formato: línea media periódica + anchos.

1. **Dibujo a mano alzada.** Trazar la línea media con mouse o dedo. Suavizado, cierre automático, remuestreo. Ancho global ajustable.
2. **Puntos de control.** Clic para agregar puntos. Spline periódica editable. Arrastrar puntos. Ancho editable por punto.
3. **Calcar sobre imagen.** Subir imagen o captura de mapa. Calibrar escala con dos puntos y una distancia conocida. Rotar y ajustar opacidad. Trazar encima.
4. **Importar archivo.** CSV (x, y, w_izq, w_der; formato TUM), bordes interno/externo (formato de la tesis), GPX, KML (Google Earth), trazado SVG.
5. **Biblioteca de circuitos.** Ejemplos de la tesis y circuitos reales. Verificá la licencia de cada fuente (p. ej. repositorio TUMFTM/racetrack-database) antes de incluirla.
6. **Generador aleatorio.** Pistas válidas al azar, con semilla reproducible.
7. **Búsqueda en OpenStreetMap (opcional).** Buscar un autódromo por nombre (etiqueta `highway=raceway`) y extraer el trazado. Evaluá viabilidad y licencia (ODbL).
8. **Formas paramétricas.** Óvalo, rectángulo redondeado, ocho no (debe ser simple), chicana. Útiles para docencia.

Validación en vivo:

- Avisar autointersecciones, ancho nulo, curvatura excesiva de bordes.
- Proponer corrección automática cuando sea posible.
- Mostrar sentido de giro y línea de largada.

## Fase 3.2 — Parámetros y cálculo

1. Parámetros: μ (o μt y μn), g, calidad (nodos). Valores por defecto físicos.
2. Presets de vehículo: kart, turismo, prototipo. Declarar supuestos.
3. Barra de progreso y cancelación.
4. Cálculo en Web Worker (si es navegador) para no congelar la interfaz.

## Fase 3.3 — Resultados

1. Trayectoria sobre la pista, coloreada por velocidad.
2. Comparación con la línea media.
3. Gráficos vs distancia y vs tiempo: velocidad, aceleración tangencial, aceleración normal, uso de la elipse (%).
4. Diagrama g-g.
5. Tiempo de vuelta y sectores.
6. Animación del punto recorriendo la vuelta, con control de velocidad.
7. Exportar: CSV, JSON, PNG, PDF. Enlace para compartir (estado codificado en la URL o archivo).

## Fase 3.4 — Calidad

1. Interfaz en español e inglés.
2. Uso en celular y tablet.
3. Accesibilidad básica (contraste, teclado).
4. Página "Cómo funciona": modelo, supuestos, limitaciones, cita de la tesis.
5. Tests end-to-end con Playwright.
6. Tutorial guiado de 1 minuto para usuarios nuevos.

## Entregables

- Aplicación en `v2\web\`.
- Instrucciones de despliegue.
- `v2\REPORTE_FASE3.md`: decisiones, límites, pendientes.
- Hallazgos en `v2\PENDIENTES_MODELO.md`.
- Guardá `REPORTE_FASE3.md` en el Project.

## Reglas

- Escribí en español técnico controlado. Frases cortas.
- Si no sabés algo, decilo.
- No despliegues nada público sin mi aprobación.
- Mostrame un prototipo navegable de la Fase 3.1 antes de seguir.
- Reportá avance al terminar cada subfase.
