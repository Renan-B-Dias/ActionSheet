//
//  CustomViewController.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 26/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyLayout()
    }
    
    private func applyLayout() {
        view.backgroundColor = .blueish
        
        emailImageView.image = #imageLiteral(resourceName: "ic_email")
        emailImageView.tintColor = .white
        emailImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.text = "THANK YOU!"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        
        textLabel.text = "We just sent you a confirmation email. Check out your inbox"
        textLabel.textColor = .white
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        textLabel.font = UIFont.systemFont(ofSize: 14)
    }
}
