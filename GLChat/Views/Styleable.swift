//
//  Styleable.swift
//  GLChat
//
//  Created by Daniel on 21/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import UIKit

public protocol Styleable {}
extension UIView: Styleable {}

public typealias Style<T> = (T) -> Void
extension Styleable {
    public func apply(style: Style<Self>) {
        style(self)
    }
    public func apply(styles: Style<Self>...) {
        styles.forEach(apply(style:))
    }
    public func apply(styles: [Style<Self>]) {
        styles.forEach(apply(style:))
    }
    public func styled(using styles: Style<Self>...) -> Self {
        styles.forEach(apply(style:))
        return self
    }
    public func styled(using styles: [Style<Self>]) -> Self {
        apply(styles: styles)
        return self
    }
    public func with(_ style: Style<Self>) -> Self {
        apply(style: style)
        return self
    }
}





//public struct UIViewStyle<T: UIView> {
//
//    public let styling: (T) -> Void
//
//    static public func compose(_ styles: UIViewStyle<T>...) -> UIViewStyle<T> {
//        return UIViewStyle { view in
//            for style in styles {
//                style.styling(view)
//            }
//        }
//    }
//
//    public func composing(with other: UIViewStyle<T>) -> UIViewStyle<T> {
//        return UIViewStyle { view in
//            self.styling(view)
//            other.styling(view)
//        }
//    }
//
//    public func composing(with otherStyling: @escaping (T) -> Void) -> UIViewStyle<T> {
//        return self.composing(with: UIViewStyle(styling: otherStyling))
//    }
//
//    public func apply(to view: T) {
//        styling(view)
//    }
//
//    public func apply(to views: T...) {
//        for view in views {
//            styling(view)
//        }
//    }
//}



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
//    func applyStyle(_ style: ViewStyleProviderType)
}

public protocol TextStylableType: ViewStyleableType {
    var font: UIFont! { get set }
    var textColor: UIColor! { get set }
  //  func applyStyle(_ style: TextStyleProviderType)
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
        self.backgroundColor = style.backgroundColor
        self.textColor = style.color
        self.font = style.font
    }
}

extension UILabel: TextStylableType {}
extension UIView: ViewStyleableType {}


