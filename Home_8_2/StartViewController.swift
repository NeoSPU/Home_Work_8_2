//
//  StartViewController.swift
//  Home_8_2
//
//  Created by Alex Neo on 24.10.2017.
//  Copyright © 2017 Alex Neo. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var lastScoreLabe: UILabel!
    
    var lastScoreSourse: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func returnToStartScreen(_ sender: UIStoryboardSegue) {
            if let sourceVC = sender.source as? EndGameViewController,
                let lastScoreSourse = sourceVC.finishScoreDescription {
                    lastScoreLabe.text = String(lastScoreSourse)
                }
        }
    
    
    @IBAction func startButtomPressed(_ sender: UIButton) { }
    
        

}
