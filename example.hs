module Main where

import Syntax
import Semantics

player1 :: Player
player1 =
    Player "Fer" 100 Wano Nothing 500


-- cfg
{-
p:
teamup Luffy
attack kaido
if With luffy then [ attack Doflamingo ] otherwise [ eat devilfruit ]
if LowHp then [ eat devilfruit ] otherwise [ attack Kaido ]
do 2 times [ loot treasure ]
print player
-}

{-
p2:
teamup Zoro
sail to marineford
if At marineford then [ attack crocodile ] otherwise [ attack Kaido ]
do 3 times [ loot treasure ]
print player
-}


-- abstract syntax
p :: Program
p =
    Program
        player1
        [ TeamUp Luffy
        , Attack Kaido
        , If (With Luffy)
              [Attack Doflamingo]
              [EatDevilFruit]
        , If LowHp
              [EatDevilFruit]
              [Attack Kaido]
        , Do 2 [LootTreasure]
        , Print player1
        ]


p2 :: Program
p2 =
    Program
        player1
        [ TeamUp Zoro
        , SailTo Marineford
        , If (At Marineford)
              [Attack Crocodile]
              [Attack Kaido]
        , Do 3 [LootTreasure]
        , Print player1
        ]


main :: IO ()
main = do
    putStrLn "Printing Example Program:"
    putStrLn "-------------------------"
    print p

    putStrLn ""
    putStrLn "Evaluating Example Program"
    putStrLn "---------------------------"
    let finalPlayer = evaluate p

    putStrLn ""
    putStrLn "Final Player:"
    putStrLn "-------------"
    print finalPlayer