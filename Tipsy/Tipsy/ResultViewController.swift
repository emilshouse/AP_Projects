//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Adnan Abdulai on 12/14/19.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!

    var splitBy: String?
    var total: Double?
    var perCentage: Character?


    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = "$\(String(total!))"
        settingsLabel.text = "Split between \(splitBy!) people, with \(perCentage!)0% tip."

    }

    @IBAction func recalculateTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
