//
//  BackgroundLayout.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import CoreGraphics

public struct BackgroundLayout<Background: Layout, Foreground: Layout>: Layout
    where Background.Content == Foreground.Content {
    
    public typealias Content = Background.Content
    
    var background: Background
    var foreground: Foreground
    
    mutating public func layout(in rect: CGRect) {
        background.layout(in: rect)
        foreground.layout(in: rect)
    }
    public var contents: [Content] {
        return background.contents + foreground.contents
    }
}

public extension Layout {
    public func withBackground<Background: Layout>(_ background: Background)
    -> BackgroundLayout<Background, Self> {
        return BackgroundLayout(background: background, foreground: self)
    }
}
