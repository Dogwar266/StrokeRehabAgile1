//
//  HomeViewController.swift
//  StrokeRehabilitation
//
//  Created by tech on 2019/5/18.
//  Copyright © 2019 XiaoranDu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

     var patient2 : Patient2Model?
    var typeid = ""
    var currentVC : UIViewController?
    var vcA : CounterViewController?
    var vcB : GoalViewController?
    var vcC : TimerViewController?
    
    var button1 = UIButton(type:.custom)
    var button2 = UIButton(type:.custom)
//    var numid？
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hahah")
        print(typeid)
        print(typeid)
        print("hahah")
        
        add()
        
        
        
        vcA = CounterViewController.init()
        vcA?.typeid = self.typeid
        vcA?.view.frame = self.view.bounds
        self.addChild(vcA!)
        self.view.addSubview(vcA!.view)
        
        
        vcB = GoalViewController.init()
        vcB?.view.frame = self.view.bounds
        
        vcC = TimerViewController.init()
        vcC?.view.frame = self.view.bounds
        currentVC = vcA
        

        vcA?.patient2=self.patient2
        vcB?.patient2=self.patient2
        vcC?.patient2=self.patient2
        
        
       
        button1.frame = CGRect(x: 0, y:100, width:180, height:30)
        
        button1.setTitle("goal settings", for: .normal)
        
        button1.setTitleColor(UIColor.blue, for: .normal)
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.borderWidth = 0.5
        button1.addTarget(self, action: #selector(setAction), for: .touchUpInside)
        self.view.addSubview(button1)
//        self.view.bringSubviewToFront(button1)
        
        
       
        button2.frame = CGRect(x: self.view.frame.size.width-180, y:100, width:180, height:30)
        
        button2.setTitle("end session", for: .normal)
        
        button2.setTitleColor(UIColor.blue, for: .normal)
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderWidth = 0.5
        button2.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(button2)
    
//        self.view.bringSubviewToFront(button2)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func  setAction(){
        
        
        
        performSegue(withIdentifier: "gotoset", sender: nil)

       
    }
    
    
    
    
    @objc func  backAction(){
        self.navigationController?.popViewController(animated: true)
    }
    
    func changeController(from oldController: UIViewController, to newController: UIViewController) {
        if currentVC != newController {
            self.addChild(newController)
       
            newController.view.frame = self.view.bounds
            self.transition(from: oldController, to: newController, duration: 0.3, options: .curveEaseInOut, animations: {
            }) { (finished) in
                if finished {
                    newController.didMove(toParent: self)
                    oldController.willMove(toParent: nil)
                    oldController.removeFromParent()
                  
                    self.currentVC = newController
                }
            }
            
            self.view.addSubview(button1)
            self.view.addSubview(button2)
            
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
            
        let controller = segue.destination as! SetViewController
        controller.patient2 = self.patient2
        
    }
    
    
    

    @IBAction func indexChanged(_ sender: Any) {
        print(segment.selectedSegmentIndex)
        
        switch segment.selectedSegmentIndex {
        case 0:
            changeController(from: currentVC!, to: vcA!)
            
            break
        case 1:
              changeController(from: currentVC!, to: vcB!)
             break
        case 2:
              changeController(from: currentVC!, to: vcC!)
             break
            
        default:
             break
            
        }
        
        
    }
    func  add(){
        
        
       
        let  str = "id =" + self.typeid
        print(str)
        let data = Patient2Model.rows(filter:str)
        
        if data.count > 0 {
            print("存在")
            
            patient2 = data[0] as? Patient2Model
            print(data.count)
        }else{
             print("不存在")
            let com = Patient2Model()
            
            com.id = Int(self.typeid) ?? 0
            
            print("Goods successfully saved!")
            print(com.id)
            if com.save() != 0 {
                
                patient2=com
                print("Goods successfully saved!")
                print(com.id)
            }
        }
        
       
       
        
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
