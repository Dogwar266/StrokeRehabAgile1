//
//  Patient.swift
//  StrokeRehabilitation
//
//  Created by yinzixie on 4/4/19.
//  Copyright © 2019 Project. All rights reserved.
//
import Foundation

public class Patient {
    
    /* enum gender {
     case man
     case women
     case neutral
     
     func string_() -> String {
     
     switch self {
     case .man: return "man"
     case .women: return "women"
     case .neutral: return "neutral"
     }
     }
     }*/
    
    var ID:String!
    var Firstname:String?
    var Givenname:String?
    var Age:Int?
    var Gender:String?
    
    var LevelDescription:String?
    var DateString:String? //create date
    
    var NormalCounterGoal:Int!
    var NormalCounterLimitTime:Float!
    
    var AimMissionList = [Mission]()
    var HistoryMissionList = [Mission]()
    
    init(id:String) {
        ID = id
        //DateString = DateInfo.dateToDateString(Date(), dateFormat: "yyyy-MM-dd  HH:mm:ss")
        NormalCounterGoal = 0
        NormalCounterLimitTime = 0
    }
    
    func setPatientDetails(firstname:String,givenname:String,sex:String,age:Int,levelDescription:String?){
        Firstname = firstname
        Givenname = givenname
        Gender = sex
        Age = age
        LevelDescription = levelDescription
    }
    
    func setPatientPresetGoal(normalGoal:Int,normalTime:Float) {
        NormalCounterGoal = normalGoal
        NormalCounterLimitTime = normalTime
    }
    
    func changeDate(date_:String) {
        DateString = date_
    }
}
