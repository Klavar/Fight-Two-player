//
//  Character.swift
//  Fight 2 player
//
//  Created by Tony Merritt on 09/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import Foundation

//Setting the main class that players and enemies will inherit.
class Character {
    
    private var _hp: Int = 100 //will be random in game
    private var _attackPower: Int = 10 //will be random in game
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    var isAlive: Bool {
        get{
            if hp <= 0 {
                return false
            }else{
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPower: Int) {
        self._hp = startingHp
        self._attackPower = attackPower
    }
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
}