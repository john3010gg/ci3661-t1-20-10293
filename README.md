# CI-3661 — Tarea 1 (Haskell)

**Estudiante:** John Garrido  
**Carnet:** 20-10293  
**Trimestre:** Septiembre–Diciembre 2026  

## Descripción
Solución a la Tarea 1 de Lenguajes de Programación (CI-3661).

- **Parte A (Recursión explícita):**
  - `esPalindromo`: Verifica si una cadena es palíndromo ignorando caracteres no alfanuméricos y mayúsculas/minúsculas. Sin `reverse` ni funciones de orden superior.
  - `mayorYMenor`: Encuentra el mayor y menor elemento de una lista en un único recorrido $O(n)$ usando un acumulador.
  - `leerHora`: Parsea horas en formato `HH:MM` con manejo de errores ordenados jerárquicamente (`"formato inválido"`, `"hora fuera de rango"`, `"minutos fuera de rango"`).
  - `duracion`: Calcula la diferencia en minutos entre dos horas con soporte para cruce de medianoche, usando `leerHora` y `case`.

- **Parte B (Orden superior y listas por comprensión sin recursión):**
  - `promedioSobreUmbral`: Promedia los elementos estrictamente mayores que el umbral en un único `foldr` con acumulador tupla `(Double, Int)`.
  - `movimientosCaballo`: Genera los movimientos válidos de un caballo en el tablero $[1..8] \times [1..8]$ ordenados lexicográficamente por construcción mediante listas por comprensión.
  - `enDosSaltos`: Calcula la cantidad de casillas alcanzables en dos saltos, eliminando duplicados mediante un plegado (`foldr`).
  - `miMap`, `miFilter`: Implementadas únicamente mediante `foldr`.
  - `miFoldl`: Implementación de plegado a la izquierda usando `foldr` mediante la construcción de una función acumuladora.

- **Problema 7 (`traza.txt`):**
  - Evaluación por sustitución paso a paso de `foldr (-) 0 d`, `foldl (-) 0 d` y `miFoldl (-) 0 [d1, d2]` con los cuatro últimos dígitos del carnet (`20-10293` $\to d = [0, 2, 9, 3]$).
  - Justificación conceptual de la diferencia de resultados y condición algebraica (monoide).

## Ejecución de Pruebas y Compilación
Para verificar la suite de pruebas públicas:
```bash
runghc PruebasTarea1.hs
```

Para verificar que no existan advertencias con `-Wall`:
```bash
ghc -Wall -Werror -c Tarea1.hs
```
