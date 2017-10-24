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
    
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomButtomIndex()
        var timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)

    }
    
    @objc func update() {
        // Something cool
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
