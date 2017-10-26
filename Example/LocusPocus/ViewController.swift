//
//  ViewController.swift
//  LocusPocus
//
//  Created by PoltoraIvana on 10/03/2017.
//  Copyright (c) 2017 PoltoraIvana. All rights reserved.
//

import UIKit
import CactusLocalization

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let testString = "test.example".localized()
        print(testString)
    }
}
