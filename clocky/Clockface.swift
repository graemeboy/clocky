//
//  Clockface.swift
//  clocky
//
//  Created by Graeme on 3/3/15.
//  Copyright (c) 2015 Graeme. All rights reserved.
//

import UIKit

class Clockface: UIView {
    //let LABEL_COLOR = UIColor.whiteColor()
    
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
    
    let pre = "IT IS"
    let preIndexes = [0,1,3,4]
    
    let term1 = [
        "",
        "FIVE PAST ",
        "TEN PAST ",
        "A QUARTER PAST ",
        "TWENTY PAST ",
        "TWENTYFIVE PAST ",
        "HALF PAST ",
        "TWENTYFIVE TO ",
        "TWENTY TO ",
        "A QUARTER TO ",
        "TEN TO ",
        "FIVE TO "
    ]
    let term2 = [
        "TWELVE",
        "ONE",
        "TWO",
        "THREE",
        "FOUR",
        "FIVE",
        "SIX",
        "SEVEN",
        "EIGHT",
        "NINE",
        "TEN",
        "ELEVEN"
    ]
    
    // Array of clock labels for the interface
    var clockLabels = [ClockLabel]()
    
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
                var label = self.createClockLabel(letter, xPos: x, yPos: y)
                self.clockLabels.append(label)
                x += 1
            }
            y += 1
        }
        updateClockface()
    }
    
    func createClockLabel(char: Character, xPos: Int, yPos: Int) -> ClockLabel {
        var label = ClockLabel()
        self.addSubview(label)
        
        label.text = String(char)
        label.alpha = 0
        
        // Turn off automatic constraints
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let topFactor:CGFloat = 1.0 / CGFloat(linesOfClockface.count) * CGFloat(xPos)
        let leftFactor:CGFloat =  1.0 / CGFloat(countElements(linesOfClockface[0])) * CGFloat(yPos)
        
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: topFactor, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: leftFactor, constant: 0))
        
        // Set constaints
        
//         self.addConstraint(NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: widthFactor, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Right, multipler: xPos, constant: 0))
        
//        let widthFactor:CGFloat = 1.0 / CGFloat(countElements(linesOfClockface[0]))
//        let heightFactor:CGFloat = 1.0 / CGFloat(linesOfClockface.count)
        
         //Add the constraints to position and size the character to the right posistion
//        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: widthFactor, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: heightFactor, constant: 0))
        

//        self.addConstraint(NSLayoutConstraint(item: label, attribute: NSAttributeTop, relatedBy: NSLayoutRelationEqual, toItem: self, attribute: NSAttributeRight, multiplier: xPos, constant: 0.0))
//        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: xPos, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: yPos, constant: 0))
        
        return label
    }
    
    func updateClockface () {
        for label in clockLabels {
            label.turnOff()
        }
        
        self.turnOnPre()
        
        var engTime = self.getEnglishTime()
        println("eng time is " + engTime)
        var words = split(engTime) {$0 == " "}
        var numLines:Int = linesOfClockface.count

        var lastLine:Int = 0 // skip the first line
        for word in words {
            var i = 0
            for (index,line) in enumerate(linesOfClockface) {
                if index > lastLine && line.rangeOfString(word) != nil {
                    var range:Range = line.rangeOfString(word)!
                    var intIndex: Int = distance(line.startIndex, range.startIndex)
                    
                    //println("int index " + String(intIndex))
                    //println("row" + String(i))
                    
                    var labelIndex = intIndex + (countElements(line) * i)
                    
                    for i in 0...countElements(word) - 1 {
                        self.clockLabels[labelIndex + i].turnOn()
                    }
                    
                    //println("found " + word + " at " + String(labelIndex))
                    lastLine = i
                    continue
                }
                i += 1
            }
        }
    }
    
    func turnOnPre() {
        for index in preIndexes {
            self.clockLabels[index].turnOn()
        }
    }
    
    
    func getEnglishTime() -> String {
        
        var engTime:String = ""
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components((.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond), fromDate: NSDate())
        
        let hour = components.hour % 12
        let roundedMinutes = Int(floor(Float(components.minute) / 5.0))

        engTime += self.term1[roundedMinutes]
        engTime += self.term2[hour]
        
        if (roundedMinutes == 0) {
            engTime += " OCLOCK"
        }
        return engTime
    }
    
}
