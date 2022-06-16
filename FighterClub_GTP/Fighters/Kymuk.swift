//
//  Kymuk.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation
class Kumuk: Fighter {
    override func useUltimateAbility() -> uint16 {
        let totalDamage = uint16.random(in: damageFighter..<damageFighter+61)
        print("\(name) метнул ножем, нанеся противнику \(totalDamage) урона!")
        return totalDamage
    }
    
    init(name: String) {
        super.init(name: name,
                   classDescription: "Кумык",
                   ultimateAbilityDescription: "Умелый метатель ножей",
                   strenght: 2,
                   agility: 3,
                   vitality: 5)
    }
}
