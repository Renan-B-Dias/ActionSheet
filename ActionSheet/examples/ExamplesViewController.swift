//
//  ExamplesViewController.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 22/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

class ExamplesViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.snapToEdgesOf(view: view)
        
        // --'
        view.translatesAutoresizingMaskIntoConstraints = true
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: SimpleTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: SimpleTableViewCell.nibName)
    }
}

extension ExamplesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: SimpleTableViewCell.nibName, for: indexPath) as? SimpleTableViewCell {
            
            switch indexPath.row {
            case 0:
                cell.exampleLable.text = "Example with Custom UIViewController"
            case 1:
                cell.exampleLable.text = "Example with Custom UIView"
                
            default:
                break
            }
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ExamplesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let customViewController = CustomViewController()
            
            let actionSheet = ActionSheet(customViewController: customViewController)
            actionSheet.isDismissableOnOutsideTap = true
            self.present(actionSheet, animated: true)
            
        case 1:
            let customView = CustomView.loadNibName()
            customView.backgroundColor = .blue
            
            let actionSheet = ActionSheet(customView: customView)
            actionSheet.isDismissableOnOutsideTap = true
            self.present(actionSheet, animated: true)
            
        default:
            break
        }
    }
}
