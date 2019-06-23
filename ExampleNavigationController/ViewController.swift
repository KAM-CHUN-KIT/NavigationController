//
//  ViewController.swift
//  ExampleNavigationController
//
//  Created by Kam on 23/6/2019.
//  Copyright © 2019 Kam. All rights reserved.
//

import UIKit

class ViewController: NavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.navigationBar.isTranslucent = false
        self.pushViewController(ExampleViewController(), animated: false)
    }


}

