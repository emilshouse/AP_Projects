//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    var player: AVAudioPlayer?

    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!


    @IBAction func hardnessSelected(_ sender: UIButton) {

        timer.invalidate()
        progressBar.progress = 0.0
        var secondsRemaining = Float(eggTimes[sender.currentTitle!]!)
        let totalTime = Float(secondsRemaining)

       timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
                self.progressBar.progress = 1.0 - (secondsRemaining / totalTime)

            } else {
                self.timer.invalidate()
                self.mainLabel.text = sender.currentTitle
                self.playSound()
        }

        }
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)

            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }





}
