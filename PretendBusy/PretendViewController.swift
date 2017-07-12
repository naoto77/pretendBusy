//
//  PretendViewController.swift
//  PretendBusy
//
//  Created by Naoto Ohno on 2017/07/12.
//  Copyright © 2017年 Naoto Ohno. All rights reserved.
//

import UIKit
import AVFoundation

class PretendViewController: UIViewController {
    
    @IBOutlet var timeCounter: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    var timeSpent = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeCounter.isHidden = true
    }
    
    
    @IBAction func pickUpCall(_ sender: Any) {
        
        timeCounter.isHidden = false
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(coutUpTime), userInfo: nil, repeats: true)
        
        playSpeakerVoice()
        
    }
    
    
    func coutUpTime(){
        timeSpent += 1
        timeFormatter()
    }
    
    
    func timeFormatter(){
        var sec = timeSpent % 60
        var min = timeSpent / 60
        
        timeCounter.text = String(format: "%02d:%02d", min, sec)
    }
    
    
    func playSpeakerVoice(){
        if let url = Bundle.main.url(forResource: "speakerVoice", withExtension: "mp3"){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }catch {
                audioPlayer = nil
            }
        }else {
            fatalError("Url is nil.")
        }
    }
    
    
    @IBAction func hangUpCall(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        timer.invalidate()
        audioPlayer?.stop()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
