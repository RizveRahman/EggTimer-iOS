//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var showMessage: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimer = ["Soft" : 300, "Medium" : 480, "Hard" : 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer! // For audio


    @IBAction func eggButton(_ sender: UIButton) {
        
        let selectedButton = sender.currentTitle!
        totalTime = eggTimer[selectedButton]!
        
        
        showMessage.text = selectedButton
        
        //Everitime it will re-start
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)


        }
    
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            showMessage.text = "Done ✅"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") // for playing audio
                        player = try! AVAudioPlayer(contentsOf: url!)
                        player.play()        }
    }
        
    }
    

