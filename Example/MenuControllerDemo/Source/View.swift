//
//  View.swift
//  Menu Conroller Demo
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit
import MenuController

extension ViewController {
    internal func commonInit() {
        view.backgroundColor = UIColor.systemPink.withAlphaComponent(0.6)
        
        let label = UILabel()
        label.text = "Recreating iOS 13 Modal Control Menu"
        label.textColor = .white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive  = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        
        let view3 = UIView()
        view3.backgroundColor = UIColor.systemGreen
        view3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view3)
        view3.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -30).isActive = true
        view3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        view3.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        view3.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        
        let view4 = UIView()
        view4.backgroundColor = UIColor.systemOrange
        view4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view4)
        view4.centerYAnchor.constraint(equalTo: view3.centerYAnchor).isActive = true
        view4.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 30).isActive = true
        view4.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        view4.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        let view1 = UIView()
        view1.backgroundColor = UIColor.systemBlue
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        view1.bottomAnchor.constraint(equalTo: view3.topAnchor, constant: -40).isActive = true
        view1.leftAnchor.constraint(equalTo: view3.leftAnchor, constant: 30).isActive = true
        view1.rightAnchor.constraint(equalTo: view3.rightAnchor, constant: -50).isActive = true
        view1.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.systemRed
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        view2.bottomAnchor.constraint(equalTo: view4.topAnchor, constant: -20).isActive = true
        view2.leftAnchor.constraint(equalTo: view4.leftAnchor, constant: -15).isActive = true
        view2.rightAnchor.constraint(equalTo: view4.rightAnchor, constant: -50).isActive = true
        view2.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        
        let button = UIButton(type: .system)
        view.addSubview(button)
        button.setTitle("Show", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        button.backgroundColor = UIColor.white
        button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 50, bottom: 12, right: 50)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.addTarget(self, action: #selector(showMenu), for: .touchUpInside)
        
        
        
        
        view.addSubview(resultLabel)
        resultLabel.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        let view5 = UIView()
        view5.backgroundColor = UIColor.systemIndigo
        view5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view5)
        view5.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30).isActive = true
        view5.leftAnchor.constraint(equalTo: view3.leftAnchor, constant: 30).isActive = true
        view5.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -50).isActive = true
        view5.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        
        
        let view6 = UIView()
        view6.backgroundColor = UIColor.systemPurple
        view6.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view6)
        view6.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 50).isActive = true
        view6.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        view6.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -27).isActive = true
        view6.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    
    
    
    
    @objc private func showMenu() {
        let actions:[UIControlMenuAction] = [
            UIControlMenuAction(title: "Action 1", image: UIImage(systemName: "paperplane")!, handler: { _ in self.resultLabel.text = "Handling Action - 1" }),
            UIControlMenuAction(title: "Action 2", image: UIImage(systemName: "wifi")!, handler: { _ in self.resultLabel.text = "Handling Action - 2" }),
            UIControlMenuAction(title: "Action 3", image: UIImage(systemName: "ellipsis")!, handler: { _ in self.resultLabel.text = "Handling Action - 3" }),
            UIControlMenuAction(title: "Action 4", image: UIImage(systemName: "person")!, handler: { _ in self.resultLabel.text = "Handling Action - 4" }),
            UIControlMenuAction(title: "Action 5", image: UIImage(systemName: "largecircle.fill.circle")!, handler: { _ in self.resultLabel.text = "Handling Action - 5" }),
            UIControlMenuAction(title: "Action 6", image: UIImage(systemName: "arrow.up.right.square")!, handler: { _ in self.resultLabel.text = "Handling Action - 6" }),
            UIControlMenuAction(title: "Action 7", image: UIImage(systemName: "trash.fill")!, handler: { _ in self.resultLabel.text = "Handling Action - 7" })
        ]
        let vc = MenuController(actions: actions)
        present(vc, animated: true, completion: nil)
    }
}
