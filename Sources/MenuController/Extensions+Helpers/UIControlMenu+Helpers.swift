//
//  UIControlMenu+Helpers.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

extension UIControlMenuController {
    internal func commonInit() {
        setupTargetActions()
        setupTableView()
    }
    private func setupTargetActions() {
        subview.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
    }
    @objc private func didTapCancelButton() {
        dismiss(animated: true, completion: nil)
    }
}
