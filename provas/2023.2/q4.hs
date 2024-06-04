data TimeOfDay = AM Int Int -- hora e minuto antes do meio dia
                | PM Int Int -- hora e minuto após o meio dia
                deriving (Show)

data Resultado t = Success t
                |  Fail t
                deriving Show

convertTime :: Int -> Int -> Resultado TimeOfDay
convertTime h m
    | h < 0 || h > 23 || m < 0 || m > 59 = Fail (AM (-1) (-1))
    | h > 12 = Success (PM (h `mod` 12) m)
    | otherwise = Success (AM h m)