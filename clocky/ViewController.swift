//
//  ViewController.swift
//  clocky
//
//  Created by Graeme on 3/3/15.
//  Copyright (c) 2015 Graeme. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let clockface = Clockface()
    
    let SCREEN_PADDING:CGFloat = 20 // set this to change the margin around the clock
    let GESTURE_FACTOR:CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(clockface)
        self.addConstraints()
        view.backgroundColor = UIColor(hue: 0, saturation: 1, brightness: 0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addConstraints () {
        clockface.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        view.addConstraint(NSLayoutConstraint(item: clockface, attribute: .Height, relatedBy: .LessThanOrEqual, toItem: view, attribute: .Width, multiplier: 1, constant: (0 - SCREEN_PADDING * 2)))
        view.addConstraint(NSLayoutConstraint(item: clockface, attribute: .Width, relatedBy: .LessThanOrEqual, toItem: view, attribute: .Height, multiplier: 1, constant: (0 - SCREEN_PADDING * 2)))
        

        let widthConstraint = NSLayoutConstraint(item: clockface, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: (0 - SCREEN_PADDING * 2))
        let heightConstraint = NSLayoutConstraint(item: clockface, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: (0 - SCREEN_PADDING * 2))
        widthConstraint.priority -= 1
        heightConstraint.priority -= 1
        view.addConstraints([widthConstraint, heightConstraint])
        
        view.addConstraint(NSLayoutConstraint(item: clockface, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: clockface, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0))

    }


}

