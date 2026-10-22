-- =====================================================================
-- CI-3661 — Tarea 1 (Haskell) — Septiembre–Diciembre 2026
--
-- Nombre: John Garrido
-- Carnet: 20-10293
--
-- Declaración de uso de herramientas de IA (obligatoria, ver enunciado):
-- Se utilizó un asistente de IA (Gemini) como apoyo para consultar
-- conceptos de Haskell, revisar casos de prueba y planificar la tarea.
-- =====================================================================
-- No cambies el nombre del módulo ni la lista de exportación, ni las
-- firmas de las funciones. Puedes agregar todas las funciones auxiliares
-- que quieras. El único import permitido es Data.Char.
-- =====================================================================
module Tarea1
  ( esPalindromo
  , mayorYMenor
  , leerHora
  , duracion
  , promedioSobreUmbral
  , movimientosCaballo
  , enDosSaltos
  , miMap
  , miFilter
  , miFoldl
  ) where

import Data.Char (isAlphaNum, isDigit, toLower, digitToInt)

-- =====================================================================
-- Parte A: recursión explícita.
-- Prohibido: map, filter, foldr, foldl, listas por comprensión, reverse,
-- maximum, minimum, all, any y cualquier otra función de orden superior.
-- =====================================================================

-- A1
esPalindromo :: String -> Bool
esPalindromo s = sonIguales limpia (invertir limpia)
  where
    limpia = limpiarCadena s

-- Filtra caracteres no alfanuméricos y convierte a minúsculas de forma recursiva
limpiarCadena :: String -> String
limpiarCadena [] = []
limpiarCadena (c:cs)
  | isAlphaNum c = toLower c : limpiarCadena cs
  | otherwise    = limpiarCadena cs

-- Invierte una lista en un solo recorrido acumulando en O(n)
invertir :: [a] -> [a]
invertir xs = revAcc xs []
  where
    revAcc :: [a] -> [a] -> [a]
    revAcc [] acc     = acc
    revAcc (y:ys) acc = revAcc ys (y:acc)

-- Compara dos listas elemento a elemento recursivamente
sonIguales :: Eq a => [a] -> [a] -> Bool
sonIguales [] []         = True
sonIguales (x:xs) (y:ys) = x == y && sonIguales xs ys
sonIguales _ _           = False

-- A2
-- Explica aquí, en dos o tres líneas, por qué tu solución recorre la
-- lista una sola vez:
-- La función auxiliar 'buscarExtremos' recorre la lista mediante recursión
-- estructural sobre la cola en una única pasada lineal O(n), manteniendo y
-- actualizando los valores (actualMax, actualMin) hasta alcanzar el caso base.
mayorYMenor :: Ord a => [a] -> Maybe (a, a)
mayorYMenor []     = Nothing
mayorYMenor (x:xs) = Just (buscarExtremos xs x x)

buscarExtremos :: Ord a => [a] -> a -> a -> (a, a)
buscarExtremos [] actualMax actualMin = (actualMax, actualMin)
buscarExtremos (y:ys) actualMax actualMin =
  buscarExtremos ys nuevoMax nuevoMin
  where
    nuevoMax = if y > actualMax then y else actualMax
    nuevoMin = if y < actualMin then y else actualMin

-- A3
leerHora :: String -> Either String (Int, Int)
leerHora [h1, h2, ':', m1, m2]
  | not (isDigit h1 && isDigit h2 && isDigit m1 && isDigit m2) = Left "formato inválido"
  | horas > 23   = Left "hora fuera de rango"
  | minutos > 59 = Left "minutos fuera de rango"
  | otherwise    = Right (horas, minutos)
  where
    horas   = digitToInt h1 * 10 + digitToInt h2
    minutos = digitToInt m1 * 10 + digitToInt m2
leerHora _ = Left "formato inválido"

duracion :: String -> String -> Either String Int
duracion s1 s2 =
  case leerHora s1 of
    Left err1 -> Left err1
    Right (h1, m1) ->
      case leerHora s2 of
        Left err2 -> Left err2
        Right (h2, m2) ->
          let total1 = h1 * 60 + m1
              total2 = h2 * 60 + m2
              diff   = total2 - total1
          in if diff >= 0
             then Right diff
             else Right (diff + 24 * 60)

-- =====================================================================
-- Parte B: orden superior.
-- Prohibido: recursión explícita (ninguna función de esta parte, ni sus
-- auxiliares, puede llamarse a sí misma).
-- =====================================================================

-- B1
promedioSobreUmbral :: Double -> [Double] -> Maybe Double
promedioSobreUmbral umbral xs =
  case foldr paso (0.0, 0 :: Int) xs of
    (_, 0)       -> Nothing
    (suma, cant) -> Just (suma / fromIntegral cant)
  where
    paso x (s, c)
      | x > umbral = (s + x, c + 1)
      | otherwise  = (s, c)

-- B2
movimientosCaballo :: (Int, Int) -> [(Int, Int)]
movimientosCaballo = undefined

enDosSaltos :: (Int, Int) -> Int
enDosSaltos = undefined

-- B3
miMap :: (a -> b) -> [a] -> [b]
miMap = undefined

miFilter :: (a -> Bool) -> [a] -> [a]
miFilter = undefined

miFoldl :: (b -> a -> b) -> b -> [a] -> b
miFoldl = undefined
