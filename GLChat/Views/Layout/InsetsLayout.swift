//
//  InsetsLayout.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import UIKit

public struct InsetLayout<Child: Layout>: Layout {
    public typealias Content = Child.Content
    var child: Child
    var insets: UIEdgeInsets
    
    fileprivate init(child: Child, insets: UIEdgeInsets) {
        self.child = child
        self.insets = insets
    }
    
    mutating public func layout(in rect: CGRect) {
        let rect = UIEdgeInsetsInsetRect(rect, insets)
        child.layout(in: rect)
    }
    
    public var contents: [Child.Content] {
        return child.contents
    }
}

public extension Layout {
    public func withInsets(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> InsetLayout<Self> {
        let insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        
        return withInsets(insets)
    }
    
    public func withInsets(all insets: CGFloat) -> InsetLayout<Self> {
        return withInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    public func withInsets(_ insets: UIEdgeInsets) -> InsetLayout<Self> {
        return InsetLayout(child: self, insets: insets)
    }
}
