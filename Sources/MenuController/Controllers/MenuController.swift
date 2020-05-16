//
//  MenuController.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit
import InteractiveModal

public class MenuController:InteractiveModalViewController {
    public required init(actions:[UIControlMenuAction]) {
        super.init(controller: UIControlMenuController(actions: actions))
    }
}
