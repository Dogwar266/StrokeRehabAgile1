//
//  Patient2Model.swift
//  StrokeRehabilitation
//
//  Created by wucai liao on 2019/5/20.
//  Copyright © 2019 Project. All rights reserved.
//

import UIKit

class Patient2Model: SQLTable {

    var id = -1
    var showreps = false  // 1 comment 2  3  4  5
    var showrepsgoal = false
    var showrepsup = false
    
    var showtimer = false
    var showtimergoal = false
    var showtimerup = false
    
    
    var showsounds = false
    
    var repsgoal = 0
    
    
    var timergoal = 0
   
    override var description:String {
        return "id: \(id), showreps: \(showreps), showrepsgoal: \(showrepsgoal), showrepsup: \(showrepsup), showtimer: \(showtimer), showtimergoal: \(showtimergoal), showtimerup: \(showtimerup), showsounds: \(showsounds), repsgoal: \(repsgoal), timergoal: \(timergoal)"
    }
}
