//
//  AddGifteeViewController.swift
//  Gifted
//
//  Created by James van der Moezel on 21/8/17.
//  Copyright © 2017 James van der Moezel. All rights reserved.
//

import UIKit

class AddGifteeViewController: UIViewController {
    
    private var newGiftee:Person? = nil
    
    @IBOutlet weak var gifteeNameField: UITextField!
    @IBOutlet weak var birthdayInput: UITextField!
    @IBAction func addTouchUpInside(_ sender: Any) {
        let eventInputView = EventInputView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 100))
        view.addSubview(eventInputView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Create Save button
        let rightButtonItem = UIBarButtonItem.init(
            title: "Save",
            style: .done,
            target: self,
            action: #selector(AddGifteeViewController.rightButtonAction(_:))
        )
        
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
        let appDelegate:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = appDelegate.persistentContainer.viewContext
        self.newGiftee = Person(context: context)
    }

    //Save to core data
    func rightButtonAction(_ sender: UIBarButtonItem) {
        
        self.newGiftee!.name = gifteeNameField.text!
        let appDelegate:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)

        appDelegate.saveContext()
    
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var dateTextField: UITextField!

    @IBAction func textFieldEditing(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.maximumDate = Date()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelButton, spacer, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        sender.inputAccessoryView = toolbar;
        
        datePickerView.addTarget(self, action: #selector(dateChangeHandler), for: UIControlEvents.valueChanged)
    }
    
    func cancelButtonTapped() {
        birthdayInput.resignFirstResponder()
    }
    
    func doneButtonTapped(sender: UIBarButtonItem) {
        birthdayInput.resignFirstResponder()
        dateChangeHandler(sender: (birthdayInput.inputView as! UIDatePicker))
    }
    
    func dateChangeHandler(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-YYYY"
        dateTextField.text = dateFormatter.string(from: sender.date)
        self.newGiftee!.birthdate = sender.date as NSDate
    }

}
