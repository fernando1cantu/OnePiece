module Syntax where

-- The One Piece 

{-

<prog> -> <player> [<stmt>]

<stmt> -> teamup <crew>
        | attack <villain>
        | sail to <location>
        | eat devilfruit
        | loot treasure
        | print <player>
        | if <condition> then [<stmt>] otherwise [<stmt>]
        | do <int> times [<stmt>]

<condition> -> With <crew> 
             | At <location> 
             | LowHp

<name> -> <string>
<hp> -> <int>
<totalcoins> -> <int>

<player> -> <name> <hp> <location> (maybe <crew>) <totalcoins>

<crew> -> Luffy | Zoro | Sanji | Nami | Usopp
<villain> -> Kaido | Doflamingo | Blackbeard | Crocodile

<location> -> island | marineford | wano

<env> -> <player>

-}

-- Program 
type Program = (Player, [Stmt])

-- Statements
data Stmt
    = TeamUp Crew
    | Attack Villain
    | SailTo Location
    | EatDevilFruit
    | LootTreasure
    | Print Player
    | If Condition [Stmt] [Stmt]
    | Do Int [Stmt]
    deriving (Show)

-- Player
type Name = String
type Hp = Int
type TCoins = Int

data Player = Player Name Hp Location (Maybe Crew) TCoins
    -- deriving (Show)
instance Show Player where
    show (Player nm hp loc Nothing tc) = "Player " ++ nm ++ "\n"
        ++ "Hp: " ++ show hp ++ "\n"
        ++ "Location: " ++ show loc ++ "\n"
        ++ "Crew: None\n"
        ++ "Total Coins: " ++ show tc ++ "\n"
    show (Player nm hp loc (Just crew) tc) =
        "Player " ++ nm ++ "\n" ++
        "Hp: " ++ show hp ++ "\n" ++
        "Location: " ++ show loc ++ "\n" ++
        "Crew: " ++ show crew ++ "\n" ++
        "Total Coins: " ++ show tc ++ "\n"

-- Conditions 
data Condition
    = With Crew
    | At Location
    | LowHp
    deriving (Show)

-- Crew 
data Crew
    = Luffy
    | Zoro
    | Sanji
    | Nami
    | Usopp
    deriving (Show)

-- Villains 
data Villain
    = Kaido
    | Doflamingo
    | Blackbeard
    | Crocodile
    deriving (Show)

-- Locations
data Location
    = Island
    | Marineford
    | Wano
    deriving (Show)


type Env = Player
