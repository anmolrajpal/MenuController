//
//  ViewController.swift
//  Menu Conroller Demo
//
//  Created by Anmol Rajpal on 14/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    lazy var resultLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = .systemGreen
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
















