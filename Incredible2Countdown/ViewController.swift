//
//  ViewController.swift
//  Incredible2Countdown
//
//  Created by Chang Sophia on 2018/7/19.
//  Copyright © 2018年 Chang Sophia. All rights reserved.
//

import UIKit

var timer: Timer?
var released: Date!
var now: Date!
var hour: Date!
var min: Date!
var sec: Date!

class ViewController: UIViewController {
    

    @IBOutlet weak var nowTextField: UITextField!
    @IBOutlet weak var releasedTextField: UITextField!
    @IBOutlet weak var myDatePickerValue: UIDatePicker!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    
    
    @IBAction func myDatePickerValue(_ sender: UIDatePicker) {
        released = sender.date
        var now = Date()
        now = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: now)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        let time = formatter.string(from: now)
        self.nowTextField.text = time
        let day = released.timeIntervalSince(now)
        let hour = released.timeIntervalSince(now)
        let min = released.timeIntervalSince(now)
        let sec = released.timeIntervalSince(now)
        releasedTextField.text = formatter.string(from:
            myDatePickerValue.date)
        dayLabel.text = formatter.string(from: myDatePickerValue.date)
        let integerday = Int(day/60/60/24)
        dayLabel.text = ("\(integerday)")
        hourLabel.text = formatter.string(from: myDatePickerValue.date)
        let integerhour = Int(hour/60/60)
        hourLabel.text = ("\(integerhour)")
        minLabel.text = formatter.string(from: myDatePickerValue.date)
        let integermin = Int(min/60)
        minLabel.text = ("\(integermin)")
        secLabel.text = formatter.string(from: myDatePickerValue.date)
        let integersec = Int(sec)
        secLabel.text = ("\(integersec)")
     
    }
    
    
    
    override func viewDidLoad() {
       myDatePickerValue.minimumDate = Date().addingTimeInterval(60*60*24)
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
    }
}
    
}

