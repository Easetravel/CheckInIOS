//
//  ViewController.swift
//  EdenaCheckIn
//
//  Created by peiming on 2017/6/25.
//  Copyright © 2017年 EdenaResorts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstNameText: LineTextField!
    @IBOutlet weak var LastNameText: LineTextField!
    @IBOutlet weak var NumGuestText: LineTextField!
    @IBOutlet weak var ReservationNoText: LineTextField!
    @IBOutlet weak var ExpirationDatePicker: LineTextField!
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
        DestViewController.firstNameText = FirstNameText.text!
        DestViewController.lastNameText = LastNameText.text!
        DestViewController.numGuestText = NumGuestText.text!
        DestViewController.reservationNumText = ReservationNoText.text!
    }
    
    func createDatePicker(){
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        
        ExpirationDatePicker.inputAccessoryView = toolbar
        
        ExpirationDatePicker.inputView = datePicker
    }
    
    func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        ExpirationDatePicker.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }


}

