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
    
    
    @IBOutlet weak var BgImage: UIImageView!
    
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var NumGuestLabel: UILabel!
    @IBOutlet weak var ReservationNumLabel: UILabel!
    
    var firstNameText = String()
    var lastNameText = String()
    var numGuestText = String()
    var reservationNumText = String()
    
    override func viewDidLoad() {
        BgImage.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0).cgColor
        BgImage.layer.borderWidth = 2
        BgImage.layer.zPosition = -5;
        
        
        FirstNameLabel.text = firstNameText
        LastNameLabel.text = lastNameText
        NumGuestLabel.text = numGuestText
        ReservationNumLabel.text = reservationNumText
    }
}
