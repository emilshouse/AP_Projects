import Cocoa
import CreateML

let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/admin/Downloads/twitter-sanders-apple3.csv"))

let(trainingData, testingData) = data.randomSplit(by: 0.80, seed: 5)

let sentimentClassifier = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evaluationMetrics = sentimentClassifier.evaluation(on: testingData, textColumn: "text", labelColumn: "class")

let evaluationAccuracy = (1.0 - evaluationMetrics.classificationError) * 100

let metadata = MLModelMetadata(author: "Adnan Abdulai", shortDescription: "A model trained to classify sentiments on tweets", version: "1.0")

try sentimentClassifier.write(to: URL(fileURLWithPath: "/Users/admin/Downloads/TweetSentimentClassifier.mlmodel"))

try sentimentClassifier.prediction(from: " is a great company!")
