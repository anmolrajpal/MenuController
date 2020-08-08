//
//  UIControlMenuView.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

class UIControlMenuView: UIView {
    
    private let customHeaderView:UIView?
    private let headerHeight:CGFloat
    
    private func commonInit() {
        backgroundColor = .clear
        
        addSubview(blurredEffectView)
        blurredEffectView.frame = bounds

        
        addSubview(tableView)
        tableView.frame = bounds
        
        if let headerView = customHeaderView {
            headerContainerView.addSubview(headerView)
            headerView.translatesAutoresizingMaskIntoConstraints = false
            headerView.topAnchor.constraint(equalTo: headerContainerView.topAnchor).isActive = true
            headerView.leftAnchor.constraint(equalTo: headerContainerView.leftAnchor).isActive = true
            headerView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor).isActive = true
            headerView.rightAnchor.constraint(equalTo: headerContainerView.rightAnchor).isActive = true
        }
        
        
        topContainerView.addSubview(topContainerBlurredEffectView)
        topContainerBlurredEffectView.frame = topContainerView.bounds

        
        topContainerView.addSubview(cancelButton)
        cancelButton.rightAnchor.constraint(equalTo: topContainerView.rightAnchor, constant: -16).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: topContainerView.centerYAnchor).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        topContainerView.addSubview(headerContainerView)
        headerContainerView.topAnchor.constraint(equalTo: topContainerView.topAnchor).isActive = true
        headerContainerView.leftAnchor.constraint(equalTo: topContainerView.leftAnchor, constant: 16).isActive = true
        headerContainerView.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        headerContainerView.rightAnchor.constraint(equalTo: cancelButton.leftAnchor, constant: -8).isActive = true
        
        
        topContainerView.addSubview(headerLine)
        headerLine.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        headerLine.leftAnchor.constraint(equalTo: topContainerView.leftAnchor).isActive = true
        headerLine.rightAnchor.constraint(equalTo: topContainerView.rightAnchor).isActive = true
        headerLine.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
        
        addSubview(topContainerView)
        topContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topContainerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topContainerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        
    }
    
    
    
    //MARK: - View Constructors
    
    lazy var topContainerBlurredEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        blurEffectView.alpha = 0
        return blurEffectView
    }()
    private lazy var blurredEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.backgroundColor = UIColor.systemGray4.withAlphaComponent(0.88)
        return blurEffectView
    }()
    private let headerLine:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        return view
    }()
    private lazy var topContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var headerContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: UITableView.Style.insetGrouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.bounces = true
        tv.alwaysBounceVertical = true
        tv.clipsToBounds = true
        tv.showsHorizontalScrollIndicator = false
        tv.showsVerticalScrollIndicator = false
        tv.tableFooterView = UIView(frame: CGRect.zero)
        tv.contentInset = UIEdgeInsets(top: 35, left: 0, bottom: 24, right: 0)
        tv.sectionHeaderHeight = .leastNonzeroMagnitude
        tv.sectionFooterHeight = .leastNonzeroMagnitude
        tv.rowHeight = 50.0
        tv.separatorStyle = .none
        return tv
    }()
    
    lazy var cancelButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "multiply.circle.fill", withConfiguration: UIImage.SymbolConfiguration(textStyle: .title3)), for: .normal)
        button.tintColor = UIColor.systemGray.withAlphaComponent(0.4)
        return button
    }()
    
    
    
    
    
    
    //MARK: - Lifecycle
    
    required init(headerView: UIView?, headerHeight: CGFloat) {
        self.customHeaderView = headerView
        self.headerHeight = headerHeight
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = bounds
        blurredEffectView.frame = bounds
        topContainerBlurredEffectView.frame = topContainerView.bounds
    }
}
