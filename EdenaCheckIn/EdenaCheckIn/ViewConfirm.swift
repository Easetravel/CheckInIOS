//
//  ViewConfirm.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/26.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import Foundation
import UIKit

class ViewConfirm : UIViewController{
    
    
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var NumGuestLabel: UILabel!
    @IBOutlet weak var ReservationNumLabel: UILabel!
    
    var firstNameText = String()
    var lastNameText = String()
    var numGuestText = String()
    var reservationNumText = String()
    
    override func viewDidLoad() {
        FirstNameLabel.text = firstNameText
        LastNameLabel.text = lastNameText
        NumGuestLabel.text = numGuestText
        ReservationNumLabel.text = reservationNumText
    }
}
