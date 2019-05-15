//
//  timerScreen.swift
//  counter
//
//  Created by Edward Boreham on 7/5/19.
//  Copyright © 2019 Stroke Team. All rights reserved.
//

import UIKit

class timerScreen: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    var timeMins = TimeInterval(0)
    var formatter = DateComponentsFormatter()
    var goalCountFromGoalSetScreen: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        
        print("timerScreen goal var: \(goalSetScreen.init().goal)"	)
    }
    

    @IBAction func resetTimer(_ sender: Any) {
        timeMins = 0.0
        
        timerLabel.text = formatter.string(from: timeMins)
    }
    @IBAction func plusTenSecs(_ sender: Any) {
        timeMins += 10
        timerLabel.text = formatter.string(from: timeMins)
    }
    @IBAction func plusOneMins(_ sender: Any) {
        timeMins = timeMins + 60
        
        timerLabel.text = formatter.string(from: timeMins)
    }
    @IBAction func plusTenMins(_ sender: Any) {
        timeMins = timeMins + 600
        
        timerLabel.text = formatter.string(from: timeMins)
        
    }
    
    @IBAction func minusTenSecs(_ sender: Any) {
        timeMins -= 10
        timerLabel.text = formatter.string(from: timeMins)
    }
    
    @IBAction func minusOneMins(_ sender: Any) {
        timeMins = timeMins - 60
        
        timerLabel.text = formatter.string(from: timeMins)
    }
    
    @IBAction func minusTenMins(_ sender: Any) {
        timeMins = timeMins - 600
        
        timerLabel.text = formatter.string(from: timeMins)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "goalRepsSegue" {
            print("goalRepsSegue Called!")
            let goalCounter = segue.destination as! goalCounter
            goalCounter.valueFromTimerSetView = timeMins
            goalCounter.goalValueFromTimerSetView = goalCountFromGoalSetScreen ?? 0
            print("from timerScreen segue: \(goalCounter.valueFromTimerSetView)")
        }
    }
    
    //override func prepare(for segue: )
}
