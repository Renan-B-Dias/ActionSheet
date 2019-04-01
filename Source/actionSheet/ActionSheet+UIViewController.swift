//
//  ActionSheet+UIViewController.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 01/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

public extension ActionSheet {
    
    /**
     Initialize ActionSheet with a UIViewController to be used as it's custom view.
     - parameter customViewController: Custom UIViewController to be used as the actionSheet's view.
     */
    convenience init(customViewController: UIViewController) {
        self.init()
        self.customViewController = customViewController
    }
}

internal extension ActionSheet {
    
    /**
     Add the custom viewController's view on actionSheet's bomttomContainerView.
     */
    func addCustomViewController() {
        
        guard let customViewController = customViewController else {
            assertionFailure("Custom viewController not provided")
            return
        }
        
        customViewController.willMove(toParent: self)
        addChild(customViewController)
        customViewController.didMove(toParent: self)
        
        guard let customViewControllerView = customViewController.view else {
            assertionFailure("ViewController's view is nil")
            return
        }
        
        bottomContainerView.addSubview(customViewControllerView)
        customViewControllerView.snapToEdgesOf(view: bottomContainerView)
    }
}
