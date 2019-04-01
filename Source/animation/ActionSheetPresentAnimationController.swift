//
//  ActionSheetPresentAnimationController.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 27/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

final class ActionSheetPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) as? ActionSheet else { return }
        
        toVC.view.frame = UIScreen.main.bounds
        transitionContext.containerView.addSubview(toVC.view)
        
        let backgroundView = toVC.backgroundView
        backgroundView.alpha = 0
        
        let footerView = toVC.bottomContainerView
        footerView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.size.height)
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            backgroundView.alpha = 1
            footerView.transform = .identity
        }, completion: { (finished) in
            transitionContext.completeTransition(finished)
        })
    }
}
