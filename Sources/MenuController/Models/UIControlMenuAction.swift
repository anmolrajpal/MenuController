//
//  UIControlMenuAction.swift
//  Menu Conroller
//
//  Created by Anmol Rajpal on 15/05/20.
//  Copyright © 2020 Anmol Rajpal. All rights reserved.
//

import UIKit

public typealias UIControlMenuActionHandler = (UIControlMenuAction) -> Void

public class UIControlMenuAction {
    
    public var title:String
    
    public var image:UIImage
    
    private(set) var handler:UIControlMenuActionHandler
    
    public init(title:String, image:UIImage, handler: @escaping UIControlMenuActionHandler) {
        self.title = title
        self.image = image
        self.handler = handler
    }
    
}
