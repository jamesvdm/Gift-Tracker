//
//  AddGifteeViewController.swift
//  Gifted
//
//  Created by James van der Moezel on 21/8/17.
//  Copyright © 2017 James van der Moezel. All rights reserved.
//

import UIKit

class AddGifteeViewController: UIViewController {

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
    }

        //Save to core data
        func rightButtonAction(_ sender: UIBarButtonItem) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let person = Person(context: context)
        
        person.name = gifteeNameField.text!
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    

}
