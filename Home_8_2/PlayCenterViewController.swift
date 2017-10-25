//
//  PlayCenterViewController.swift
//  Home_8_2
//
//  Created by Alex Neo on 24.10.2017.
//  Copyright © 2017 Alex Neo. All rights reserved.
//

import UIKit

class PlayCenterViewController: UIViewController {

    @IBOutlet weak var yourScoreLabe: UILabel!
    @IBOutlet weak var buttomOne: UIButton!
    @IBOutlet weak var buttomTwo: UIButton!
    @IBOutlet weak var buttomThree: UIButton!
    @IBOutlet weak var timerIndicationLabel: UILabel!
    
    var userScore = 0
    var count = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomButtomIndex()
        timerIndicationLabel.text = "00 : " + "\(count)"
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        count -= 1
        if count >= 10 {
            timerIndicationLabel.text = "00 : " + String(count)
        }
        else if count > 0 {
            timerIndicationLabel.text = "00 : " + "0" + String(count)
        }
        
        else {
            performSegue(withIdentifier: "showEndScreen", sender: Any?.self)
        }
    }
    
    
    func randomButtomIndex() {
        let i = Int(arc4random() % 3)
        switch i {
        case 0:
            self.buttomOne.isHidden = false
        case 1:
            self.buttomTwo.isHidden = false
        default:
            self.buttomThree.isHidden = false
        }
    }
    
    @IBAction func buttomPressed(_ sender: UIButton) {
        sender.isHidden = true
        userScore += 1
        yourScoreLabe.text = String(userScore)
        randomButtomIndex()
    }
    
    
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEndScreen",
            let destinationVC = segue.destination as? EndGameViewController {
            destinationVC.finishScoreDescription = String(userScore)
        }
    }
}
