//
//  UIControlMenuViewController.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

internal class UIControlMenuController: UIViewController {
    internal let actions:[UIControlMenuAction]
    private(set) var subview:UIControlMenuView
    internal var isScrolling:Bool = false
    required init(headerView:UIView? = nil, headerHeight:CGFloat = 54.0, actions:[UIControlMenuAction]) {
        subview = UIControlMenuView(headerView: headerView, headerHeight: headerHeight)
        self.actions = actions
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        view.addSubview(subview)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        subview.frame = view.bounds
    }
}
