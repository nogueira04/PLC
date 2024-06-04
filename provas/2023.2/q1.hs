insert :: [t] -> [t] -> Int -> [t]
insert xs ys n = take (if n >= 0 then n else 0) ys ++ xs ++ drop (if n >= 0 then n else 0) ys