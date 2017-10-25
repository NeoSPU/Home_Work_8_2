//
//  StartViewController.swift
//  Home_8_2
//
//  Created by Alex Neo on 24.10.2017.
//  Copyright © 2017 Alex Neo. All rights reserved.
//

import UIKit
import AVFoundation


class StartViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lastScoreLabe: UILabel!
    
    var lastScoreSourse: Int?
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Kolomiyka", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
    }

    @IBAction func start(_ sender: Any) {
        audioPlayer.play()
    }
    
    @IBAction func returnToStartScreen(_ sender: UIStoryboardSegue) {
        if let sourceVC = sender.source as? EndGameViewController {
            if let lastScoreSourse = sourceVC.finishScoreDescription {
                lastScoreLabe.text = lastScoreSourse
            }
            audioPlayer.currentTime = 0
            audioPlayer.stop()
        }
    }
}
