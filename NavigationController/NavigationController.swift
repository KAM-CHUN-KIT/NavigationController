//
//  NavigationController.swift
//  NavigationController
//
//  Created by Kam on 23/6/2019.
//  Copyright © 2019 Kam. All rights reserved.
//

import UIKit

public protocol NavigationControllerDelegate: NSObjectProtocol {
    func preferredNavigationBarVisibility() -> FadeNavigationControllerNavigationBarVisibility?
}

public enum FadeNavigationControllerNavigationBarVisibility: Int {
    case undefined = 0, // Initial value, don't set this
    system = 1, // Use System navigation bar
    hidden = 2, // Use custom navigation bar and hide it
    visible = 3 // Use custom navigation bar and show it
}

open class NavigationController: UINavigationController {

    var navigationBarVisibility: FadeNavigationControllerNavigationBarVisibility = .undefined
    var preferredNavigationBarVisibility: FadeNavigationControllerNavigationBarVisibility = .undefined
    private var backgroundColorView: UIView?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.setBackgroundColor(.white) //default white color
    }
    
    func refreshNavigationBar() {
        self.setNavigationBarVisibility(navigationBarVisibility: navigationBarVisibility)
    }
    
    func setNavigationBarVisibility(navigationBarVisibility: FadeNavigationControllerNavigationBarVisibility) {
        guard navigationBarVisibility != .undefined else {
            return
        }
        
        var alpha: CGFloat = 1.0
        if navigationBarVisibility == .hidden {
            alpha = 0.0
            self.navigationBar.shadowImage = UIImage()
        } else {
            alpha = 1.0
            self.navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
        }

        self.applyNavigationBarAlpha(alpha)
    }
    
    open func setNavigationBarVisibility(offset: CGFloat) {
        var offset = offset / 100
        if offset > 1 {
            offset = 1
        }
        self.applyNavigationBarAlpha(offset)
        self.navigationBar.shadowImage = offset > 0.95 ? UINavigationBar.appearance().shadowImage : UIImage()
    }
    
    open func setBackgroundColor(_ color: UIColor) {
        if backgroundColorView == nil {
            let navbarFrame = self.navigationBar.frame;
            backgroundColorView = UIView(frame: CGRect(x: 0, y: 0, width: Int(navbarFrame.size.width), height: Int(navbarFrame.size.height+navbarFrame.origin.y)))
            backgroundColorView?.autoresizingMask = .flexibleWidth
            if let first = self.navigationBar.subviews.first {
                first.insertSubview(backgroundColorView ?? UIView(), at: 0)
            } else {
                backgroundColorView = nil //failure to insert subview
            }
        }
        backgroundColorView?.backgroundColor = color
    }
    
    private func preferredStatusBarStyle() -> UIStatusBarStyle {
        if self.navigationBarVisibility == .hidden {
            return .lightContent;
        } else {
            return .default;
        }
    }
    
    func updateNavigationBarVisibilityForController(viewController: UIViewController, animated: Bool) {
        self.navigationBarVisibility  = .system
        
        if let navigationBarVisibility = (viewController as? NavigationControllerDelegate)?.preferredNavigationBarVisibility() {
            self.navigationBarVisibility = navigationBarVisibility
        }
        
        self.setNavigationBarVisibility(navigationBarVisibility: self.navigationBarVisibility)
        UIApplication.shared.statusBarStyle = self.preferredStatusBarStyle()
    }
    
    private func applyNavigationBarAlpha(_ alpha: CGFloat) {
        let subviews = self.navigationBar.subviews
        if let barBackgroundView = subviews.first {
            if #available(iOS 11.0, *) {
                barBackgroundView.alpha = alpha
                for view in barBackgroundView.subviews {
                    view.alpha = alpha
                }
            } else {
                barBackgroundView.alpha = alpha
            }
        }
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
}

extension NavigationController: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard !navigationController.isNavigationBarHidden else {
            return
        }
        self.updateNavigationBarVisibilityForController(viewController: viewController, animated: false)
    }
}
