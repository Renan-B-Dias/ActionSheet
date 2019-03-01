//
//  ActionSheetDismissAnimatedTransitioning.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 27/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

final class ActionSheetDismissAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? ActionSheet else { return }
        
        let backgroundView = fromVC.backgroundView
        
        let footerView = fromVC.bottomContainerView
        let duration = transitionDuration(using: transitionContext)

        UIView.animate(withDuration: duration, animations: {
            backgroundView.alpha = 0
            footerView.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.size.height)
        }, completion: { (finished) in
            transitionContext.completeTransition(finished)
        })
    }
}
