-- A função splitOn divie uma string em substrings, usando um char especial
-- delimitador específico, retornando uma lista de substrings.
splitOn :: Char -> String -> [String] -- Recebe um caractere delimitador, uma string, e retorna uma lista.
splitOn _ [] = [""] -- Se a lista está vazia, retorna uma lista contendo uma string vazia.
splitOn delim (c:cs) 
    | c == delim = "" : rest -- Se o caractere atual é o delimitador, adiciona uma
                             -- string vazia ao início da lista resultante, pois
                             -- encontramos o delimitador, então devemos iniciar
                             -- uma nova substring.
    | otherwise = (c : head rest) : tail rest -- Se o char atual não é o delimitador, 
                                              -- adiciona-o ao início da primeira str em rest,
                                              -- para continuar constuindo a substring atual.
  where
    rest = splitOn delim cs -- Divide o resto da string cs pelo delimitador.


-- A função extractValues extrai valores numéricos de uma string formatada,
-- convertendo-os para uma lista de Double. A string de entrada usa ; como
-- delimitador entre os diferentes campos.
extractValues :: String -> [Double]
extractValues s = map readDouble values
  where
    parts = splitOn ';' s -- Divide a string s em substrings.

    values = filter isCompra (drop 2 parts)
    -- "drop 2 parts" descarta os dois primeiros elementos da lista parts.
    -- "filter is compra" filtra as strings que podem ser convertidas para
    -- Doble válidos.

    isCompra :: String -> Bool
    isCompra val = case reads val :: [(Double, String)] of
        [(_, "")] -> True
        _ -> False
    
    readDouble :: String -> Double
    readDouble str = case reads str of
        [(val, "")] -> val
        _ -> 0.0

minMaxCartao :: String -> (Double, Double)
minMaxCartao s = (minimum values, maximum values)
  where
    values = extractValues s

    
main = do
    a <- getLine
    let result = minMaxCartao a
    print result
