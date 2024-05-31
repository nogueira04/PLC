import Data.Char

charHexToDec :: Char -> Int
charHexToDec char
    | char >= '0' && char <= '9' = ord char - ord '0'
    | char == 'A' = 10
    | char == 'B' = 11
    | char == 'C' = 12
    | char == 'D' = 13
    | char == 'E' = 14
    | char == 'F' = 15
    | otherwise   = 0

hexToDec :: String -> Int
hexToDec (x:xs)
    | (x:xs) == [] = 0
    | length (x:xs) == 1 = charHexToDec x
    | otherwise = ((charHexToDec x) * (16 ^ (length xs))) + hexToDec xs

decToBin :: Int -> String
decToBin dec
    | dec == 0 = []
    | dec `mod` 2 == 1 = decToBin (dec `div` 2) ++ "1"
    | otherwise = decToBin (dec `div` 2) ++ "0"

isTwoPotencia :: Int -> Bool
isTwoPotencia n
  | n <= 0    = False
  | n == 1    = True
  | n `mod` 2 == 0    = isTwoPotencia (n `div` 2)
  | otherwise = False


formatBin :: String -> String
formatBin str
    | str == [] = []
    | isTwoPotencia (length str) = str
    | otherwise = formatBin ("0" ++ str)

htob :: String -> String
htob str
    | str == [] = []
    | otherwise = formatBin (decToBin (hexToDec str))

main = do
    s <- getLine
    let result = htob s
    print result
