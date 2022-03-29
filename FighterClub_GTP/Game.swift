//
//  File.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 28.03.2022.
//

import Foundation
class Game {
    private var fightState: FightState
    private var fighter: Fighter?
    private var player1: Fighter?
    private var player2: Fighter?
    var win = ""
    var round = 1
    init() {
        fightState = FightState.nextRound
    }
    func startGame() {
        print("ИГРОК - 1 СОЗДАЕТ БОЙЦА")
        player1 = createFighter()
        print("ИГРОК - 2 СОЗДАЕТ БОЙЦА")
        player2 = createFighter()
        startFight()
    }
    func startFight() {
        while fightState == FightState.nextRound {
            print("""
                    ------------------------------------------------------------
                    ------------------------------------------------------------
                    """)
            print("Для старта \(round)-го раунда, нажмите Enter")
            _ = readLine()
            print("РАУНД \(round)")
            print("""
                    ------------------------------------------------------------
                    """)
            player1?.showStats()
            calculateDamage(agressor: player1 ?? Avarec(name: ""), victim: player2 ?? Avarec(name: ""))
            if fightState == FightState.stopRound {
                print("")
            } else {
                print("""
                        ------------------------------------------------------------
                        ------------------------------------------------------------
                        """)
            }
            player2?.showStats()
            calculateDamage(agressor: player2 ?? Avarec(name: ""), victim: player1 ?? Avarec(name: ""))
            round += 1
        }
        print("""
                ------------------------------------------------------------
                ------------------------------------------------------------
                """)
    }
    func createFighter() -> Fighter {
        print("НАЗОВИТЕ СВОЕГО БОЙЦА")
        guard let nameFighter = readLine() else { return createFighter() }
        guard nameFighter != "" else { return createFighter() }
        ///создаем выбранного бойца
        switch selectFighter() {
        case "1":fighter = Avarec(name: nameFighter)
        case "2":fighter = Darginec(name: nameFighter)
        case "3":fighter = Lakec(name: nameFighter)
        case "4":fighter = Kymuk(name: nameFighter)
        case "5":fighter = Russkiy(name: nameFighter)
        default:
            print("Не выбран ни один боец, начните игру заново")
            break
        }
        //очки умений
        var points = 6
        
        while points > 0 {
            points -= 1
            fighter?.showStats()
            print("""
                    ------------------------------------------------------
                    ------------------------------------------------------
                    Распределите очки умений среди характеристик персонажа:
                    + 1 Силы: +\(fighter?.strenght ?? 0) к урону
                    + 1 Ловкости: +\(fighter?.agility ?? 0)% увернуться от атаки
                    + 1 Живучести: +\(fighter?.vitality ?? 0) HP
                    -------------------------------------------------------
                    """)
            let inputPoints = readLine()
            switch inputPoints {
            case "1": fighter?.strenght += 1
            case "2": fighter?.agility += 1
            case "3": fighter?.vitality += 1
            default:
                points += 1
            }
        }
        return fighter ?? Avarec(name: "nil")
    }
    ///Возвращает номер класса выбранного героя
    private func selectFighter() -> String {
        var fighterType: String
        print("""
                Выберите класс героя:
                1: Аварец
                2: Даргинец
                3: Лакец
                4: Кумык
                5: Русский
                """)
        fighterType = readLine() ?? ""
        guard fighterType != "" else { return selectFighter() }
        return fighterType
    }
    func calculateDamage(agressor: Fighter, victim: Fighter) {
        if agressor.isFighterDead {
            win = victim.name
            print("""
                    ------------------------------------------------------------
                    ------------------------------------------------------------
                    
                    """)
            print("БОЙ ОКОНЧЕН, ПОБЕДУ ОДЕРЖАЛ \(win) НА \(round) РАУНДЕ")
            fightState = FightState.stopRound
            return
        } else if victim.isFighterDead {
            win = agressor.name
            print("""
                    ------------------------------------------------------------
                    ------------------------------------------------------------
                    
                    """)
            print("БОЙ ОКОНЧЕН, ПОБЕДУ ОДЕРЖАЛ \(win) НА \(round) РАУНДЕ")
            fightState = FightState.stopRound
            return
        }
        var damage: uint16 = 0
        if victim.dodgeChance > uint16.random(in: 1..<101) {
            print("\(agressor.name) хотел ударить, но \(victim.name) увернулся от удара.")
        } else {
            damage = agressor.kick()
            victim.hpFighter -= Int16(damage)
            print("\(agressor.name) ударил и нанес противнику \(damage) урона.")
            victim.hpFighter -= Int16(agressor.useUltimateAbility())
        }
    }
}
