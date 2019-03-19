//
//  ActionSheet.swift
//  ActionSheet
//
//  Created by Renan Benatti Dias on 22/02/19.
//  Copyright © 2019 Renan Benatti Dias. All rights reserved.
//

import UIKit

public final class ActionSheet: UIViewController {
    
    private var bottomContainerViewConstraints: [NSLayoutConstraint] = []
    
    private let transitioningManager = ActionSheetTransitioningManager()
    
    /**
     Grayish/clearish backgroundView.
     */
    internal let backgroundView = UIView()
    
    /**
     View that contains the actionSheet's custom view.
     */
    internal let bottomContainerView = UIView()
    
    // MARK: - Custom user's view
    internal var customViewController: UIViewController?
    internal var customView: UIView?
    
    public var dismissCallback: (() -> Void)?
    public var isDismissableOnOutsideTap: Bool = false
    public var backgroundViewColor: UIColor = UIColor.blackWith(alpha: 0.5)
    
    internal init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
        transitioningDelegate = transitioningManager
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func loadView() {
        super.loadView()
        addContainerViews()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        applyLayout()
        handleCustomView()
        addTapOutsideGesture()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.deactivate(self.bottomContainerViewConstraints)
        
        bottomContainerView.removeConstraints(self.bottomContainerViewConstraints)
        
        self.bottomContainerViewConstraints = bottomContainerView.snapToBottomEdgeOf(view: view)
    }
    
    deinit {
        print("dealloc ---> \(String(describing: ActionSheet.self))")
    }
}

private extension ActionSheet {
    
    func applyLayout() {
        backgroundView.backgroundColor = backgroundViewColor
        view.backgroundColor = .clear
    }
}

private extension ActionSheet {
    
    private func addTapOutsideGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOutsideBottomContainerView))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didTapOutsideBottomContainerView() {
        if isDismissableOnOutsideTap {
            self.dismiss(animated: true)
            dismissCallback?()
        }
    }
}

private extension ActionSheet {
    
    func addContainerViews() {
        view.addSubview(backgroundView)
        view.addSubview(bottomContainerView)
        
        backgroundView.snapToEdgesOf(view: view)
        
        // MARK: - Huh....
        view.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func handleCustomView() {
        if let _ = customViewController {
            addCustomViewController()
        } else {
            addCustomView()
        }
    }
}
