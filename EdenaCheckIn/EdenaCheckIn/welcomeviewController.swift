//
//  welcomeviewController.swift
//  EdenaCheckIn
//
//  Created by Alex Ding on 8/1/17.
//  Copyright © 2017 EdenaResorts. All rights reserved.
//

//
//  ViewConfirm.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/26.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import Foundation
import UIKit

var prefs = UserDefaults.standard
class welcomeviewController : UIViewController{
    
    override func viewDidLoad() {
        prefs.removeObject(forKey: "firstname")
        prefs.removeObject(forKey: "lastname")
        prefs.removeObject(forKey: "email")
        prefs.removeObject(forKey: "cvv")
        prefs.removeObject(forKey: "holder")
        prefs.removeObject(forKey: "reservenum")
        prefs.removeObject(forKey: "guestnum")
        prefs.removeObject(forKey: "creditcard")
        prefs.removeObject(forKey: "expdate")
        
    }
    
    
}
