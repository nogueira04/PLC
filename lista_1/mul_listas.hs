mul2 :: [Int] -> [Int] -> [Int]
mul2 [] lista = [x * 0 | x <- lista]
mul2 lista [] = [x * 0 | x <- lista]
mul2 (x1:xs1) (x2:xs2)
    | length (x1:xs1) == length (x2:xs2) = x1 * x2 : mul2 xs1 xs2
    | length (x1:xs1) > length (x2:xs2)  = (mul2 (init (x1:xs1)) (x2:xs2)) ++ [0]
    | length (x1:xs1) < length (x2:xs2)  = (mul2 (x1:xs1) (init (x2:xs2))) ++ [0]

main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result
