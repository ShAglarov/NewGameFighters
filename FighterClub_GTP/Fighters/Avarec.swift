//
//  Avarec.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation

class Avarec: Fighter {
    
    override func useUltimateAbility() -> uint16 {
        let totalDamage = strenght * 3 + damageFighter
        print("\(name) впадает в ярость! и бьет 3 жестких три удара, нанеся \(totalDamage) урона ")
        return totalDamage
    }
    init(name: String) {
        super.init(name: name,
                   classDescription: "Аварец",
                   ultimateAbilityDescription: "Впадает в ярость, нанеся колоссальный урон противнику",
                   strenght: 5,
                   agility: 0,
                   vitality: 5)
    }
}
