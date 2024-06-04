is_in :: String -> String -> Bool
is_in [] _ = True
is_in _ [] = False
is_in (x:xs) (y:ys) = if x == y then has_rest xs ys else is_in (x:xs) ys
  where
    has_rest [] _ = True
    has_rest _ [] = False
    has_rest (a:as) (b:bs) = if a == b then has_rest as bs else is_in (x:xs) ys

localizar :: String -> String -> Int
localizar [] _ = 0
localizar search str
    | is_in search str = index search str 1
    | otherwise = 0
        where 
            index [] _ n = n
            index (x:xs) (y:ys) n = if x == y && has_rest xs ys n then n else index (x:xs) ys (n + 1)
            
            has_rest [] _ _ = True
            has_rest _ [] _ = False
            has_rest (a:as) (b:bs) n = if a == b then has_rest as bs n else False

            