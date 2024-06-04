wordFrequency :: String -> [String] -> Int
wordFrequency str [] = 0
wordFrequency str (x:xs) = (if str == x then 1 else 0) + wordFrequency str xs

removeStr :: String -> [String] -> [String]
removeStr _ [] = []
removeStr str (x:xs)
    | x == str = removeStr str xs
    | otherwise = x : removeStr str xs

type WordCount = [(String, Int)]

countFrequency :: [String] -> WordCount
countFrequency [] = []
countFrequency (x:xs) = (x, 1 + wordFrequency x xs) : countFrequency (removeStr x xs)

maxFrequencyWord :: WordCount -> String
maxFrequencyWord [] = ""
maxFrequencyWord [x] = fst x
maxFrequencyWord (x:xs)
    | snd x > snd (head xs) = fst x
    | snd x == snd (head xs) && fst x >= fst (head xs) = fst x
    | otherwise = maxFrequencyWord xs

removeWord :: String -> WordCount -> WordCount
removeWord _ [] = []
removeWord str (x:xs)
    | fst x == str = removeWord str xs
    | otherwise = x : removeWord str xs

palavrasFrequentesAux :: WordCount -> [String]
palavrasFrequentesAux [] = []
palavrasFrequentesAux wc = let maxWord = maxFrequencyWord wc
                            in maxWord : palavrasFrequentesAux (removeWord maxWord wc)

palavrasFrequentes :: [String] -> [String]
palavrasFrequentes [] = []
palavrasFrequentes xs = take 3 (palavrasFrequentesAux (countFrequency xs))

main = do
    lista <- getLine
    print $ palavrasFrequentes (read lista :: [String])