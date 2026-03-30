module Examples where

import Syntax

{-
p:
teamup luffy
attack kaido
if 

-}

p :: Program
p =
    [ Assign (V "x") (Const 100)
    , TeamUp Luffy
    , Attack Kaido
    , If (Greater (VarE (V "x")) (Const 50))
        [Attack Doflamingo]
        [EatDevilFruit]
    , Do 2 [LootTreasure]
    , Print (VarE (V "x"))
    ]

p2 :: Program
p2 =
    [ Assign (V "power") (Add (Const 50) (Const 30))
    , TeamUp Zoro
    , Print (VarE (V "power"))
    , If (Less (VarE (V "power")) (Const 100))
        [Attack Crocodile]
        [Attack Blackbeard]
    , Do 3
        [ Attack Kaido
        , SailTo Marineford
        ]
    , Print Treasure
    ]