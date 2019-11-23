//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var storyLabel: UILabel!
    @IBOutlet var choice1: UIButton!
    @IBOutlet var choice2: UIButton!

    let story0 = "You see a fork in the road."
    


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func choiceMade(_ sender: UIButton) {

    }


    func updateUI() {
        storyLabel.text = "You see a fork in the road."

    }



}

