data Tree t = Node t (Tree t) (Tree t) | Nilt deriving (Read, Show)

getFirstN :: Int -> [t] -> [t]
getFirstN 0 _ = []
getFirstN _ [] = []
getFirstN n (x:xs) = x : getFirstN (pred n) xs

dna1 :: Tree Int -> [String]
dna1 tree = chunk 8 (inorder tree)
  where
    inorder Nilt = []
    inorder (Node x l r) = (inorder l) ++ [convert x] ++ (inorder r)
    convert x = case x `mod` 5 of
      0 -> 'E'
      1 -> 'M'
      2 -> 'A'
      3 -> 'C'
      4 -> 'S'
    chunk _ [] = []
    chunk n xs = getFirstN n xs : chunk n (drop n xs)

main = do
    input <- getLine
    let result = dna1 (read input :: Tree Int)
    print result