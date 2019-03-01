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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "SimpleTableViewCell", bundle: nil), forCellReuseIdentifier: "SimpleTableViewCell")
    }
}

extension ExamplesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell", for: indexPath) as? SimpleTableViewCell {
            cell.exampleLable.text = "Example 1!!!"
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
            customViewController.view.backgroundColor = .red
            
            let actionSheet = ActionSheet(customViewController: customViewController)
            self.present(actionSheet, animated: true)
            
        case 1:
            let customViewController = CustomViewController()
            customViewController.view.backgroundColor = .green
            
            let actionSheet = ActionSheet(customViewController: customViewController)
            self.present(actionSheet, animated: true)
            
        case 2:
            
            let customView = CustomView.loadNibName()
            customView.backgroundColor = .green
            
            let actionSheet = ActionSheet(customView: customView)
            self.present(actionSheet, animated: true)
            
        case 3:
            let customView = CustomView.loadNibName()
            customView.backgroundColor = .blue
            
            let actionSheet = ActionSheet(customView: customView)
            self.present(actionSheet, animated: true)
            
        default:
            break
        }
    }
}
