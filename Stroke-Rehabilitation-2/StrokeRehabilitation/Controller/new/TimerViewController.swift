//
//  TimerViewController.swift
//  StrokeRehabilitation
//
//  Created by tech on 2019/5/18.
//  Copyright © 2019 XiaoranDu. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var patient2 : Patient2Model?
    var dataArr :NSArray?
    var dataArr1 :NSArray?
    var numLab = UILabel.init()
    var  allnum = 0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2222")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let  titleLab = UILabel.init(frame: CGRect(x:0, y:150, width:self.view.frame.size.width, height:20))
        titleLab.text = "SET A TIMER"
        titleLab.textAlignment = NSTextAlignment.center
        self.view.addSubview(titleLab)
        
        numLab.frame=CGRect(x:0, y:200, width:self.view.frame.size.width, height:40)
        numLab.textAlignment = NSTextAlignment.center
        numLab.font = UIFont.systemFont(ofSize: 50)
        numLab.text = String(allnum)
        self.view.addSubview(numLab)
    
        self.dataArr = ["-10m", "-1m","-10s","Rest", "+10s","+1m","+10m"]
        self.dataArr1=["-600", "-60","-10","0", "+10","+60","+600"]
        let w  = Float(self.view.frame.size.width/7)
        for i in 0...self.dataArr!.count - 1{
            let aw =  Int(w) * i
            let button = UIButton(type:.custom)
            button.frame = CGRect(x: aw, y:300, width:Int(w), height:30)
            button.setTitle(self.dataArr?[i] as? String, for: .normal)
            button.tag = 70 + i
            button.setTitleColor(UIColor.lightGray, for: .normal)
            button.layer.borderColor = UIColor.lightGray.cgColor
            button.layer.borderWidth = 0.5
            button.addTarget(self, action: #selector(buttonClick(button:)), for: .touchUpInside)
            self.view.addSubview(button)
        }
        let button = UIButton(type:.custom)
        button.frame = CGRect(x: 20, y:400, width:self.view.frame.size.width-40, height:40)
        
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(Save(button:)), for: .touchUpInside)
        self.view.addSubview(button)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func Save(button:UIButton ){
        self.patient2?.timergoal = allnum
        if  self.patient2?.save() != 0 {
            print("save successfully saved!")
        }
        
        
    }
    

    
        @objc func buttonClick(button:UIButton ){
            
            let  numstr = self.dataArr1?[button.tag-70] as? String
            print(numstr)
            let num:NSInteger = Int(numstr!) ?? 0
            print(num )
            
            
            if button.tag != 73 {
                if allnum >= 0 {
                    if allnum + num  >= 0{
                        allnum = allnum + num
                    }
                    
                }
            }else{
                allnum = 0
            }
            
            numLab.text = String(allnum)
        }




}
