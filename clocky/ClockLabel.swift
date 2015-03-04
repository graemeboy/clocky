//
//  ClockLabel.swift
//  clocky
//
//  Created by Graeme on 3/3/15.
//  Copyright (c) 2015 Graeme. All rights reserved.
//

import UIKit

class ClockLabel: UILabel {
    let fontSize = 1 // Might need to change fontsize depending on screen size
    
    override init () {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init()
    }
    
    override init(frame: CGRect) {
        super.init()
        centerText()
    }
    
    func centerText() {
        self.textAlignment = NSTextAlignment.Center
    }
}
