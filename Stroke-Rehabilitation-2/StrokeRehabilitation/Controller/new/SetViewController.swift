//
//  SetViewController.swift
//  StrokeRehabilitation
//
//  Created by tech on 2019/5/18.
//  Copyright © 2019 XiaoranDu. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {

      var patient2 : Patient2Model?
    @IBOutlet weak var sw1: UISwitch!
    @IBOutlet weak var sw2: UISwitch!
    
    @IBOutlet weak var sw3: UISwitch!
    
    @IBOutlet weak var sw4: UISwitch!
    
    @IBOutlet weak var sw5: UISwitch!
    @IBOutlet weak var seg2: UISegmentedControl!
    
    
    @IBOutlet weak var seg1: UISegmentedControl!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
                let item=UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(finishAction) )
                self.navigationItem.rightBarButtonItem=item
        sw1.setOn(self.patient2!.showreps, animated: false)
         sw2.setOn(self.patient2!.showrepsgoal, animated: false)
         sw3.setOn(self.patient2!.showtimer, animated: false)
         sw4.setOn(self.patient2!.showtimergoal, animated: false)
         sw5.setOn(self.patient2!.showsounds, animated: false)
        
       
        
        if self.patient2!.showrepsup {
            seg1.selectedSegmentIndex=0
        }else{
            seg1.selectedSegmentIndex=1
        }
        
        if self.patient2!.showtimerup {
            seg2.selectedSegmentIndex=0
        }else{
            seg2.selectedSegmentIndex=1
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @objc func finishAction(){
        
    
        self.patient2?.showreps = sw1.isOn
        self.patient2?.showrepsgoal = sw2.isOn
        self.patient2?.showtimer = sw3.isOn
        self.patient2?.showtimergoal = sw4.isOn
        self.patient2?.showsounds = sw5.isOn
        
        if seg1.selectedSegmentIndex==0 {
            self.patient2?.showrepsup = true
        }else{
            self.patient2?.showrepsup = false
        }
        
        if seg2.selectedSegmentIndex==0 {
            self.patient2?.showtimerup = true
        }else{
            self.patient2?.showrepsup = false
        }
        
        if  self.patient2?.save() != 0 {
           
            backAction()
            print("save successfully saved!")
        }
        
        
        
        
    }
    
    func  backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func alertShow(title:String,message:String)
    {
        let alertView = UIAlertView(title:title, message: message, delegate: nil, cancelButtonTitle: "ok了");
        alertView.show()
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
