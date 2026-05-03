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

<crew> -> luffy | zoro | sanji | nami | usopp
<villain> -> kaido | doflamingo | blackbeard | crocodile

<location> -> island | marineford | wano

<env> -> <player>

-}

data Program = Program Player [Stmt]

instance Show Program where
    show (Program player stmts) =
        "Program\n" ++
        "=======\n" ++
        "Starting Player:\n" ++
        indent (show player) ++ "\n" ++
        "Statements:\n" ++
        indent (unlines (map show stmts))

indent :: String -> String
indent text =
    unlines (map ("    " ++) (lines text))

data Stmt
    = TeamUp Crew
    | Attack Villain
    | SailTo Location
    | EatDevilFruit
    | LootTreasure
    | Print Player
    | If Condition [Stmt] [Stmt]
    | Do Int [Stmt]

instance Show Stmt where
    show (TeamUp crew) =
        "teamup " ++ show crew

    show (Attack villain) =
        "attack " ++ show villain

    show (SailTo location) =
        "sail to " ++ show location

    show EatDevilFruit =
        "eat devilfruit"

    show LootTreasure =
        "loot treasure"

    show (Print player) =
        "print player" 

    show (If condition thenStmts elseStmts) =
        "if " ++ show condition ++ " then\n" ++
        indent (unlines (map show thenStmts)) ++
        "otherwise\n" ++
        indent (unlines (map show elseStmts))

    show (Do times stmts) =
        "do " ++ show times ++ " times\n" ++
        indent (unlines (map show stmts))

type Name = String
type Hp = Int
type TCoins = Int

data Player = Player Name Hp Location (Maybe Crew) TCoins

instance Show Player where
    show (Player name hp location Nothing totalCoins) =
        "Player: " ++ name ++ "\n" ++
        "Hp: " ++ show hp ++ "\n" ++
        "Location: " ++ show location ++ "\n" ++
        "Crew: None\n" ++
        "Total Coins: " ++ show totalCoins

    show (Player name hp location (Just crew) totalCoins) =
        "Player: " ++ name ++ "\n" ++
        "Hp: " ++ show hp ++ "\n" ++
        "Location: " ++ show location ++ "\n" ++
        "Crew: " ++ show crew ++ "\n" ++
        "Total Coins: " ++ show totalCoins

data Condition
    = With Crew
    | At Location
    | LowHp

instance Show Condition where
    show (With crew) =
        "With " ++ show crew

    show (At location) =
        "At " ++ show location

    show LowHp =
        "LowHp"

data Crew
    = Luffy
    | Zoro
    | Sanji
    | Nami
    | Usopp
    deriving Eq

instance Show Crew where
    show Luffy =
        "luffy"

    show Zoro =
        "zoro"

    show Sanji =
        "sanji"

    show Nami =
        "nami"

    show Usopp =
        "usopp"

data Villain
    = Kaido
    | Doflamingo
    | Blackbeard
    | Crocodile

instance Show Villain where
    show Kaido =
        "kaido"

    show Doflamingo =
        "doflamingo"

    show Blackbeard =
        "blackbeard"

    show Crocodile =
        "crocodile"

data Location
    = Island
    | Marineford
    | Wano
    deriving Eq

instance Show Location where
    show Island =
        "island"

    show Marineford =
        "marineford"

    show Wano =
        "wano"

type Env = Player