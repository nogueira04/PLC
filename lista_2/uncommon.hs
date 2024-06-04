uncommonFromTwoSentences :: String -> String -> [String]
uncommonFromTwoSentences s1 s2 = sort (removeDuplicates (filter (\x -> count x ws1 == 1 && count x ws2 == 0 || count x ws2 == 1 && count x ws1 == 0) (ws1 ++ ws2)))
  where
    ws1 = words (map toLower s1)
    ws2 = words (map toLower s2)
    count x = length . filter (==x)
    removeDuplicates [] = []
    removeDuplicates (x:xs)
      | x `elem` xs = removeDuplicates xs
      | otherwise   = x : removeDuplicates xs
    toLower c
      | 'A' <= c && c <= 'Z' = toEnum (fromEnum c + 32) :: Char
      | otherwise = c
    sort [] = []
    sort (x:xs) = sort [y | y <- xs, y <= x] ++ [x] ++ sort [y | y <- xs, y > x]

main = do
    sentence_1 <- getLine
    sentence_2 <- getLine
    let result = uncommonFromTwoSentences sentence_1 sentence_2
    print result
