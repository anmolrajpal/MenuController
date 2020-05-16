//
//  UIControlMenu+TableViewHelpers.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

extension UIControlMenuController {
    internal func setupTableView() {
        subview.tableView.register(UIControlMenuCell.self, forCellReuseIdentifier: NSStringFromClass(UIControlMenuCell.self))
        subview.tableView.delegate = self
        subview.tableView.dataSource = self
    }
    private func execute(_ action:UIControlMenuAction, with handler: @escaping UIControlMenuActionHandler) {
        self.dismiss(animated: true) { handler(action) }
    }
}

extension UIControlMenuController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        actions.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UIControlMenuCell.self), for: indexPath) as! UIControlMenuCell
        let action = actions[indexPath.section]
        let parameters = UIControlMenuCell.Parameters(title: action.title, image: action.image)
        cell.parameters = parameters
        
        cell.backgroundColor = .clear
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = UIColor.systemGray4
        cell.selectedBackgroundView  = selectedBackgroundView
        return cell
    }
}

extension UIControlMenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let action = actions[indexPath.section]
        let handler = action.handler
        execute(action, with: handler)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat.leastNonzeroMagnitude
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        8
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = self.subview.tableView.contentOffset.y + (self.subview.topContainerBlurredEffectView.frame.height / 1.6) - 6
        if offset > 9 {
            let alpha = (1 / offset) * (offset / 4) * (offset * 0.13)
            self.subview.topContainerBlurredEffectView.alpha = alpha
        } else if offset <= 9 {
            self.subview.topContainerBlurredEffectView.alpha = 0
        }
    }
}
