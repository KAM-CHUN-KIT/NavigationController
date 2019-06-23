//
//  ExampleViewController.swift
//  ExampleNavigationController
//
//  Created by Kam on 23/6/2019.
//  Copyright © 2019 Kam. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let slider = UISlider()
        slider.frame = CGRect(x: 0, y: 0, width: self.view.frame.width-40, height: 35)
        slider.center = self.view.center
        
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .black
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.setValue(100, animated: false)
        
        slider.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
        
        self.view.addSubview(slider)
        
        
        let buttonBlue = UIButton(frame: CGRect(x: 40, y: 160, width: 60, height: 30))
        buttonBlue.tag = 0
        buttonBlue.titleLabel?.text = "Blue"
        buttonBlue.titleLabel?.textColor = UIColor.white
        buttonBlue.backgroundColor = UIColor.blue
        buttonBlue.addTarget(self, action: #selector(setColor(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonBlue)
        
        
        let buttonGreen = UIButton(frame: CGRect(x: 120, y: 160, width: 60, height: 30))
        buttonGreen.tag = 1
        buttonGreen.titleLabel?.text = "Green"
        buttonGreen.titleLabel?.textColor = UIColor.white
        buttonGreen.backgroundColor = UIColor.green
        buttonGreen.addTarget(self, action: #selector(setColor(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonGreen)
        
        let buttonBlack = UIButton(frame: CGRect(x: 200, y: 160, width: 60, height: 30))
        buttonBlack.tag = 2
        buttonBlack.titleLabel?.text = "Black"
        buttonBlack.titleLabel?.textColor = UIColor.white
        buttonBlack.backgroundColor = UIColor.black
        buttonBlack.addTarget(self, action: #selector(setColor(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonBlack)
        
        let buttonRed = UIButton(frame: CGRect(x: 280, y: 160, width: 60, height: 30))
        buttonRed.tag = 3
        buttonRed.titleLabel?.text = "Red"
        buttonRed.titleLabel?.textColor = UIColor.white
        buttonRed.backgroundColor = UIColor.red
        buttonRed.addTarget(self, action: #selector(setColor(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonRed)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let nav = self.navigationController as? NavigationController {
            nav.setBackgroundColor(UIColor.black)
            nav.setNavigationBarVisibility(offset: 100)
//            nav.navigationBar.shadowImage = UIImage()
        }
    }
    
    @objc private func valueChanged(_ sender: UISlider) {
        if let nav = self.navigationController as? NavigationController {
            nav.setNavigationBarVisibility(offset: CGFloat(sender.value))
        }
    }
    
    @objc private func setColor(_ sender: UIButton) {
        if let nav = self.navigationController as? NavigationController {
            var color: UIColor?
            switch sender.tag {
            case 0:
                color = UIColor.blue
            case 1:
                color = UIColor.green
            case 2:
                color = UIColor.black
            case 3:
                color = UIColor.red
            default:
                color = UIColor.white
            }
            nav.setBackgroundColor(color!)
        }
    }

}
