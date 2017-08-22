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

