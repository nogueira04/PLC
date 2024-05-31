dna2 :: [String] -> [String] -> [Int]
dna2 envelope0 envelope1 = [cisnalCount, iguanoideCount, narvaleCount]
  where
    similarityScores = map calculateSimilarity (zip envelope0 envelope1)
    cisnalCount = length (filter (\x -> x >= 0.1 && x <= 0.3) similarityScores)
    iguanoideCount = length (filter (\x -> x >= 0.4 && x <= 0.7) similarityScores)
    narvaleCount = length (filter (\x -> x >= 0.8) similarityScores)
    calculateSimilarity (word0, word1) = fromIntegral (dotProduct word0 word1) / fromIntegral (max (length word0) (length word1))
    dotProduct xs ys = sum [if x == y then 1 else 0 | (x, y) <- zip xs ys]

main = do
    firstExtract <- words <$> getLine                       -- equivalente a (read firstExtract :: [String])
    secondExtract <- words <$> getLine
    let result = dna2 firstExtract secondExtract
    print result