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
        datePickerView.addTarget(self, action: #selector(dateChangeHandler), for: UIControlEvents.valueChanged)
    }
    
    func dateChangeHandler(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-YYYY"
        dateTextField.text = dateFormatter.string(from: sender.date)
        self.newGiftee!.birthdate = sender.date as NSDate
    }

}
