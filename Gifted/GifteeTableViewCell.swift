//
//  GifteeTableViewCell.swift
//  Gifted
//
//  Created by Anton Ball on 25/8/17.
//  Copyright © 2017 James van der Moezel. All rights reserved.
//

import UIKit

class GifteeTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nextDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateDate(date: Date?) {
        let formattedDate = DateFormatter()
        formattedDate.dateFormat = "MM-yyyy"
        if (date != nil) {
            self.nextDate.text = formattedDate.string(from: date!)
        }
        
    }

}
