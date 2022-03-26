//
//  Darginec.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation
class Darginec: Fighter {
    override func useUltimateAbility() -> uint16 {
        /*
           Задумка: Даргинец любит деньги, и любит договариваться. Ради быстрой
           победы, он готов хорошо заплатить.
           Если удача будет на его стороне, то противник мнгновенно получает
           "колоссальный урон" и "погибает"
         */
        var fightBought: uint32
        let attemptToOfferMoney = uint16.random(in: 0...30001)
        switch attemptToOfferMoney {
        case 1: fightBought = 10000
            print("\(name) предложил 1 доллар, и противник слил бой упав в фейковый накаут")
        case 1000: fightBought = 10000
            print("\(name) предложил 1000 долларов, и противник слил бой упав в фейковый накаут")
        case 2000: fightBought = 10000
            print("\(name) предложил 2000 долларов, и противник слил бой упав в фейковый накаут")
        case 3000: fightBought = 10000
            print("\(name) предложил 3000 долларов, и противник слил бой упав в фейковый накаут")
        case 4000: fightBought = 10000
            print("\(name) предложил 4000 долларов, и противник слил бой упав в фейковый накаут")
        case 5000: fightBought = 10000
            print("\(name) предложил 5000 долларов, и противник слил бой упав в фейковый накаут")
        case 6000: fightBought = 10000
            print("\(name) предложил 6000 долларов, и противник слил бой упав в фейковый накаут")
        case 7000: fightBought = 10000
            print("\(name) предложил 7000 долларов, и противник слил бой упав в фейковый накаут")
        case 8000: fightBought = 10000
            print("\(name) предложил 8000 долларов, и противник слил бой упав в фейковый накаут")
        case 9000: fightBought = 10000
            print("\(name) предложил 9000 долларов, и противник слил бой упав в фейковый накаут")
        case 10000: fightBought = 10000
            print("\(name) предложил 10000 долларов, и противник слил бой упав в фейковый накаут")
        case 20000: fightBought = 10000
            print("\(name) предложил 20000 долларов, и противник слил бой упав в фейковый накаут")
        case 30000: fightBought = 10000
            print("\(name) предложил 1000 долларов, и противник слил бой упав в фейковый накаут")
        default: fightBought = 0
            print("Попытка подкупить не прошла, \(name) не нанес никакого урона")
        }
        return uint16(fightBought)
    }
    init(name: String) {
        super.init(name: name,
                   classDescription: "Даргинец",
                   ultimateAbilityDescription: "Богатый, может купить любого",
                   strenght: 3,
                   agility: 0,
                   vitality: 3)
    }
}
