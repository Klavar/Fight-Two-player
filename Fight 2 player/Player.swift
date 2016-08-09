//
//  Player.swift
//  Fight 2 player
//
//  Created by Tony Merritt on 09/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import Foundation

// Setting the player class that will inherit from the character class
class Player: Character {
    private var _name = "Player 1" //Will change in game
    
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