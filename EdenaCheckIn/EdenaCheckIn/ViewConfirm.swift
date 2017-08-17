//
//  ViewConfirm.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/26.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import Foundation
import UIKit
import SquarePointOfSaleSDK
class ViewConfirm : UIViewController{
    
 
    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var signitureView: YPDrawSignatureView! 
    @IBOutlet weak var TimeStamp: UILabel!
    @IBOutlet weak var BgImage: UIImageView!
    
    
    @IBOutlet weak var EmailLabel: UILabel!
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
    var emailReceiver = String()
    //square callback
    let yourCallbackURL = URL(string: "edena://")!
    

    
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
        EmailLabel.text = emailReceiver
        
        
        TimeStamp.text = getTodayString()
//      square preload
        SCCAPIRequest.setClientID("sq0idp-B0NU8KL0eq6TNlDOA_EzOg")
        
        do {
            // Specify the amount of money to charge.
            let money = try SCCMoney(amountCents: 100, currencyCode: "USD")
            
            // Create the request.
            let apiRequest =
                try SCCAPIRequest(
                    callbackURL: yourCallbackURL,
                    amount: money,
                    userInfoString: nil,
                    merchantID: nil,
                    notes: "Coffee",
                    customerID: nil,
                    supportedTenderTypes: .all,
                    clearsDefaultFees: false,
                    returnAutomaticallyAfterPayment: false
            )
            
            // Open Point of Sale to complete the payment.
            try SCCAPIConnection.perform(apiRequest)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
                
    }
    
    
    
    @IBAction func screenShot(_ sender: UIButton) {
        if(self.signitureView.doesContainSignature == true){
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        var screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
            UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
            
        
            
//        to next scene
//        self.performSegue(withIdentifier: "toThanksView", sender: self)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please Sign", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    
    }
    func getTodayString() -> String{
        
        let date = Date()
        let calender = Calendar.current
        let components = calender.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let year = components.year
        let month = components.month
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        let second = components.second
        var zonecode: String { return TimeZone.current.abbreviation() ?? "" }
        
        let today_string = String(year!) + "-" + String(month!) + "-" + String(day!) + " " + String(hour!)  + ":" + String(minute!) + ":" +  String(second!) + " " + zonecode
        
        return today_string
        
    }
    
    func updateButton(){
        if(self.signitureView.doesContainSignature){
            Continue.isEnabled = true
            Continue.backgroundColor = UIColor(red:0.40, green:0.78, blue:1.00, alpha:1.0)
            
        }else{
            Continue.isEnabled = false;
            Continue.backgroundColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        }
    }
    
    
    func touchesMoved(_ touches: Set<YPDrawSignatureView>, with event: UIEvent?) {
        print("hello")
    }

    
    
    
    @IBAction func Clear(_ sender: UIButton) {
        self.signitureView.clear()
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let sourceApplication = options[.sourceApplication] as? String,
            sourceApplication.hasPrefix("com.squareup.square") else {
                return false
        }
        
        do {
            let response = try SCCAPIResponse(responseURL: url)
            
            if let error = response.error {
                // Handle a failed request.
                print(error.localizedDescription)
            } else {
                // Handle a successful request.
            }
            
        } catch let error as NSError {
            // Handle unexpected errors.
            print(error.localizedDescription)
        }
        
        return true
    }



}
