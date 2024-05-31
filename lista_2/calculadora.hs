type Comando = String
type Valor = Int

executa :: [(Comando, Valor)] -> Int
executa xs = foldl (\acc (comando, valor) -> case comando of
    "Multiplica" -> acc * valor
    "Soma" -> acc + valor
    "Subtrai" -> acc - valor
    "Divide" -> if valor == 0 then -666 else acc `div` valor
  ) 0 xs

main = do
    a <- getLine
    let result = executa (read a)
    print result