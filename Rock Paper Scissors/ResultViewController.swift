//
//  ResultViewController.swift
//  Rock Paper Scissors
//
//  Created by Jose Virgen on 7/1/16.
//  Copyright © 2016 Jose Virgen. All rights reserved.
//

import UIKit

enum Shape: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    // This function randomly generates an opponent's play
    static func randomShape() -> Shape {
        let shapes = ["Rock", "Paper", "Scissors"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}



class ResultViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    var userChoice:Shape!
    private let opponentChoice: Shape = Shape.randomShape()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }
    
    
    
    private func displayResult() {
        // Ideally, most of this would be handled by a model.
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"
        
        // Why is an exclamation point necessary? :)
        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup): it's a tie!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "You win with \(matchup)!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "You lose with \(matchup) :(."
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercaseString
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }

    

    @IBAction func playAgain(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
