//
//  ActionSheet+UIView.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 01/03/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

public extension ActionSheet {
    
    /**
     Initialize ActionSheet with a UIView to be used as it's custom view.
     - parameter customView: Custom UIView to be used as the actionSheet's view.
     */
    convenience init(customView: UIView) {
        self.init()
        self.customView = customView
    }
}

internal extension ActionSheet {
    
    /**
     Add a custom view on actionSheet's bomttomContainerView.
     */
    func addCustomView() {
        guard let customView = customView else {
            assertionFailure("View not provided")
            return
        }
        
        bottomContainerView.addSubview(customView)
        customView.snapToEdgesOf(view: bottomContainerView)
    }
}
