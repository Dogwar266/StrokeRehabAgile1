//
//  settingsScreen.swift
//  counter
//
//  Created by Damien Kozakiewicz on 12/5/19.
//  Copyright © 2019 Stroke Team. All rights reserved.
//

import UIKit

class settingsScreen: UIViewController {

   var timerHidden = false
    
    @IBOutlet weak var hideTimer: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func hideTimer(_ sender: Any) {
        timerHidden = hideTimer.isOn
        print("timerHidden: \(timerHidden)")
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
