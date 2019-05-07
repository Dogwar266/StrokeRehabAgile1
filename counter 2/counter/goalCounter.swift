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
    var nameFromGoalSetView: String?
    var valueFromTimerSetView: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.goalCount.text = nameFromGoalSetView
        self.timerLabel.text = valueFromTimerSetView
        print(timerLabel.text)
        
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
