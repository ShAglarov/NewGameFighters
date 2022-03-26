//
//  Lakec.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation
class Lakec: Fighter {
    override func useUltimateAbility() -> uint16 {
        let chance = uint8.random(in: 1...100)
        if chance <= 25 {
            let totalDamage = damageFighter * 3
            print("\(name) подлетел и совершил тройной удар, нанеся \(totalDamage) урона.")
            return totalDamage
        }
        print("\(name) промахивается и бьет очень слабо, нанеся \(strenght * 3) урона!")
        return strenght * 3
    }
    init(name: String) {
        super.init(name: name,
                   classDescription: "Лакец",
                   ultimateAbilityDescription: "Обладает невероятной ловкостью, может масстерски уходить от ударов противника",
                   strenght: 3,
                   agility: 0,
                   vitality: 3)
    }
}

