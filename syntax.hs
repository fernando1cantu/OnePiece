module Syntax where

-- The One Piece

{-

<prog> -> <player> [<stmt>]

-- <stmt> -> <var> = <expr>

<stmt> -> teamup <crew>
        | attack <villain>
        | sail to <location>
        | eat devilfruit
        | loot treasure
        | print <player>
        | if <condition> then [<stmt>] otherwise [<stmt>]
        | do <int> times [<stmt>]

<condition> -> With <crew> | At <location>
<name> -> <string>
<hp> -> <int>
<totalcoints> -> <int>
<player> -> <name> <hp> <location> (maybe <crew>) <totalcoins>
<map> -> [(<location>, <int>)]

-- <expr> -> <int>
--         | <var>
--         | <expr> + <expr>
--         | <expr> - <expr>
--         | bounty <villain>
--         | treasure

-- <condition> -> <expr> < <expr>
--              | <expr> > <expr>
--              | <expr> == <expr>

-- <var> -> v<string>

<crew> -> luffy | zoro | sanji | nami
<villain> -> kaido | doflamingo | blackbeard | crocodile

<location> -> island | marineford | wano

-- <env> -> [(<var>, <value>)]
<env> -> <player>
-}

type Program = [Stmt]

data Stmt = TeamUp Crew | Attack Villain | SailTo Location | EatDevilFruit
    | LootTreasure | Print Player | If Condition [Stmt] [Stmt] | Do Int [Stmt] deriving (Show)

-- data Expr = Const Int | VarE Var | Add Expr Expr | Sub Expr Expr | Bounty Villain
--     | Treasure deriving (Show)

type Name = String
type Hp = Int
type TCoins = Int
data Player = Player Name Hp Location (Maybe Crew) TCoins

data Condition = With Crew | At Location -- Less Expr Expr | Greater Expr Expr | Equal Expr Expr deriving (Show)

-- data Var = V String deriving (Show)

data Crew = Luffy | Zoro | Sanji | Nami | Usopp deriving (Show)

data Villain = Kaido | Doflamingo | Blackbeard | Crocodile deriving (Show)

data Location = Island | Marineford | Wano deriving (Show)

-- data Value = ValInt Int deriving (Show)

type Env = Player