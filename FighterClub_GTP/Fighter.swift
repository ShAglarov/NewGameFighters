//  FighterClub_GTP
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation
//Особое умение
protocol UseUltimateAbility {
    func useUltimateAbility() -> Int
}

//Класс определяет общую сущность бойцов
class Fighter: UseUltimateAbility {
    func useUltimateAbility() -> Int {
        fatalError("ЭТО ДОЛЖНО БЫТЬ РЕАЛИЗОВАНО В ДОЧЕРНИХ КЛАССАХ")
    }
    //Множитель урона
    class var damageMultiplier: uint8 { return 10 }
    
    //Множитель шанса увернуться
    class var dodgeMultiplier: uint8 { return 6 }
    
    //Множитель очков здоровья
    class var hpMultiplier: uint8 { return 100 }
    
    //Количество очков умений при создании бойца
    class var PointsNumber: uint8 { return 5 }
    
    //Имя бойца
    var name: String? = nil
    
    //Описание класса бойца
    var classDescription: String? = nil
    
    //Описание особого умения
    let ultimateAbilityDescription: String
    
    //Урон бойца
    var damageFighter: uint8 = 0
    
    //_strenght хранит информацию полученную из метода strenght
    private var _strenght: uint8 = 0
    
    //Метод strenght возвращает нанесенный урон в зависимости от количества силы бойца
    var strenght: uint8 {
        get {
            return _strenght
        }
        set(newValue) {
            _strenght = newValue
            damageFighter = _strenght * Fighter.damageMultiplier
        }
    }
    
    //Шанс увернуться
    var dodgeChance: uint8? = nil
    
    //_agility хранит информацию о ловкости, полученную из метода agility
    private var _agility: uint8 = 0
    
    //Метод agility возвращает полученную ловкость в зависимости от количество единиц ловкости
    var agility: uint8 {
        get {
            return _agility
        }
        set(newValue) {
            _agility = newValue
            dodgeChance = _agility * Fighter.dodgeMultiplier
        }
    }
    
    //Статус бойца Погиб?, true  - да
    //                     false - нет
    var fighterIsDead: Bool = false
    
    //_hpFighter хранит информацию о количестве жизней, полученую из метода hpFighter
    private var _hpFighter: uint8 = 0
    
    //Метод hpFighter, возвращает количество hp, если hp достигает <= 0, передает информацию
    //о смерти бойца в переменную fighterIsDead
    var hpFighter: uint8 {
        get {
            return _hpFighter
        }
        set(newValue) {
            _hpFighter = newValue
            if _hpFighter <= 0 {
                fighterIsDead = true
                _hpFighter = 0
            }
        }
    }
    
    //_vitality хранит информацию о живучести бойца
    private var _vitality: uint8 = 0
    
    //Метод vitality хранит информацию о живучести, так же возвращает количество hp
    //в зависимости от количетства vitality
    var vitality: uint8 {
        get {
            return _vitality
        }
        set(newValue) {
            _vitality = newValue
            hpFighter = _vitality * Fighter.hpMultiplier
        }
    }
    
    //Инициализация класса Fighter
    init(name: String,
         classDescription: String,
         ultimateAbilityDescription: String,
         strenght: uint8,
         agility: uint8,
         vitality: uint8) {
        self.name = name
        self.classDescription = classDescription
        self.ultimateAbilityDescription = ultimateAbilityDescription
        self.vitality = vitality
        self.agility = agility
        self.strenght = strenght
    }
    
    func showStats() {
        print("""
                Имя:
                Сила:
                Живучесть:
                Шанс увернуться:
                Умение:
                """)
    }
    //Функция расчитывающая нанесеный удар и возвращающая его количество на выходе
    func kick() -> uint8 {
        let totalDamage: uint8 = uint8.random(in: damageFighter-Fighter.damageMultiplier...damageFighter+Fighter.damageMultiplier)
        return totalDamage
    }
}
