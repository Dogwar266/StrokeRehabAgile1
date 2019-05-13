//
//  goalCounter.swift
//  counter
//
//  Created by Edward Boreham on 7/5/19.
//  Copyright © 2019 Stroke Team. All rights reserved.
//

import UIKit

class goalCounter: UIViewController {

    @IBOutlet weak var triggerButton: UIButton!
    @IBOutlet weak var armButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var goalCount: UILabel!
    
    var timer = Timer()
    var isTimerRunning = false

    var valueFromTimerSetView = TimeInterval(0)
    var goalValueFromTimerSetView = 0
    var formatter = DateComponentsFormatter()
    var count:Int = 0//value to be displayed on the counter
    var countdown = TimeInterval(0)

    override func viewDidLoad() {
        super.viewDidLoad()
       
        formatter.allowedUnits = [.minute, .second]//formats the TimeInterval datatype to look like mm:ss
        formatter.zeroFormattingBehavior = .pad
        countdown = valueFromTimerSetView
        // Do any additional setup after loading the view.
        //self.goalCount.text = nameFromGoalSetView
        timerLabel.text = formatter.string(from: countdown)
        goalCount.text = String(goalValueFromTimerSetView)
        count = goalValueFromTimerSetView
        print("goalcounterscreen: \(valueFromTimerSetView)")

        runTimer()//starts the timer as soon as the page is displayed
    }
    
    func runTimer() //runs the specified function (updateTimer) once every timeInterval (1 second)
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(goalCounter.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer()//decrements the timer every second and refreshes the label
    {
        countdown -= 1
        timerLabel.text = formatter.string(from: countdown)
        if countdown == 0
        {
            let alert = UIAlertController(title: "Time's Up!", message: "Your timer has ended. Tap Continue to keep going or Reset to start again.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil)) //adds a continue button to the alerts so the user isn't stuck in error message hell.
            alert.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(alert: UIAlertAction!) in self.reset()}))
            self.present(alert, animated: true)//presents the alert
        }
    }
   
    var armed:Bool = false //used for checking if the counter has been armed
    /*
     The arm function is used to arm the counter, making it ready to trigger.
     */
    func arm() -> Void
    {
        if armed == false
        {
            armed = true
        }
    }
    /*
     The trigger function is used to either increment the counter, if it has been armed, or to display a message telling the user they pressed the wrong button.
     */
    func trigger() -> Void
    {
        if armed == true
        {
            if count > 0
            {
                count -= 1 //decrease the value of count
                goalCount.text = String(count) //change the label that displays the counter value
                armed = false //de-arms the counter so its can be armed again
                print(count)
            }
            else //if the counter is zero or below, keep decrementing but remove the negative sign so it looks like its counting up
            {
                count -= 1 //decrease the value of count
                var stringCount = String(count)
                stringCount.remove(at: stringCount.startIndex)
                goalCount.text = stringCount //change the label that displays the counter value
                armed = false //de-arms the counter so its can be armed again
                print(count)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Error", message: "You need to hit the arm button before you can trigger the counter.", preferredStyle: .alert) //sets up the alert message for when he user presses the wrong button combonation
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil)) //adds a continue button to the alerts so the user isn't stuck in error message hell.
            
            self.present(alert, animated: true)//presents the alert
        }
        
    }
    func reset() -> Void //resets the goal and timer values to their starting values and refreshes the labels
    {
        countdown = valueFromTimerSetView
        count = goalValueFromTimerSetView
        goalCount.text = String(count)
        timerLabel.text = formatter.string(from: countdown)
    }
    @IBOutlet weak var countDisplay: UILabel! //declares our counter display in the code
    @IBAction func arm(_ sender: Any) { //links our arm button and tells it to run the arm function when pressed
        arm()
    }
    @IBAction func trigger(_ sender: Any) { //links our trigger button and tells it to run the trigger function when presed
        trigger()
    }
    
    @IBAction func reset(_ sender: Any) {
        reset()
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
