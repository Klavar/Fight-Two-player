//
//  Enemy.swift
//  Fight 2 player
//
//  Created by Tony Merritt on 09/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import Foundation

//setting the Enemy charecter inherited from character class.
class Enemy: Character {
    private var _name = "Player 2" //Will change in game
    
    var name: String {
        get {
            return _name
        }
    }
    
    convenience init(name: String, hp: Int, attackPower: Int) {
        
        self.init(startingHp: hp, attackPower: attackPower)
        
        _name = name
    }
}