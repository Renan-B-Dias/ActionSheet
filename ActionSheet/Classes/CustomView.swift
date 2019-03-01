//
//  CustomView.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 27/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CustomView {
    
    static func loadNibName() -> CustomView {
        let view = UINib(nibName: "CustomView", bundle: nil).instantiate(withOwner: nil).first as! CustomView
        return view
    }
}
