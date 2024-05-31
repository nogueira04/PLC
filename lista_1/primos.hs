fatPrime :: Int -> [(Int, Int)]
fatPrime n = fatorar n 2
  where
    fatorar :: Int -> Int -> [(Int, Int)]
    fatorar 1 _ = []
    fatorar n f
      | n < f * f = [(n, 1)] 
      | n `mod` f == 0 = let (m, c) = contarFatores n f in (f, c) : fatorar m (f + 1)
      | otherwise = fatorar n (f + 1)

    contarFatores :: Int -> Int -> (Int, Int)
    contarFatores n f = contarFatoresAux n f 0

    contarFatoresAux :: Int -> Int -> Int -> (Int, Int)
    contarFatoresAux n f count
      | n `mod` f == 0 = contarFatoresAux (n `div` f) f (count + 1)
      | otherwise = (n, count)


main = do
a <- getLine
let result = fatPrime (read a :: Int)
print result
