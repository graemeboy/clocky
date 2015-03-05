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
    let offAlpha:CGFloat = 0.2
    let onAlpha:CGFloat = 1.0
    
    override init () {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        centerText()
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        centerText()
    }
    
    func centerText() {
        self.textAlignment = NSTextAlignment.Center
        self.textColor = UIColor.whiteColor()
    }
    
    func turnOff() {
        self.alpha = self.offAlpha
    }
    
    func turnOn() {
        self.alpha = self.onAlpha
    }
}
