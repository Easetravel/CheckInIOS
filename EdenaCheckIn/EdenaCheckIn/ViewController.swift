//
//  ViewController.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/25.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var termsAgree: UISwitch!
    @IBOutlet weak var FirstNameText: LineTextField!
    @IBOutlet weak var LastNameText: LineTextField!
    @IBOutlet weak var NumGuestText: LineTextField!
    @IBOutlet weak var ReservationNoText: LineTextField!
    @IBOutlet weak var ExpirationDatePicker: LineTextField!
    
    @IBOutlet weak var CreditCardText: LineTextField!
    @IBOutlet weak var DateText: LineTextField!
    @IBOutlet weak var HolderText: LineTextField!
    @IBOutlet weak var CvvText: LineTextField!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var DestViewController : ViewConfirm = segue.destination as! ViewConfirm
        DestViewController.firstNameReceiver = FirstNameText.text!
        DestViewController.lastNameReceiver = LastNameText.text!
        DestViewController.numGuestReceiver = NumGuestText.text!
        DestViewController.reservationNumReceiver = ReservationNoText.text!
        
        DestViewController.creditcardReceiver = CreditCardText.text!
        DestViewController.dateReceiver = DateText.text!
        DestViewController.holderReceiver = HolderText.text!
        DestViewController.cvvReceiver = CvvText.text!
    }
    
    func createDatePicker(){
        let monthdatepicker = MonthYearPickerView()
        monthdatepicker.onDateSelected = { (month: Int, year: Int) in
            let string = String(format: "%02d/%d", month, year)
            NSLog(string) // should show something like 05/2015
            self.DateText.text = string
        }
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        ExpirationDatePicker.inputAccessoryView = toolbar
        
        ExpirationDatePicker.inputView = monthdatepicker
    }
    
    func donePressed(){
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        dateFormatter.timeStyle = .none
//        
//        ExpirationDatePicker.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }

    @IBAction func agree(_ sender: UISwitch) {
        if termsAgree.isOn{
            Continue.isEnabled = true
            Continue.backgroundColor = UIColor(red:0.40, green:0.78, blue:1.00, alpha:1.0)

        }
        else{
            Continue.isEnabled = false;
            Continue.backgroundColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        }
    }

}

