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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        timeCounter.isHidden = true
    }
    
    
    
    @IBAction func pickUpCall(_ sender: Any) {
        
        timeCounter.isHidden = false
        
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
        
        audioPlayer?.stop()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
