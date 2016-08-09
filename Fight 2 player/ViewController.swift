//
//  ViewController.swift
//  Fight 2 player
//
//  Created by Tony Merritt on 09/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Setting my outlets showing the parts are there to be used.
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var infoLabel: UIImageView!
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var attackOne: UIButton!
    @IBOutlet weak var attackLabelOne: UILabel!
    @IBOutlet weak var attackTwo: UIButton!
    @IBOutlet weak var attacklabelTwo: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var playerImage: UIImageView!
    
    //setting the Player and Enemy variables.
    var player: Player!
    var enemy: Enemy!
    
    //Start of Main.
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Making the Player and Enemy and Buttons hidden, but showing the start button.
        startGame.hidden = false
        playerImage.hidden = true
        enemyImage.hidden = true
        infoText.hidden = true
        infoLabel.hidden = true
        attackOne.hidden  = true
        attackTwo.hidden = true
        attackLabelOne.hidden = true
        attacklabelTwo.hidden = true
        
        
        //Setting the players name and random Health and attack.
        player = Player(name: "Meninx", hp: randomNumber(90...110), attackPower: randomNumber(10...20))
        infoText.text = "Press attack to attack"
       
        enemy = Enemy(name: "Skitz", hp: randomNumber(90...110), attackPower: randomNumber(10...20))
        }
    
    //Setting the function of attack one btton.
    @IBAction func onAttackOnePressed(sender: AnyObject){
    
        if enemy.attemptAttack(player.attackPower) {
        
            infoText.text = "Meninx attacked \(enemy.name) for \(player.attackPower) HP"
        }else{
            infoText.text = "Attack missed"
        }
        if !enemy.isAlive {
            infoText.text = "Meninx Killed \(enemy.name)"
            viewDidLoad()
        }
    }
    
    //Setting the function of attack two button.
    @IBAction func onAttackTwoPressed(sender: AnyObject) {
        
        if player.attemptAttack(enemy.attackPower) {
            
            infoText.text = "Skitz attacked \(player.name) for \(enemy.attackPower) HP"
        }else{
            infoText.text = "Attack missed"
        }
        if !player.isAlive {
            infoText.text = "Skitz Killed \(player.name)"
            viewDidLoad()
        }
    }
    
    //setting the items of the game as un-hidden when pressing start.
    @IBAction func onStartPressed(sender: AnyObject) {
        startGame.hidden = true
        playerImage.hidden = false
        enemyImage.hidden = false
        infoText.hidden = false
        infoLabel.hidden = false
        attackOne.hidden  = false
        attackTwo.hidden = false
        attackLabelOne.hidden = false
        attacklabelTwo.hidden = false
        }
    }


//Setting the random numbers for the health and the attack
func randomNumber(range: Range<Int> = 10...20) -> Int {
    let min = range.startIndex
    let max = range.endIndex
    return Int(arc4random_uniform(UInt32(max - min))) + min
    
    
        
}