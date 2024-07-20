addEspaços :: Int -> String
addEspaços n = [' ' | x <- [1..n]]

paraDireita :: Int -> String -> String
paraDireita n str = addEspaços n ++ str


parseInput str = let [n, s] = words str
                 in (read n, s)
main :: IO()
main = interact $ uncurry paraDireita . parseInput

