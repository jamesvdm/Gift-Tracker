//
//  DateTextField.swift
//  Gifted
//
//  Created by Anton Ball on 3/9/17.
//  Copyright © 2017 James van der Moezel. All rights reserved.
//

import UIKit

class DateTextField: UITextField {

    let datePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        
        dateFormatter.dateFormat = "dd-MMM-YYYY"
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        let toolbarCancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let toolbarDoneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let toolbarSpacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([toolbarCancelButton, toolbarSpacer, toolbarDoneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        self.inputView = datePicker
        self.inputAccessoryView = toolbar
    }
    
    func cancelButtonTapped() {
        resignFirstResponder()
    }
    
    func doneButtonTapped() {
        resignFirstResponder()
        text = dateFormatter.string(from: getDate())
    }
    
    func getDate() -> Date {
        return datePicker.date
    }
}
