//
//  ChatAvatar.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation
import UIKit


public protocol AvatarType {
    var name: String { get }
    var image: UIImage? { get }
    var color: UIColor { get }
}

public struct Avatar: AvatarType {
    public var name: String
    public var image: UIImage?
    public var color: UIColor
    
    public init(name: String, image: UIImage?, color: UIColor) {
        self.name = name
        self.image = image
        self.color = color
    }
    
}
