//
//  ViewController.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/25.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var allfield = false;

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
    @IBOutlet weak var EmailText: LineTextField!
    
    let datePicker = UIDatePicker()
    let prefs = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // add constrain 
        FirstNameText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        LastNameText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        NumGuestText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        ReservationNoText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        ExpirationDatePicker.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        CreditCardText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        HolderText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        CvvText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        EmailText.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
        
        FirstNameText.text = prefs.string(forKey: "firstname")
        LastNameText.text = prefs.string(forKey: "lastname")
        NumGuestText.text = prefs.string(forKey: "guestnum")
        ReservationNoText.text = prefs.string(forKey: "reservenum")
        CreditCardText.text = prefs.string(forKey: "creditcard")
        ExpirationDatePicker.text = prefs.string(forKey: "expdate")
        HolderText.text = prefs.string(forKey: "holder")
        CvvText.text = prefs.string(forKey: "cvv")
        EmailText.text = prefs.string(forKey: "email")
        
        //modify continue button
        guard
            let firstname = FirstNameText.text, !firstname.isEmpty,
            let lastname = LastNameText.text, !lastname.isEmpty,
            let numguest = NumGuestText.text, !numguest.isEmpty,
            let reservno = ReservationNoText.text, !reservno.isEmpty,
            let expdate = ExpirationDatePicker.text, !firstname.isEmpty,
            let creditcardno = CreditCardText.text, !firstname.isEmpty,
            let cvv = CvvText.text, !cvv.isEmpty,
            let cardholder = HolderText.text, !cardholder.isEmpty,
            let email = EmailText.text, !email.isEmpty,
            termsAgree.isOn
            else {
                Continue.isEnabled = false
                Continue.backgroundColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
                allfield = true;
                return
        }
        Continue.isEnabled = true
        Continue.backgroundColor = UIColor(red:0.40, green:0.78, blue:1.00, alpha:1.0)
        allfield = false;

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
        DestViewController.emailReceiver = EmailText.text!
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
    
    func editingChanged(_ textField: LineTextField) {
        if textField.text?.characters.count == 1 {
            if textField.text?.characters.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let firstname = FirstNameText.text, !firstname.isEmpty,
            let lastname = LastNameText.text, !lastname.isEmpty,
            let numguest = NumGuestText.text, !numguest.isEmpty,
            let reservno = ReservationNoText.text, !reservno.isEmpty,
            let expdate = ExpirationDatePicker.text, !firstname.isEmpty,
            let creditcardno = CreditCardText.text, !firstname.isEmpty,
            let cvv = CvvText.text, !cvv.isEmpty,
            let cardholder = HolderText.text, !cardholder.isEmpty,
            let email = EmailText.text, !email.isEmpty,
            termsAgree.isOn
            else {
                Continue.isEnabled = false
                Continue.backgroundColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
                allfield = true;
                return
        }
        Continue.isEnabled = true
        Continue.backgroundColor = UIColor(red:0.40, green:0.78, blue:1.00, alpha:1.0)
        allfield = false;
    }

    @IBAction func agree(_ sender: UISwitch) {
        if (allfield && termsAgree.isOn)
        {
            Continue.isEnabled = true
            Continue.backgroundColor = UIColor(red:0.40, green:0.78, blue:1.00, alpha:1.0)

        }
        else{
            Continue.isEnabled = false;
            Continue.backgroundColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
        }
    }
    
    @IBAction func saveData(_ sender: UIButton) {
       
        self.prefs.setValue(FirstNameText.text, forKey: "firstname")
        self.prefs.setValue(LastNameText.text, forKey: "lastname")
        self.prefs.setValue(NumGuestText.text, forKey: "guestnum")
        self.prefs.setValue(ReservationNoText.text, forKey: "reservenum")
        self.prefs.setValue(ExpirationDatePicker.text, forKey: "expdate")
        self.prefs.setValue(CreditCardText.text, forKey: "creditcard")
        self.prefs.setValue(HolderText.text, forKey: "holder")
        self.prefs.setValue(CvvText.text, forKey: "cvv")
        self.prefs.setValue(EmailText.text, forKey: "email")
    }
    

}

