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
        if attemptToOfferMoney >= 29000 {
            fightBought = 1000
            print("\(name) предложил 1 доллар, и противник слил бой упав в фейковый нокаут")
        } else {
            fightBought = 0
            print("Попытка подкупить не прошла, \(name) не нанес никакого урона")
        }
        return uint16(fightBought)
    }
    init(name: String) {
        super.init(name: name,
                   classDescription: "Даргинец",
                   ultimateAbilityDescription: "Богатый, может купить любого",
                   strenght: 3,
                   agility: 5,
                   vitality: 3)
    }
}
