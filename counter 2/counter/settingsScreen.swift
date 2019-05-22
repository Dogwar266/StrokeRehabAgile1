//
//  settingsScreen.swift
//  counter
//
//  Created by Damien Kozakiewicz on 12/5/19.
//  Copyright © 2019 Stroke Team. All rights reserved.
//

import UIKit

public class Settings {
   var timerHidden = false
}
let settings = Settings()
class settingsScreen: UIViewController {

   
    
    @IBOutlet weak var hideTimer: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        hideTimer.setOn(settings.timerHidden, animated: true)
        // Do any additional setup after loading the view.
    }
    @IBAction func Exit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func hideTimer(_ sender: Any) {
        settings.timerHidden = hideTimer.isOn
        print("timerHidden: \(settings.timerHidden)")
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
