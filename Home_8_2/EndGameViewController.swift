//
//  EndGameViewController.swift
//  Home_8_2
//
//  Created by Alex Neo on 24.10.2017.
//  Copyright © 2017 Alex Neo. All rights reserved.
//

import UIKit


class EndGameViewController: UIViewController {
    
    @IBOutlet weak var finishScoreLabel: UILabel!
    var finishScoreDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishScoreLabel.text = finishScoreDescription
    }
}
