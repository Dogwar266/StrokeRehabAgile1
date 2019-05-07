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
    var timeMins = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    

    @IBAction func resetTimer(_ sender: Any) {
        timeMins = 0.0
        
        timerLabel.text = String("\(timeMins)mins ")
    }
    @IBAction func plusTenSecs(_ sender: Any) {
        timeMins += 0.10
        print(String(timeMins).suffix(2))
        if (String(timeMins).suffix(1) == "6"){
            timeMins += 0.40
        }
        timerLabel.text = String(format: "%.2f", timeMins, "mins")
    }
    @IBAction func plusOneMins(_ sender: Any) {
        timeMins = timeMins + 1
        
        timerLabel.text = String("\(timeMins)mins")
    }
    @IBAction func plusTenMins(_ sender: Any) {
        timeMins = timeMins + 10
        
        timerLabel.text = String("\(timeMins)mins")
    }
    
    @IBAction func minusTenSecs(_ sender: Any) {
        timeMins -= 0.10
        print(String(timeMins).suffix(2))
        if (String(timeMins).suffix(1) == "6"){
            timeMins -= 0.40
        }
        timerLabel.text = String(format: "%.2f", timeMins, "mins")
    }
    
    @IBAction func minusOneMins(_ sender: Any) {
        timeMins = timeMins - 1
        
        timerLabel.text = String("\(timeMins)mins")
    }
    
    @IBAction func minusTenMins(_ sender: Any) {
        timeMins = timeMins - 10
        
        timerLabel.text = String("\(timeMins)mins")
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
            let timerValue = segue.destination as! goalCounter
            timerValue.valueFromTimerSetView = timerLabel.text
        }
    }
}
