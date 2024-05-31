data Command = Forward Int | Backward Int | TurnLeft | TurnRight
            deriving (Eq, Show, Read)

data Direction = North | South | West | East
            deriving (Read, Show)

getDirection :: Direction -> Command -> Direction
getDirection dir TurnLeft = case dir of
    North -> West
    West -> South
    South -> East
    East -> North
getDirection dir TurnRight = case dir of
    North -> East
    East -> South
    South -> West
    West -> North
getDirection dir _ = dir

faces :: Direction -> [Command] -> Direction
faces dir [] = dir
faces dir (x:xs) = faces (getDirection dir x) xs

main = do
    a <- getLine
    b <- getLine
    let result = faces (read a) (read b)
    print result