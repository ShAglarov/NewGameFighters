//  FighterClub_GTP
//  Created by Shamil Aglarov on 24.03.2022.
//

import Foundation
//Особое умение
protocol UseUltimateAbility {
    func useUltimateAbility() -> uint16
}

//Класс определяет общую сущность бойцов
class Fighter: UseUltimateAbility {
    func useUltimateAbility() -> uint16 {
        fatalError("ЭТО ДОЛЖНО БЫТЬ РЕАЛИЗОВАНО В ДОЧЕРНИХ КЛАССАХ")
    }
    //Множитель урона
    class var damageMultiplier: uint16 { return 10 }
    
    //Множитель шанса увернуться
    class var dodgeMultiplier: uint16 { return 6 }
    
    //Множитель очков здоровья
    class var hpMultiplier: Int16 { return 100 }
    
    //Количество очков умений при создании бойца
    class var pointsNumber: uint16 { return 5 }
    
    //Имя бойца
    var name: String
    
    //Описание класса бойца
    var classDescription: String
    
    //Описание особого умения
    let ultimateAbilityDescription: String
    
    //Урон бойца
    lazy var damageFighter: uint16 = 0
    
    //_strenght хранит информацию полученную из метода strenght
    private var _strenght: uint16 = 0
    
    //Метод strenght возвращает нанесенный урон в зависимости от количества силы бойца
    var strenght: uint16 {
        get {
            return _strenght
        }
        set(newValue) {
            _strenght = newValue
            damageFighter = _strenght * Fighter.damageMultiplier
        }
    }
    
    //Шанс увернуться
    var dodgeChance: uint16 = 0
    
    //_agility хранит информацию о ловкости, полученную из метода agility
    private var _agility: uint16 = 0
    
    //Метод agility возвращает полученную ловкость в зависимости от количество единиц ловкости
    var agility: uint16 {
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
    var isFighterDead: Bool = false
    
    //_hpFighter хранит информацию о количестве жизней, полученую из метода hpFighter
    private var _hpFighter: Int16 = 0
    
    //Метод hpFighter, возвращает количество hp, если hp достигает <= 0, передает информацию
    //о смерти бойца в переменную fighterIsDead
    var hpFighter: Int16 {
        get {
            return _hpFighter
        }
        set(newValue) {
            _hpFighter = newValue
            if _hpFighter <= 0 {
                isFighterDead = true
                _hpFighter = 0
            }
        }
    }
    
    //_vitality хранит информацию о живучести бойца
    private var _vitality: uint16 = 0
    
    //Метод vitality хранит информацию о живучести, так же возвращает количество hp
    //в зависимости от количетства vitality
    var vitality: uint16 {
        get {
            return _vitality
        }
        set(newValue) {
            _vitality = newValue
            hpFighter = Int16(_vitality * UInt16(Fighter.hpMultiplier))
        }
    }
    
    //Инициализация класса Fighter
    init(name: String,
         classDescription: String,
         ultimateAbilityDescription: String,
         strenght: uint16,
         agility: uint16,
         vitality: uint16) {
        self.name = name
        self.classDescription = classDescription
        self.ultimateAbilityDescription = ultimateAbilityDescription
        self.vitality = vitality
        self.agility = agility
        self.strenght = strenght
    }
    
    func showStats(){
        print("""
                Имя:\(name)          Класс:\(classDescription)
                             HP:\(hpFighter)
                """)
    }
    func showStats2(){
        print("""
                Имя:\(name)          Класс:\(classDescription)
                Сила:\(strenght)              Ловкость:\(agility)
                Живучесть:\(vitality)         Урон:\(damageFighter)
                Шанс увернуться:\(dodgeChance)  HP:\(hpFighter)
                Умение:\(ultimateAbilityDescription)
                """)
    }
    //Функция расчитывающая нанесеный удар и возвращающая его количество на выходе
    func kick() -> uint16 {
        let totalDamage: uint16 = uint16.random(in: damageFighter-Fighter.damageMultiplier...damageFighter+Fighter.damageMultiplier)
        return totalDamage
    }
}
