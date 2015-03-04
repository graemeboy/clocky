//
//  Clockface.swift
//  clocky
//
//  Created by Graeme on 3/3/15.
//  Copyright (c) 2015 Graeme. All rights reserved.
//

import UIKit

class Clockface: UIView {
    
    // Create a list of all the lines of the clockface
    
    let linesOfClockface = [
        "ITLISBFAMPM",
        "ACQUARTERDC",
        "TWENTYFIVEX",
        "HALFBTENFTO",
        "PASTERUNINE",
        "ONESIXTHREE",
        "FOURFIVETWO",
        "EIGHTELEVEN",
        "SEVENTWELVE",
        "TENSEOCLOCK",
    ]
    
    // Array of clock labels for the interface
    let clockLabels = [ClockLabel]()
    
    override init()
    {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScreen();
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreen();
    }
    
    func setupScreen () {
        var x = 0
        var y = 0
        
        for line in linesOfClockface {
            x = 0
            for letter in line {
                // Initialize a ClockLabel
                var label = self.createClockLabel(letter, x, y)
                self.clockLabels.append(label)
                x += 1
            }
            y += 1
        }
    }
    
    func createClockLabel(text: string, xPos: int, yPos: int): ClockLabel {
        var label = ClockLabel()
        println("Creating label for " + text)
        return label
    }
    
}
