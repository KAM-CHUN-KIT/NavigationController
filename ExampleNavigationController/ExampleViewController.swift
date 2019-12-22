//
//  ExampleViewController.swift
//  ExampleNavigationController
//
//  Created by Kam on 23/6/2019.
//  Copyright © 2019 Kam. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let labelTop: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content 1"
        return label
    }()
    
    private let labelMid: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content 2"
        return label
    }()
    
    private let labelBottom: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content 3"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isTranslucent = false
        if let nav = self.navigationController as? NavigationController {
            nav.setBackgroundColor(.gray)
        }
        
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height*2)
        self.view.addSubview(self.scrollView)
        
        scrollView.addSubview(labelTop)
        scrollView.addSubview(labelMid)
        scrollView.addSubview(labelBottom)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: self.scrollView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.scrollView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.scrollView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.scrollView, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.labelTop, attribute: .top, relatedBy: .equal, toItem: self.scrollView, attribute: .top, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint.init(item: self.labelTop, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.labelMid, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.labelMid, attribute: .centerY, relatedBy: .equal, toItem: self.scrollView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.labelBottom, attribute: .centerY, relatedBy: .equal, toItem: self.scrollView, attribute: .centerY, multiplier: 2.0, constant: 0.0),
            NSLayoutConstraint.init(item: self.labelBottom, attribute: .centerX, relatedBy: .equal, toItem: self.scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        ])
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let nav = self.navigationController as? NavigationController {
            nav.setNavigationBarVisibility(offset: 100)
        }
    }

}

extension ExampleViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let nav = self.navigationController as? NavigationController {
            let visibility = scrollView.contentOffset.y
            nav.setNavigationBarVisibility(offset: visibility)
        }
    }
}
