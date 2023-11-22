//
//  ViewController.swift
//  Musicapp
//
//  Created by MACBOOK on 23/11/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource:"Glimps", withExtension: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateslider), userInfo: nil, repeats: true)
    }

    @IBAction func Button(_ sender: Any) {
        if (audioPlayer.isPlaying == true){
            audioPlayer.stop()
        }
        else
            {
                audioPlayer.play()
                slider.maximumValue = Float(audioPlayer.duration)
            
        }
    }
    @objc func updateslider(){
        slider.value = Float(audioPlayer.currentTime)
    }
    
    @IBAction func sliderClick(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(slider.value)
        audioPlayer.play()
    }
}

