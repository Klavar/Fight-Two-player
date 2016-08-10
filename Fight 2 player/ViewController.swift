//
//  ViewController.swift
//  Fight 2 player
//
//  Created by Tony Merritt on 09/08/2016.
//  Copyright © 2016 Tony Merritt. All rights reserved.
//

import UIKit
import AVFoundation

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
   
    @IBOutlet weak var playerHead: UIImageView!
    
    @IBOutlet weak var enemyHead: UIImageView!

    //Setting the Sound variables
    var plSpear = AVAudioPlayer()
    var plClub = AVAudioPlayer()
    var plmusic = AVAudioPlayer()
    var plDeath = AVAudioPlayer()
    
    //Setting the function of playing different sounds together
    func playMultipleSound() {
        playSpear()
        playClub()
        playMusic()
        playDeath()
    }
    //Setting the functions of the Music, stab hit and death with the properties.
    func playMusic() {
        let soundUrl = NSBundle.mainBundle().URLForResource("Music", withExtension: "wav")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            plmusic = try AVAudioPlayer(contentsOfURL: soundUrl)
            plmusic.volume = 0.1
            plmusic.numberOfLoops = 3
            plmusic.prepareToPlay()
            plmusic.play()
        } catch _ {
            return print("sound file not found")
        }
    }
    
    
    func playSpear() {
        let soundUrl = NSBundle.mainBundle().URLForResource("Spear", withExtension: "wav")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            plSpear = try AVAudioPlayer(contentsOfURL: soundUrl)
            plSpear.numberOfLoops = 0
            plSpear.prepareToPlay()
            plSpear.play()
        } catch _ {
            return print("sound file not found")
        }
    }
    
    func playClub() {
        let soundUrl = NSBundle.mainBundle().URLForResource("Club", withExtension: "wav")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            plClub = try AVAudioPlayer(contentsOfURL: soundUrl)
            plClub.numberOfLoops = 0
            plClub.prepareToPlay()
            plClub.play()
        } catch _ {
            return print("sound file not found")
        }
    }
    
    func playDeath() {
        let soundUrl = NSBundle.mainBundle().URLForResource("Death", withExtension: "wav")!
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            plDeath = try AVAudioPlayer(contentsOfURL: soundUrl)
            plDeath.numberOfLoops = 0
            plDeath.prepareToPlay()
            plDeath.play()
        } catch _ {
            return print("sound file not found")
        }
    }
    
    
    
    
    //setting the Player and Enemy variables.
    var player: Player!
    var enemy: Enemy!
    
    
    //Start of Main.
    override func viewDidLoad() {
        super.viewDidLoad()

        //Making the Player and Enemy and Buttons hidden, but showing the start button.
        playMusic()
        
        startGame.hidden = false
        playerImage.hidden = true
        enemyImage.hidden = true
        infoText.hidden = true
        infoLabel.hidden = true
        attackOne.hidden  = true
        attackTwo.hidden = true
        attackLabelOne.hidden = true
        attacklabelTwo.hidden = true
        enemyHead.hidden = true
        playerHead.hidden = true
        
        
        //Setting the players name and random Health and attack.
        player = Player(name: "Meninx", hp: randomNumber(90...110), attackPower: randomNumber(10...20))
        infoText.text = "Press attack to attack"
       
        enemy = Enemy(name: "Skitz", hp: randomNumber(90...110), attackPower: randomNumber(10...20))
        }
    
    //Setting the function of attack one btton.
    @IBAction func onAttackOnePressed(sender: AnyObject){

        playClub()
        
        attacklabelTwo.hidden = true
        attackTwo.hidden = true
        
        if enemy.attemptAttack(player.attackPower) {
        
            infoText.text = "Meninx attacked \(enemy.name) for \(player.attackPower) HP"
        }else{
            infoText.text = "Attack missed"
    }
        attackLabelOne.hidden = true
        attackOne.hidden = true
        attacklabelTwo.hidden = false
        attackTwo.hidden = false
        
        if !enemy.isAlive {
            playDeath()
            enemyHead.hidden = false
            enemyImage.hidden = true
            attackTwo.hidden = true
            attacklabelTwo.hidden = true
            infoText.text = "Meninx Killed \(enemy.name)"
            NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(ViewController.viewDidLoad), userInfo: nil, repeats: false)
            
        }
        
    }
    
    //Setting the function of attack two button.
    @IBAction func onAttackTwoPressed(sender: AnyObject) {
       
        playSpear()

        if player.attemptAttack(enemy.attackPower) {
            
            infoText.text = "Skitz attacked \(player.name) for \(enemy.attackPower) HP"
        }else{
            infoText.text = "Attack missed"
    }
        attacklabelTwo.hidden = true
        attackTwo.hidden = true
        attackLabelOne.hidden = false
        attackOne.hidden = false
        
        if !player.isAlive {
            playDeath()
            playerHead.hidden = false
            playerImage.hidden = true
            attackOne.hidden = true
            attackLabelOne.hidden = true
            infoText.text = "Skitz Killed \(player.name)"
            NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(ViewController.viewDidLoad), userInfo: nil, repeats: false)
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

//Setting the random numbers for the health and the attack
func randomNumber(range: Range<Int> = 10...20) -> Int {
    let min = range.startIndex
    let max = range.endIndex
    return Int(arc4random_uniform(UInt32(max - min))) + min
    
    
    }
}