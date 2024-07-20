-- Função que processa a string e retorna o total gasto no mês especificado
logMes :: String -> String -> Double
logMes mes s = foldl (+) 0.0 (extrairValores mes s)

-- Função para dividir a string usando um delimitador
splitOn :: Char -> String -> [String]
splitOn _ [] = [""]
splitOn delim (c:cs)
    | c == delim = "" : rest
    | otherwise = (c : head rest) : tail rest
  where
    rest = splitOn delim cs

-- Função para extrair os valores correspondentes ao mês
extrairValores :: String -> String -> [Double]
extrairValores mes s = [read valor :: Double | (d, t, c, valor) <- parseFatura s, mes == obterMes d]

-- Função para obter o mês a partir da data
obterMes :: String -> String
obterMes = drop 3

-- Função para parsear a fatura em tuplas de (data, tipo, compra, valor)
parseFatura :: String -> [(String, String, String, String)]
parseFatura s = agrupar 4 (splitOn ';' s)

-- Função para agrupar elementos em n-tuplas
agrupar :: Int -> [a] -> [(a, a, a, a)]
agrupar (4) (a:b:c:d:xs) = (a, b, c, d) : agrupar 4 xs
agrupar _ _ = []

