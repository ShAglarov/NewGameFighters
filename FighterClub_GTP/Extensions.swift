//
//  Extensions.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 16.06.2022.
//

import Foundation

extension Fighter: IsDeadFighterDelegate {
    func isFighterDead() -> Bool {
        guard _hpFighter <= 0 else { return false }
        _hpFighter = 0
        return true
    }
}

extension Game {
    var isDeadDelegate: IsDeadFighterDelegate? { return fighter }
}
