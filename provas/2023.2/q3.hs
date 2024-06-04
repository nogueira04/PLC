data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)

somaMinutos :: TimeOfDay -> Int -> TimeOfDay
somaMinutos (AM h m) n
    | (m + n `mod` 60) >= 60 = PM (h + ((m + n) `div` 60)) ((m + n) `mod` 60)
    | otherwise = AM (h + ((m + n) `div` 60)) ((m + n) `mod` 60)
somaMinutos (PM h m) n 
    | (m + n `mod` 60) >= 60 = AM (h + ((m + n) `div` 60)) ((m + n) `mod` 60)
    | otherwise = PM (h + ((m + n) `div` 60)) ((m + n) `mod` 60)