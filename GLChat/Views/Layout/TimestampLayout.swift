//
//  TimestampLayout.swift
//  GLChat
//
//  Created by Daniel on 21/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import CoreGraphics

public struct TimestampLayout<Child: Layout>: Layout where Child.Content == UIView {
    public typealias Content = Child.Content
    var child: Child
    var timestamp: UILabel
    var alignment: NSTextAlignment
    
    fileprivate init(child: Child, date: Date, alignment: NSTextAlignment = .left) {
        self.child = child
        self.timestamp = UILabel()
        self.alignment = alignment
        timestamp.text = date.toShortTimeString()
        timestamp.textColor = UIColor.lightGray
        timestamp.font = UIFont.systemFont(ofSize: 12.0)
        timestamp.textAlignment = alignment
    }
    
    mutating public func layout(in rect: CGRect) {
//        var cw: CGFloat = rect.width
//        if let c = child.contents.first as? BubbleLabel {
//            cw = min(cw, c.bounds.width)
//        }]
        let crect = childRect(in: rect)
        child.layout(in: crect)
        timestamp.layout(in: CGRect(x: 8.0, y: rect.size.height - 20, width: rect.width - 16.0, height: 20.0))
    }
    
    private func childRect(in rect: CGRect) -> CGRect {
        var cw: CGFloat = rect.width
        if let c = child.contents.first as? BubbleLabel {
            cw = min(cw, c.bounds.width)
        }
        var newRect = CGRect(x: 0, y: 0, width: cw, height: rect.height - 20)
        if alignment == .right {
            newRect = CGRect(x: rect.width - cw, y: 0, width: cw, height: rect.height - 20)
        }
        return newRect
    }
    
    public var contents: [Child.Content] {
        let contents = child.contents + timestamp.contents
        return contents.flatMap({$0})
    }
}

public extension Layout where Content == UIView {
    public func withDate(_ date: Date, alignment: NSTextAlignment = .left) -> TimestampLayout<Self>  {
        return TimestampLayout(child: self, date: date, alignment: alignment)
    }
}

