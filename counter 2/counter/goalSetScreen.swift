//
//  goalSetScreen.swift
//  counter
//
//  Created by Edward Boreham on 3/5/19.
//  Copyright © 2019 Stroke Team. All rights reserved.
//

import UIKit

class goalSetScreen: UIViewController {
    @IBOutlet var setGoal: UILabel!
    var goal = 0// Sets the goal label as an integer
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationItem.hidesBackButton = true
        print("viewdidload: \(goal)")
        // Do any additional setup after loading the view.
    }
    
    /*
        Decrements the counter by 5
        Logic is thus: goal is being set to it's current value then 5 is being subtracted
    */
    
    @IBAction func negateFive(_ sender: Any) {
        if goal > 0
        {
            goal = goal - 5
            if goal < 0
            {
                goal = 0
            }
            setGoal.text = String(goal)
        }

    }
    @IBAction func negateTen(_ sender: Any) {
        if goal > 0
        {
            goal = goal - 10
            if goal < 0
            {
                goal = 0
            }
            setGoal.text = String(goal)
        }
    }
    
    @IBAction func negateFifteen(_ sender: Any) {
        if goal > 0
        {
            goal = goal - 15
            if goal < 0
            {
                goal = 0
            }
            setGoal.text = String(goal)
        }
    }
    
    @IBAction func negateTwenty(_ sender: Any) {
        if goal > 0
        {
            goal = goal - 20
            if goal < 0
            {
                goal = 0
            }
            setGoal.text = String(goal)
        }
    }
    @IBAction func goalReset(_ sender: Any) {
        goal = 0
        setGoal.text = String(goal)
    }
    @IBAction func incrementFive(_ sender: Any) {
        goal = goal + 5
        setGoal.text = String(goal)
    }
    @IBAction func incrementTen(_ sender: Any) {
        goal = goal + 10
        setGoal.text = String(goal)
    }
    
    @IBAction func incrementFifteen(_ sender: Any) {
        goal = goal + 15
        setGoal.text = String(goal)
    }
    @IBAction func incrementTwenty(_ sender: Any) {
        goal = goal + 20
        setGoal.text = String(goal)
        print(goal)
    }
    
    /*
     
     This segue function will need fixing.
     I'm thinking of casting it to a label on the next screen (setTimer Screen) and then casting it again from there.
     Currently, if you try and run this it crashes. Potentially because the Segue doesn't actually go to the goalCounter screen
     Think about looking into the Segue options, see if there is any insight there.
 
     *** UPDATE ***
     
        Adding a custom Segue made it worse!
     
 */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "timerScreenSegue" {
            print("timerScreenSegue Called!")
            let timerScreen = segue.destination as! timerScreen
            timerScreen.goalCountFromGoalSetScreen = goal
        }
    }
}
