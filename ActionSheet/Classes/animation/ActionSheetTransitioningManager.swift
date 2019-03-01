//
//  ActionSheetTransitioningManager.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 27/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

final class ActionSheetTransitioningManager: NSObject, UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionSheetPresentAnimatedTransitioning()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ActionSheetDismissAnimatedTransitioning()
    }
}
