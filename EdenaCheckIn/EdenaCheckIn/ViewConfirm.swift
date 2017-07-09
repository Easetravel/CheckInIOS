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
    
    @IBOutlet weak var CreditcardLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var HolerLabel: UILabel!
    @IBOutlet weak var CvvLabel: UILabel!
    
    var firstNameReceiver = String()
    var lastNameReceiver = String()
    var numGuestReceiver = String()
    var reservationNumReceiver = String()
    
    var creditcardReceiver = String()
    var dateReceiver = String()
    var holderReceiver = String()
    var cvvReceiver = String()
    
    override func viewDidLoad() {
        BgImage.layer.borderColor = UIColor(red:0.18, green:0.66, blue:0.88, alpha:1.0).cgColor
        BgImage.layer.borderWidth = 2
        BgImage.layer.zPosition = -5
        
        
        FirstNameLabel.text = firstNameReceiver
        LastNameLabel.text = lastNameReceiver
        NumGuestLabel.text = numGuestReceiver
        ReservationNumLabel.text = reservationNumReceiver
        
        CreditcardLabel.text = creditcardReceiver
        DateLabel.text = dateReceiver
        HolerLabel.text = holderReceiver
        CvvLabel.text = cvvReceiver
    }
    @IBAction func screenShot(_ sender: UIButton) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        var screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
        
    
    }


}
