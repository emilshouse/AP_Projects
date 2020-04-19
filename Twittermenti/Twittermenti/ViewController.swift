//
//  ViewController.swift
//  Twittermenti
//
//  Created by Angela Yu on 17/07/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sentimentLabel: UILabel!
    
    let tweetCount = 100
    
    let swifter = Swifter(consumerKey: "nil", consumerSecret: "nil")
    let sentimentClassifier = TweetSentimentClassifier()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func predictPressed(_ sender: Any) {
        
        fetchTweets()
        
    }
    
    
    func fetchTweets() {
        
        guard let searchText = textField.text else { return }
            
        swifter.searchTweet(using: searchText, lang: "en", count: tweetCount, tweetMode: .extended, success: { (results, metadata) in
            var tweets = [TweetSentimentClassifierInput]()
            
            for i in 0..<self.tweetCount {
                if let tweet = results[i]["full_text"].string {
                    print(tweet)
                    let tweetForClasification = TweetSentimentClassifierInput.init(text: tweet)
                    tweets.append(tweetForClasification)
                }
            }
            
            self.makePredictions(with: tweets)

        }) { (error) in
            print("There was an error with the Twitter API request: \(error)")
        }
        
    }
    
    func makePredictions(with tweets: [TweetSentimentClassifierInput]) {
        do {
            let predictions = try self.sentimentClassifier.predictions(inputs: tweets)
            var sentimentScore = 0
            for prediction in predictions {
                print(prediction.label)
                let sentiment = prediction.label
                switch sentiment {
                case "Pos":
                    sentimentScore += 1
                case "Neg":
                    sentimentScore -= 1
                default:
                    sentimentScore += 0
                }
            }
            
            updateUI(with: sentimentScore)
            
        } catch {
            print("There was an error with making the prediction, \(error)")
            
        }
    }
    
    func updateUI(with sentimentScore: Int) {
        
        print(sentimentScore)
                   if sentimentScore > 20 {
                       self.sentimentLabel.text = "😍"
                   } else if sentimentScore >= 10 {
                   self.sentimentLabel.text = "😄"
                   } else if sentimentScore > 0  {
                   self.sentimentLabel.text = "🙂"
                   } else if sentimentScore == 0 {
                       self.sentimentLabel.text = "😐"
                   }else if sentimentScore > -10 {
                       self.sentimentLabel.text = "☹️"
                   } else if sentimentScore > -20 {
                   self.sentimentLabel.text = "😡"
                   }else {
                       self.sentimentLabel.text = "🤮"
                   }
    }
    
}

