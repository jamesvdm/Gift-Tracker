//
//  EventInputView.swift
//  Gifted
//
//  Created by Anton Ball on 2/9/17.
//  Copyright © 2017 James van der Moezel. All rights reserved.
//

import UIKit

class EventInputView: UIView {
    
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("EventInputView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
