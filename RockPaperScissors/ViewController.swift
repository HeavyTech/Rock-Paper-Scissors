//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Jose Virgen on 7/1/16.
//  Copyright © 2016 Jose Virgen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playRock(sender: UIButton) {
        print("Rock was pressed")
        
        
        performSegueWithIdentifier("play", sender: sender)
        
        
//        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
//        controller.userChoice = getUserShape(sender)
//        
//        presentViewController(controller, animated: true, completion: nil)
        
        

    }

    @IBAction func playPaper(sender: UIButton) {
        print("paper was pressed")
        
        performSegueWithIdentifier("play", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play"{
            let controller = segue.destinationViewController as! ResultViewController
            controller.userChoice = getUserShape(sender as! UIButton)
    }
}
    
    
    
    private func getUserShape(sender: UIButton) -> Shape {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shape(rawValue: shape)!
    }

    
}

