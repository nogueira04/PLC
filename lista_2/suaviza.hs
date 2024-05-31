suaviza :: [Float] -> [Float]
suaviza [] = []
suaviza xs = head xs : (suaviza2 xs)

suaviza2 :: [Float] -> [Float]
suaviza2 [] = []
suaviza2 [a, b] = [b]
suaviza2 (a:b:c:xs) = ((a + b + c) / 3) : suaviza2(b:c:xs)

main = do
    lista <- getLine
    print $ suaviza (read lista :: [Float])