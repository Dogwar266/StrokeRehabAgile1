//
//  CounterViewController.swift
//  StrokeRehabilitation
//
//  Created by tech on 2019/5/18.
//  Copyright © 2019 XiaoranDu. All rights reserved.
//

import UIKit
import AudioToolbox
class CounterViewController: UIViewController,UITextFieldDelegate {

    
     var typeid = ""
     var patient2 : Patient2Model?
    var textf = UITextField.init()
    var backview = UIView.init()
    var count:Int = 0
    var armed:Bool = false
    
    var second = 0
    var timer : Timer?
    var  timeLab = UILabel.init()
     var currentstr : NSString = ""
    var  goalnum = 0
    var  goalLab = UILabel.init()
    var currentnum = 0;
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        second = 0
        goalnum = 0
        getdata()
        buield()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

          print("0000")
        
        backview.frame =  CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height)
        
        self.view.addSubview(backview)
        
        
        
        self.view.addSubview(textf)
        setkeybord()
        
        
        let button = UIButton(type:.custom)
        button.frame = CGRect(x: 0, y:self.view.frame.size.height-150, width:80, height:30)
        
        button.setTitle("ARM", for: .normal)
        
        button.setTitleColor(UIColor.blue, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.addTarget(self, action: #selector(arm), for: .touchUpInside)
        self.view.addSubview(button)
        

        let button2 = UIButton(type:.custom)
        button2.frame = CGRect(x: self.view.frame.size.width-80, y:self.view.frame.size.height-150, width:80, height:30)
        
        button2.setTitle("TRIGGER", for: .normal)
        
        button2.setTitleColor(UIColor.blue, for: .normal)
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderWidth = 0.5
        button2.addTarget(self, action: #selector(counter), for: .touchUpInside)
        self.view.addSubview(button2)
        
        let button3 = UIButton(type:.custom)
        button3.frame = CGRect(x: 20, y:self.view.frame.size.height-100, width:self.view.frame.size.width-40, height:40)
        
        button3.setTitle("Begin", for: .normal)
          button3.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button3.setTitleColor(UIColor.blue, for: .normal)
        button3.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderWidth = 0.5
        button3.addTarget(self, action: #selector(Begin(button:)), for: .touchUpInside)
        self.view.addSubview(button3)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func  buield(){
        
        
      
        
        if self.backview.subviews.count > 0 {
            
            self.backview.subviews.forEach({ $0.removeFromSuperview()});

            
        }

        
        //  goal的部分
        if patient2?.showreps ?? false {
            
            if patient2?.showrepsgoal ?? false {
                //  倒计时
                // 计时
                let  titleLab = UILabel.init(frame: CGRect(x:0, y:200, width:self.view.frame.size.width, height:20))
                titleLab.text = "Reps  Completed"
                titleLab.textAlignment = NSTextAlignment.center
                backview.addSubview(titleLab)
                
                
                goalLab.frame = CGRect(x:0, y:230, width:self.view.frame.size.width, height:20)
                goalLab.text = "0 / 0"
                goalLab.textAlignment = NSTextAlignment.center
                backview.addSubview(goalLab)
                
                if patient2?.showrepsgoal ?? false {  //   完整

                    var str_begin = ""
                    let  num:NSInteger = patient2?.repsgoal ?? 0
                    
                    
                    let str_end = String(num)
                    if patient2?.showrepsup ?? false  {  //  减少
                        str_begin  = String(0)
                        
                    }else{
                        
                        str_begin  =  String(num - 0)
                    }
                    goalLab.text = str_begin + " / " + str_end
                }else{
                    goalLab.text =  String(0)
                }
                
                
            }else{
                
                // 计时
                let  titleLab = UILabel.init(frame: CGRect(x:0, y:200, width:self.view.frame.size.width, height:20))
                titleLab.text = "Reps Remaining"
                titleLab.textAlignment = NSTextAlignment.center
                backview.addSubview(titleLab)
                
                
                goalLab.frame = CGRect(x:0, y:230, width:self.view.frame.size.width, height:20)
                goalLab.text = "0"
                goalLab.textAlignment = NSTextAlignment.center
                backview.addSubview(goalLab)
                
            }
            
            
        }
        
        
        //  时间的部分
        if patient2?.showtimer ?? false {
            
            if patient2?.showtimergoal ?? false {
                //  倒计时
                // 计时
                let  titleLab = UILabel.init(frame: CGRect(x:0, y:380, width:self.view.frame.size.width, height:20))
                titleLab.text = "Timer"
                titleLab.textAlignment = NSTextAlignment.center
                backview.addSubview(titleLab)
                
                
                timeLab.frame = CGRect(x:0, y:410, width:self.view.frame.size.width, height:20)
                timeLab.text = "0:00"
                timeLab.textAlignment = NSTextAlignment.center
                backview.addSubview(timeLab)
                
                
                if patient2?.showtimergoal ?? false {  //  增加
                    var str_begin = ""
                    let  num:NSInteger = patient2?.timergoal ?? 0
                    let str_end = getMMSSFromSS(seconds: num)
                    if patient2?.showtimerup ?? false  {  //  增加
                        
                        str_begin  =  getMMSSFromSS(seconds: second)
                        
                    }else{
                        
                        str_begin  =  getMMSSFromSS(seconds: num - second)
                    }
                    timeLab.text = str_begin + " / " + str_end
                }else{
                    
                    
                    timeLab.text = getMMSSFromSS(seconds: second)
                }
                
                
            }else{
                
                // 计时
                let  titleLab = UILabel.init(frame: CGRect(x:0, y:380, width:self.view.frame.size.width, height:20))
                titleLab.text = "Time Left:"
                titleLab.textAlignment = NSTextAlignment.center
               backview.addSubview(titleLab)
                
                
                
                timeLab.frame = CGRect(x:0, y:410, width:self.view.frame.size.width, height:20)
                timeLab.text = "0:00"
                timeLab.textAlignment = NSTextAlignment.center
                backview.addSubview(timeLab)
                
                
                
                
            }
            
            
        }
        
        
        
    }
    
    
    func  getdata(){
        
        let  str = "id =" + self.typeid
        print(str)
        let data = Patient2Model.rows(filter:str)
        
        if data.count > 0 {
            print("存在")
            patient2 = data[0] as? Patient2Model
            print(data.count)
        }
    }
    
    
    @objc func arm() {
        if armed == false
        {
            armed = true
        }
        
    }
    @objc func counter() {
        if armed == true
        {
            goalnum += 1
            
            showGoal(goal: goalnum)
            armed = false
        }
    }
    
    @objc func Begin(button:UIButton ){
        
        second = 0
        goalnum = 0
        getdata()
        buield()
         textf.becomeFirstResponder()
        if patient2?.showtimer ?? false {
            startTimer()
  
        }
        
        
        
        
       
    }
    
    func getMMSSFromSS(seconds :NSInteger)-> String{
        
        let str_minute = String(format: "%02ld", seconds/60)
        let str_second = String(format: "%02ld", seconds%60)
        
        
        let format_time = str_minute + ":" + str_second

        return format_time;
    }
    
  
    // 2.开始计时
    func startTimer() {
        
        if (timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updataSecond), userInfo: nil, repeats: true)
            //调用fire()会立即启动计时器
            timer!.fire()
        }
        
    }
    
    // 3.定时操作
    @objc func updataSecond() {
        
        
       
            //.........
        second += 1
        if patient2?.showtimergoal ?? false {  //  增加

            var str_begin = ""
            let  num:NSInteger = patient2?.timergoal ?? 0
            let str_end = getMMSSFromSS(seconds: num)
            
            if second >= num {
                
                let str = "Your" + str_end + "timer has ran out !"
                self.alertShow(title: "TIMER EXPIRED",message:str )
                
                stopTimer()
            }
            
            if patient2?.showtimerup ?? false  {  //  增加
                
               str_begin  =  getMMSSFromSS(seconds: second)
                
            }else{
                
                str_begin  =  getMMSSFromSS(seconds: num - second)
            }
             timeLab.text = str_begin + " / " + str_end
         }else{
             timeLab.text = getMMSSFromSS(seconds: second)
        }
       
       
    }
    
    // 4.停止计时
    func stopTimer() {
        if timer != nil {
            timer!.invalidate() //销毁timer
            timer = nil
        }
    }
    
    
    func showGoal(goal :NSInteger){
        
        
        if patient2?.showrepsgoal ?? false {  //   完整
            
           
            var str_begin = ""
            let  num:NSInteger = patient2?.repsgoal ?? 0
          
            if goal >  num{
                return
            }
            
                let str_end = String(num)
                if patient2?.showrepsup ?? false  {  //  减少
                    str_begin  = String(goal)
                    
                }else{
                    
                    str_begin  =  String(num - goal)
                }
                goalLab.text = str_begin + " / " + str_end
            
                if goal ==  num{
                    
                    alertShow1(title:  "GOAL REACHED", message: "Congratulations! You have completed your target reps", message1: "continue session")
//                    alertShow(title: "GOAL REACHED", message: "Congratulations! You have completed your target reps")
                    return
                
               }
              

            
        }else{
            goalLab.text =  String(goal)
        }
    }
    
    
    
    func setkeybord(){
        textf.delegate = self
        textf.becomeFirstResponder()
        textf.returnKeyType = UIReturnKeyType.done
        textf.addTarget(self, action: #selector(textFieldTextChange(textfs:)), for:  UIControl.Event.editingChanged)
        
 
    }
    
    @objc func textFieldTextChange(textfs:UITextField){
      
        
            
        let nostr : NSString = textfs.text!  as NSString
        if nostr.length > currentstr.length {
        print("increase")
        let str = nostr.replacingOccurrences(of: currentstr as String, with: "")
        print(str)
            
             playAction(string: str)
           if  isPurnInt(string: str) {
                    print(str)
                    sub()
                    
            
            }
            
//            if  isPurnInt1(string: str) {
//                self.alertShow(title: "INCORRECT ORDER",message:"Please press Button A,followed by BUtton B to complete to a rep" )
//            }
            
                
        }
        
        
      
        
        
        
        currentstr = textfs.text!  as NSString
        
        
        
    }
    
    
    func sub() -> Void
    {
        
        
        goalnum += 1
        
        showGoal(goal: goalnum)

        
    }
    func isPurnInt(string: String) -> Bool {
        
        let numstr:NSString = string as NSString
        let num = numstr.integerValue
        if  currentnum == 1 && num == 2{
            
            textf.text=""
            currentnum = 0
            return true
        }else if currentnum == 2 && num == 1{
            currentnum = num
            
            self.alertShow(title: "INCORRECT ORDER",message:"Please press Button A,followed by BUtton B to complete to a rep" )
            return false
        }
        else{
            currentnum = num
            return false
        }
  
    }
    
//    func isPurnInt1(string: String) -> Bool {
//
//        let numstr:NSString = string as NSString
//        let num = numstr.integerValue
//        if  currentnum == 2 && num == 1{
//            return true
//        }else{
////            currentnum = num
//            return false
//        }
//
//    }
    
    
    func playAction(string: String){
        
        let numstr:NSString = string as NSString
        let num = numstr.integerValue
        
        if patient2?.showsounds ?? false  {
            if num == 1 || num==2 {
                 var systemSoundID:SystemSoundID = 0;
                var path = Bundle.main.path(forResource: "11442", ofType: "wav")
              
                if num==1 {
                    path = Bundle.main.path(forResource: "First_Tone", ofType: "mp3")
                }else{
                    path = Bundle.main.path(forResource: "Second_Tone", ofType: "mp3")
                }
                
                AudioServicesCreateSystemSoundID(NSURL.fileURL(withPath: path!) as CFURL, &systemSoundID)
                AudioServicesPlayAlertSound(SystemSoundID(systemSoundID))
            }
            
           
        }
        
        
        
    }
    
    func alertShow(title:String,message:String)
    {
        let alertView = UIAlertView(title:title, message: message, delegate: nil, cancelButtonTitle: "ok");
        alertView.show()
    }
    
    
    
    func alertShow1(title:String,message:String,message1:String)
    {
        let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "Finish", otherButtonTitles: message1, "");
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
