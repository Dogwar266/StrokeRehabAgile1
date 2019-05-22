//
//  StartPageController.swift
//  StrokeRehabilitation
//
//  Created by yinzixie on 5/4/19.
//  Copyright © 2019 Project. All rights reserved.
//

import UIKit

class StartPageController: UIViewController {
    
    var database : SQLiteDatabase = SQLiteDatabase(databaseName:"MyDatabase")
    
    @IBOutlet var idTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //pop up alert if parameter was right
    func parameterAlert(message:String){
        let alert = UIAlertController(
            title:"Warnning",
            message:message,
            preferredStyle:UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(
            title:"OK",
            style:UIAlertAction.Style.cancel,
            handler:nil
        ))
        self.present(alert, animated: true, completion: nil)
    }
    
    ///remove PatientTableController in navigation controller
    public func removeController() {
        if let tmpControllers = navigationController?.viewControllers {
            var controllers = tmpControllers
            
            for (i, controller) in (controllers.enumerated()).reversed() {
                if controller.isKind(of: StartPageController.classForCoder()) {
                    controllers.remove(at: i)
                    navigationController?.viewControllers = controllers
                }
            }
        }
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
         let id = idTextField.text
        if(database.selectPatientByID(id:id!) == nil) {
            parameterAlert(message:"Wrong ID!")
            return false
        }else {
            
            

            return true

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let id = idTextField.text
        if(database.selectPatientByID(id:id!) == nil) {
          
        }else {
            
            let controller = segue.destination as! HomeViewController
            controller.typeid = id ?? ""
            
           
        }
       
    }
    @IBAction func LoginButton(_ sender: Any) {
       
        
        
        
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
