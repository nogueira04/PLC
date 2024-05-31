maquinaSomar :: [Int] -> [Int]
maquinaSomar xs = processarLista xs 0 False
  where
    processarLista :: [Int] -> Int -> Bool -> [Int]
    processarLista [] soma _ = if soma /= 0 then [soma] else []
    processarLista (0:0:_) soma _ = if soma /= 0 then [soma] else []
    processarLista (0:xs) soma _ = if soma /= 0 then soma : processarLista xs 0 True else processarLista xs 0 True
    processarLista (x:xs) soma _ = processarLista xs (soma + x) False

main = do
    lista <- getLine
    print $ maquinaSomar (read lista :: [Int])