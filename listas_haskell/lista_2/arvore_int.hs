data Ops = SUM | MUL | SUB
            deriving (Read, Eq)

data IntTree = Nilt Int |
                Node Ops IntTree IntTree
                deriving (Read)

evalTree :: IntTree -> Int
evalTree (Nilt x) = x   
evalTree (Node SUM l r) = evalTree l + evalTree r
evalTree (Node MUL l r) = evalTree l * evalTree r
evalTree (Node SUB l r) = evalTree l - evalTree r

main = do
    s <- getLine
    let result = evalTree (read s)
    print result