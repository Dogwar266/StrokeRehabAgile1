//
//  ViewController.swift
//  counter
//
//  Created by Reuben Chaffer on 3/5/19.
//  Copyright © 2019 Stroke Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var triggerButton: UIButton!
    @IBOutlet weak var armButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    var count:Int = 0 //value to be displayed on the counter
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
            if count >= 0
            {
                count += 1 //increase the value of count
                countDisplay.text = String(count) //change the label that displays the counter value
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
    func reset() -> Void
    {
        count = 0
        countDisplay.text = String(count)
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
    
    
    
    

}

