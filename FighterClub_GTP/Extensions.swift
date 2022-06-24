//
//  Extensions.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 16.06.2022.
//

import Foundation

extension Game: IsDeadFighterDelegate {
    
    func fighterDied() {
        isGameOver = true
    }
    
}
