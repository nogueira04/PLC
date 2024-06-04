data Comando = ParaFrente Int
             | ParaTras Int
             | Escreva Char
             deriving (Show, Eq)

parseComando :: String -> Comando -> Int
parseComando s (ParaFrente n) = n
parseComando s (ParaTras n) = -n
parseComando s (Escreva c) = 0

posicaofinal :: String -> [Comando] -> Int 
posicaofinal s [] = 1
posicaofinal s (c:cs) = parseComando s c + posicaofinal s cs

parseComando2 :: String -> Comando -> Int -> String -> Int
parseComando2 s (ParaFrente n) _ = s (parseComando s (ParaFrente n))
parseComando2 s (ParaTras n) _ = s (parseComando s (ParaTras n))
parseComando2 s (Escreva c) n = ((take n s) ++ [c] ++ (drop n s)) (n + 1)