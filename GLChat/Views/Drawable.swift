//
//  Drawable.swift
//  GLChat
//
//  Created by Daniel on 18/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation

public protocol Drawable {
    func draw(in context: CGContext)
}

struct TextDrawable: Layout, Drawable {
    var text: String
    var frame: CGRect
    var font: UIFont
    
    mutating func layout(in rect: CGRect) {
        frame = rect
    }
    
    func draw(in context: CGContext) {
        UIGraphicsPushContext(context)
        let attributedString = NSAttributedString(string: text, attributes: [.font: font])
        var frame = self.frame
        let height = min(attributedString.size().height, frame.size.height)
        frame.origin.y += 0.5 * frame.size.height - height
        frame.size.height = height
        attributedString.draw(in: frame)
        UIGraphicsPopContext()
    }
    
    typealias Content = Drawable
    var contents: [Content] {
        return [self]
    }
}

struct ImageDrawable: Layout, Drawable {
    var image: UIImage
    var frame: CGRect
    
    mutating func layout(in rect: CGRect) {
        frame = rect
    }
    func draw(in context: CGContext) {
        UIGraphicsPushContext(context)
        image.draw(in: frame)
        UIGraphicsPopContext()
    }
    typealias Content = Drawable
    var contents: [Content] {
        return [self]
    }
}



