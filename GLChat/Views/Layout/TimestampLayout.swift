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
    var font: UIFont
    
    fileprivate init(child: Child, date: Date,
                     alignment: NSTextAlignment = .left,
                     font: UIFont = UIFont.systemFont(ofSize: 12)) {
        self.child = child
        self.timestamp = UILabel()
        self.alignment = alignment
        self.font = font
        timestamp.text = date.toShortTimeString()
        timestamp.textColor = UIColor.lightGray
        timestamp.font = font
        timestamp.textAlignment = alignment
    }
    
    mutating public func layout(in rect: CGRect) {
        let crect = childRect(in: rect)
        let fontPadding = font.pointSize + 8.0
        child.layout(in: crect)
        timestamp.layout(in: CGRect(x: 8.0,
                                    y: rect.size.height - fontPadding,
                                    width: rect.width - 16.0,
                                    height: fontPadding))
    }
    
    private func childRect(in rect: CGRect) -> CGRect {
        var cw: CGFloat = rect.width
        if let c = child.contents.first as? BubbleLabel {
            cw = min(cw, c.bounds.width)
        }
        var newRect = CGRect(x: 0, y: 0, width: cw, height: rect.height - 20)
        if alignment == .right {
            newRect = CGRect(x: rect.width - cw,
                             y: 0,
                             width: cw,
                             height: rect.height - 20)
        }
        return newRect
    }
    
    public var contents: [Child.Content] {
        let contents = child.contents + timestamp.contents
        return contents.flatMap({$0})
    }
}

public extension Layout where Content == UIView {
    public func withDate(_ date: Date,
                         alignment: NSTextAlignment = .left,
                         font: UIFont = UIFont.systemFont(ofSize: 12.0))
        -> TimestampLayout<Self>
    {
        return TimestampLayout(child: self, date: date, alignment: alignment)
    }
}

