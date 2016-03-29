//
//  ViewController.swift
//  Genoise
//
//  Created by alariju on 03/29/2016.
//  Copyright (c) 2016 alariju. All rights reserved.
//

import UIKit
import Genoise

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Genoise.initializeWithApplicationId("1052352392")
        Genoise.isOutdated { (isOutdated, text) in
            if isOutdated {
                print("Is Outdated!")
                print(text)
            } else {
                print("Is updated")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

