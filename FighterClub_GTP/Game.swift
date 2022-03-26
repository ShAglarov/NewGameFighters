//
//  Game.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 26.03.2022.
//

import Foundation
class Game {
    private var fightState: FightState
    private var fighter: Fighter = Avarec(name: "ГЕРОЙ ЕЩЕ НЕ СОЗДАН")
    var player1: Fighter = Avarec(name: "ГЕРОЙ ЕЩЕ НЕ СОЗДАН")
    var player2: Fighter =  Avarec(name: "ГЕРОЙ ЕЩЕ НЕ СОЗДАН")
    var win = ""
    var round = 1
    init() {
        fightState = FightState.nextRound
    }
    func createFighter() -> Fighter {
        print("Назовите своего бойца")
        let name = readLine() ?? "nil"
        print("""
                Выберите класс героя:
                1: Аварец
                2: Даргинец
                3: Лакец
                4: Кумык
                5: Русский
                """)
        let fighterType = readLine() ?? "nil"
        switch (fighterType) {
        case "1": fighter = Avarec(name: name)
        case "2": fighter = Darginec(name: name)
        case "3": fighter = Lakec(name: name)
        case "4": fighter = Kumuk(name: name)
        case "5": fighter = Russkiy(name: name)
        default : print("Вы не выбрали бойца из предложенных вариантов, начните игру заного")
            break
        }
        // очки умений
        var points: uint8 = 6
        print("""
                ------------------------------------------------------
                ------------------------------------------------------
                Распределите очки умений среди характеристик персонажа:
                + 1 Силы: +\(fighter.strenght) к урону
                + 1 Ловкости: +\(fighter.agility)% увернуться от атаки
                + 1 Живучести: +\(fighter.vitality) HP
                -------------------------------------------------------
                """)
        while points > 0 {
            points -= 1
            fighter.showStats2()
            print("""
                    -------------------------------------------------------
                    Распределите очки умений
                    Осталось очков умений: \(points)
                    1: + 1 Силы
                    2: + 1 Ловкости
                    3: + 1 Живучести
                    """)
            let enterAbility = readLine() ?? "nill"
            switch (enterAbility) {
            case "1": fighter.strenght += 1
            case "2": fighter.agility += 1
            case "3": fighter.vitality += 1
            default:
                print("вы не выбрали из предложенных вам вариантов, начните игру заново")
            }
        }
        return fighter
    }
    
    func startGame(){
        print("ИГРОК 1 СОЗДАЕТ БОЙЦА")
        player1 = createFighter()
        print("ИГРОК 2 СОЗДАЕТ БОЙЦА")
        player2 =  createFighter()
        startFight()
    }
    func calculateDamage(agressor: Fighter, victim: Fighter) {
        var damage: uint16 = 0
        if (victim.dodgeChance > Int.random(in: 1..<101)) {
            print(" \(agressor.name) хотел ударить, но \(victim.name) увернулся от удара")
        } else {
            damage = agressor.kick()
            victim.hpFighter -= Int16(damage)
            print("\(agressor.name) ударил и нанес \(damage) урона, но \(victim.name) сделал(а) вид что не почувствовал(а) боли")
            victim.hpFighter -= Int16(agressor.useUltimateAbility())
        }
        if agressor.isFighterDead == true {
            print("""
                    ------------------------------------------------------------
                    ------------------------------------------------------------
                    
                    """)
            print("БОЙ ОКОНЧЕН, ПОБЕДУ ОДЕРЖАЛ(А) \(win) НА \(round) РАУНДЕ")
            fightState = FightState.stopRound
        } else if victim.isFighterDead == true {
            win = agressor.name
            print("""
                    ------------------------------------------------------------
                    ------------------------------------------------------------
                    
                    """)
            print("БОЙ ОКОНЧЕН, ПОБЕДУ ОДЕРЖАЛ(А) \(win) НА \(round) РАУНДЕ")
            fightState = FightState.stopRound
        }
    }
    
    func startFight() {
        repeat {
            print("РАУНД \(round)")
            print("""
                    ------------------------------------------------------------
                    """)
            calculateDamage(agressor: player1, victim: player2)
            if fightState == FightState.stopRound {
                print("")
            } else {
                print("""
                        ------------------------------------------------------------
                        ------------------------------------------------------------
                        """)
                calculateDamage(agressor: player2, victim: player1)
                round += 1
            }
            print("""
                    ------------------------------------------------------------
                    ------------------------------------------------------------
                    """)
            print("ИГРОК 1")
            player1.showStats()
            print("ИГРОК 2")
            player2.showStats()
            _ = readLine()
            
        } while fightState == FightState.nextRound
    }
}
