data Tree t = Node t (Tree t) (Tree t)
    | Nilt
    deriving (Read)

alturaArvore :: Tree t -> Int
alturaArvore Nilt = 0
alturaArvore (Node _ l r)
            | alturaArvore l > alturaArvore r = 1 + alturaArvore l
            | otherwise = 1 + alturaArvore r

main = do
    a <- getLine
    let result = alturaArvore (read a::Tree Int)
    print result