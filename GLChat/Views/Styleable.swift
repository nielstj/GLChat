//
//  Styleable.swift
//  GLChat
//
//  Created by Daniel on 21/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation


public protocol ViewStyleProviderType {
    var cornerRadius: CGFloat { get set }
    var backgroundColor: UIColor { get set }
}

public protocol TextStyleProviderType: ViewStyleProviderType {
    var font: UIFont { get set }
    var color: UIColor { get set }
}

public protocol ViewStyleableType {
    var backgroundColor: UIColor? { get set }
    var layer: CALayer { get }
}

public protocol TextStylableType: ViewStyleableType {
    var font: UIFont! { get set }
    var textColor: UIColor! { get set }
}

public extension ViewStyleableType {
    public mutating func applyStyle(_ style: ViewStyleProviderType) {
        self.layer.cornerRadius = style.cornerRadius
        self.layer.masksToBounds = true
        self.backgroundColor = style.backgroundColor
    }
}

public extension TextStylableType {
    public mutating func applyStyle(_ style: TextStyleProviderType) {
        self.layer.cornerRadius = style.cornerRadius
        self.layer.masksToBounds = true
        self.backgroundColor = style.backgroundColor
        self.textColor = style.color
        self.font = style.font
    }
}

extension UILabel: TextStylableType {}
extension UIView: ViewStyleableType {}


