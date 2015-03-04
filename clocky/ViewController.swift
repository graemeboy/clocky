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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(clockface)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

