meio :: String -> Int -> Int -> String
meio s start len = take len (drop (start - 1) s)