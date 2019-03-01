//
//  ActionSheet.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 22/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

public final class ActionSheet: UIViewController {
    
    // MARK: - Views
    internal let backgroundView = UIView()
    internal let bottomContainerView = UIView()
    
    private var customViewController: UIViewController?
    private var customView: UIView?
    
//    private let viewsConstraintGroup = ConstraintGroup()
    private var bottomContainerViewConstraints: [NSLayoutConstraint] = []
    
    // MARK: - Appearance
    public var backgroundColor: UIColor = .white
    
    private let transitioningManager = ActionSheetTransitioningManager()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
        transitioningDelegate = transitioningManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func loadView() {
        super.loadView()
        addBottomContainerView()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        bottomContainerView.backgroundColor = .yellow
        backgroundView.backgroundColor = UIColor.blackWith(alpha: 0.5)
        
        if let _ = customViewController {
            addFooterViewController()
        } else {
            addFooterView()
        }
        
        addTapOutsideGesture()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.deactivate(self.bottomContainerViewConstraints)
        
        bottomContainerView.removeConstraints(self.bottomContainerViewConstraints)
        
        let bottomContainerViewConstraints = [
            bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomContainerView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(bottomContainerViewConstraints)
        
        self.bottomContainerViewConstraints = bottomContainerViewConstraints
    }
    
    deinit {
        print("Dealloc ---> \(String(describing: ActionSheet.self))")
    }
}

// UIView
public extension ActionSheet {
    
    convenience init(customView: UIView) {
        self.init()
        self.customView = customView
    }
}

// UIViewController
public extension ActionSheet {
    
    public convenience init(customViewController: UIViewController) {
        self.init()
        self.customViewController = customViewController
    }
}

private extension ActionSheet {
    
    private func addTapOutsideGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector(didTapOutsideActionSheet))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapOutsideActionSheet() {
        self.dismiss(animated: true)
    }
}

private extension ActionSheet {
    
    func addBottomContainerView() {
        view.addSubview(backgroundView)
        view.addSubview(bottomContainerView)
        
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    func addFooterViewController() {
        
        guard let customViewController = customViewController else {
            assertionFailure("Custom view not provided")
            return
        }
        
        customViewController.willMove(toParent: self)
        addChild(customViewController)
        customViewController.didMove(toParent: self)
        
        guard let customViewControllerView = customViewController.view else {
            assertionFailure("ViewController's view is nil")
            return
        }
        
        customViewControllerView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomContainerView.addSubview(customViewControllerView)
        
        let constraints = [
            customViewControllerView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor),
            customViewControllerView.leftAnchor.constraint(equalTo: bottomContainerView.leftAnchor),
            customViewControllerView.rightAnchor.constraint(equalTo: bottomContainerView.rightAnchor),
            customViewControllerView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}

private extension ActionSheet {
    
    func addFooterView() {
        guard let customView = customView else {
            assertionFailure("View not provided")
            return
        }
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomContainerView.addSubview(customView)
        
        let constraints = [
            customView.topAnchor.constraint(equalTo: bottomContainerView.topAnchor),
            customView.leftAnchor.constraint(equalTo: bottomContainerView.leftAnchor),
            customView.rightAnchor.constraint(equalTo: bottomContainerView.rightAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor),
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
