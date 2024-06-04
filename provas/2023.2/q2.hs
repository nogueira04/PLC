search :: Eq t => t -> [t] -> Int
search _ [] = -1
search x xs = search' x xs 0
  where
    search' :: Eq t => t -> [t] -> Int -> Int
    search' _ [] _ = -1
    search' x (y:ys) n
      | x == y = n
      | otherwise = search' x ys (n + 1)