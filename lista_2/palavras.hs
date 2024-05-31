wordFrequency :: String -> [String] -> Int
wordFrequency str [] = 0
wordFrequency str (x:xs) = (if str == x then 1 else 0) + wordFrequency str xs

palavraMaisFrequente :: [String] -> String
palavraMaisFrequente [] = ""
palavraMaisFrequente (x:xs)
    | wordFrequency x xs > wordFrequency (palavraMaisFrequente xs) xs = x
    | wordFrequency x xs == wordFrequency (palavraMaisFrequente xs) xs = if x >= palavraMaisFrequente xs then x else palavraMaisFrequente xs
    | otherwise = palavraMaisFrequente xs

removeStr :: String -> [String] -> [String]
removeStr _ [] = []
removeStr str (x:xs)
    | x == str = removeStr str xs
    | otherwise = x : removeStr str xs

getFirstN :: Int -> [t] -> [t]
getFirstN 0 _ = []
getFirstN _ [] = []
getFirstN n (x:xs) = x : getFirstN (pred n) xs

palavrasFrequentesAux :: [String] -> [String]
palavrasFrequentesAux [] = []
palavrasFrequentesAux xs = palavraMaisFrequente xs : palavrasFrequentesAux (removeStr (palavraMaisFrequente xs) xs)

palavrasFrequentes :: [String] -> [String]
palavrasFrequentes [] = []
palavrasFrequentes xs = getFirstN 3 (palavrasFrequentesAux xs)