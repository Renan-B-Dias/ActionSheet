//
//  UIView+Constraints.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 01/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

internal extension UIView {
    
    @discardableResult func snapToEdgesOf(view: UIView) -> [NSLayoutConstraint] {
        self.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            topAnchor.constraint(equalTo: view.topAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
    
    @discardableResult func snapToBottomEdgeOf(view: UIView) -> [NSLayoutConstraint] {
        let constraints = [
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
}
