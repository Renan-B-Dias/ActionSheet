//
//  UIViewExtension.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 28/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

internal extension UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}
