//
//  Russkiy.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 26.03.2022.
//

import Foundation
class Russkiy: Fighter {
    override func useUltimateAbility() -> uint16 {
        var totalDamage: uint16 = uint16.random(in: 50...100)
        if totalDamage < 50 {
            totalDamage = totalDamage * 3
            print("\(name) бахнул 100гр. водочки, позвал своего кореша медьведя и нанес противнику \(totalDamage) урона")
        }
        if totalDamage == 50 {
            totalDamage = 0
            print("\(name) пожалел противника, и не стал его бить")
        }
        return totalDamage
    }
    init(name: String) {
        super.init(name: name,
                   classDescription: "Русский медведь",
                   ultimateAbilityDescription: "Дружит с медьведями, обладает смертельным ударом",
                   strenght: 3,
                   agility: 0,
                   vitality: 3)
    }
}
