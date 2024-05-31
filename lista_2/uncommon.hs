uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences s1 s2 = sort (removeDuplicates (filter (\x -> count x s1 == 1 && count x s2 == 0 || count x s2 == 1 && count x s1 == 0) (words (map toLower s1 ++ " " ++ map toLower s2))))
  where
    count x = length . filter (==x) . words
    removeDuplicates [] = []
    removeDuplicates (x:xs)
      | x `elem` xs = removeDuplicates xs
      | otherwise = x : removeDuplicates xs
    toLower c
      | 'A' <= c && c <= 'Z' = toEnum (fromEnum c + 32)
      | otherwise = c
    sort [] = []
    sort (x:xs) = sort [y | y <- xs, y <= x] ++ [x] ++ sort [y | y <- xs, y > x]

main = do
    sentence_1 <- getLine
    sentence_2 <- getLine
    let result = uncommonFromTwoSentences sentence_1 sentence_2
    print result