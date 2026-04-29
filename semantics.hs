module Semantics where

import Syntax

evaluate :: Program -> Env
evaluate (Program player stmts) =
    evaluateProg stmts player

evaluateProg :: [Stmt] -> Env -> Env
evaluateProg [] env =
    env

evaluateProg (statement : rest) env =
    let env' = evaluateStmt statement env
    in evaluateProg rest env'

evaluateStmt :: Stmt -> Env -> Env
evaluateStmt (TeamUp newCrew) (Player name hp location crew totalCoins) =
    Player name hp location (Just newCrew) totalCoins

evaluateStmt (Attack villain) (Player name hp location crew totalCoins) =
    Player name (hp - 10) location crew totalCoins

evaluateStmt (SailTo newLocation) (Player name hp location crew totalCoins) =
    Player name hp newLocation crew totalCoins

evaluateStmt EatDevilFruit (Player name hp location crew totalCoins) =
    Player name (hp + 20) location crew totalCoins

evaluateStmt LootTreasure (Player name hp location crew totalCoins) =
    Player name hp location crew (totalCoins + 100)

evaluateStmt (Print printedPlayer) env =
    env

evaluateStmt (If condition thenStmts elseStmts) env =
    if evaluateCondition condition env
        then evaluateProg thenStmts env
        else evaluateProg elseStmts env

evaluateStmt (Do 0 stmts) env =
    env

evaluateStmt (Do times stmts) env =
    evaluateStmt (Do (times - 1) stmts) env'
    where
        env' = evaluateProg stmts env

evaluateCondition :: Condition -> Env -> Bool
evaluateCondition (With wantedCrew) (Player name hp location crew totalCoins) =
    crew == Just wantedCrew

evaluateCondition (At wantedLocation) (Player name hp location crew totalCoins) =
    location == wantedLocation

evaluateCondition LowHp (Player name hp location crew totalCoins) =
    hp < 50