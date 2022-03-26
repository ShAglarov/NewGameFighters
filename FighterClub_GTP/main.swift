//
//  main.swift
//  FighterClub_GTP
//
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation

func printMenu() {
    print("""
               ИГРА БОЙЦОВСКИЙ КЛУБ
      1 - начать игру
      2 - правила
      3 - выход
      """)
    let option = readLine() ?? ""
    switch option {
    case "1":
        let game = Game()
            game.startGame()
        
    case "2":
        // вывод на экран характеристики героя
        print("ТУТ ДОЛЖНЫ БЫТЬ ОПИСАНЫ ПРАВИЛА ИГРЫ")
        printMenu()
    case "3":
        print("3")
        
    default:
        printMenu()
    }
}

printMenu()
