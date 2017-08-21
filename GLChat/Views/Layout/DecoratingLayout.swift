//
//  DecoratingLayout.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import CoreGraphics

public struct DecoratingLayout<ChildContent: Layout, Decoration: Layout>: Layout
    where ChildContent.Content == Decoration.Content {
    
    public typealias Content = ChildContent.Content
    
    var content: InsetLayout<ChildContent>
    var decoration: InsetLayout<Decoration>
    var ratio: CGFloat
    
    public init(content: ChildContent, decoration: Decoration, ratio: CGFloat = 10.0, inset: CGFloat = 5.0) {
        self.content = content.withInsets(all: inset)
        self.decoration = decoration.withInsets(top: inset, left: inset, bottom: inset, right: 0.0)
        self.ratio = ratio
    }
    
    mutating public func layout(in rect: CGRect) {
        let contentRect = self.contentRect(in: rect)
        let decorationRect = self.decorationRect(in: rect)
        content.layout(in: contentRect)
        decoration.layout(in: decorationRect)
    }
    
    private func contentRect(in rect: CGRect) -> CGRect {
        var dstRect = rect
        dstRect.origin.x = rect.size.width/ratio
        dstRect.size.width *= (ratio-3)/ratio 
        return dstRect
    }
    
    private func decorationRect(in rect: CGRect) -> CGRect {
        var dstRect = rect
        dstRect.size.width /= ratio
        return dstRect
    }
    
    public var contents: [Content] {
        return decoration.contents + content.contents
    }    
    
}
