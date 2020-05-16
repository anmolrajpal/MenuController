//
//  SceneDelegate.swift
//  Menu Conroller Demo
//
//  Created by Anmol Rajpal on 14/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.windowScene = windowScene
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}

