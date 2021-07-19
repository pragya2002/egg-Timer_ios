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
    let softTime=300.0
    let mediumTime=420.0
    let hardTime=720.0
    var pro=0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        prog.progress=0.0
        
    }
    @IBOutlet weak var prog: UIProgressView!
    @IBOutlet weak var lab: UILabel!
    var secondsRemaining=0.0
    var timer=Timer()
    var q:Int?
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")!)
       var audioPlayer = AVAudioPlayer()
    
    func Piano()
    {
        do {
                    audioPlayer = try AVAudioPlayer(contentsOf: pianoSound)
                    audioPlayer.play()
               } catch {
                  // couldn't load file :(
               }
    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        var a: Double?
        prog.progress=0.0
        timer.invalidate()
        if sender.currentTitle!=="Soft" {
            a=softTime
            self.lab.text="SOFT"
        }
        else if sender.currentTitle!=="Medium"{
            a=mediumTime
            self.lab.text="MEDIUM"
        }
        else{
            a=hardTime
            self.lab.text="HARD"
        }
       
        secondsRemaining = a!
        
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer)  in
            
                if self.secondsRemaining > 0 {
                   
                    self.pro=(a!-self.secondsRemaining)/a!
                    self.prog.progress=Float(self.pro)
                    
                    self.secondsRemaining -= 1
                    
                }
                else {
                    Timer.invalidate()
                    self.pro=(a!-self.secondsRemaining)/a!
                    self.prog.progress=Float(self.pro)
                    self.lab.text="DONE!"
                    self.Piano()
                }
           
            
    }
       
       
}
}
