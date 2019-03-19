//
//  UIColorExtension.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 22/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

internal extension UIColor {
    
    static func blackWith(alpha: CGFloat) -> UIColor {
        return UIColor(white: 0, alpha: alpha)
    }
    
    static var blueish: UIColor {
        return UIColor(red: 88/255, green: 220/255, blue: 213/255, alpha: 1)
    }
}
