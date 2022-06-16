//
//  Protocols.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 16.06.2022.
//

import Foundation
//Особое умение
protocol UseUltimateAbility {
    func useUltimateAbility() -> uint16
}
//делегат (умер ли боец)
protocol IsDeadFighterDelegate {
    func isFighterDead() -> Bool
}
