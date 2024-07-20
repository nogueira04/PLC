bSort :: [String] -> [String]
bSort [] = []
bSort xs = bubble xs (length xs)
  where -- Definição de função auxiliar
    bubble xs 0 = xs -- Tipo implícito [String] -> Int -> [String]
    bubble xs n = bubble (pass xs) (n - 1)
    -- Para n > 0, aplicamos a função auxiliar "pass" para fazer uma
    -- passagem pela lista (onde os elementos são trocados se neces-
    -- sário), daí, chamamos novamente pass para n -1.)
    pass [x] = [x] -- Tipo implícito [String]d -> [String]
    pass (x:y:xs)
      | x > y     = y : pass (x:xs)
      | otherwise = x : pass (y:xs)
    -- Se a string x > string y, coloca y na cabeça resultante e continua
    -- a comparação com o restante da lista. Caso contrário, mantém x na
    -- frente e continua a comparação com o restante da lista.

main = do
    a <- getLine
    let result = bSort (read a :: [String])
    print result