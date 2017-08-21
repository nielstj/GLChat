//
//  ChatBubbleLayout.swift
//  GLChat
//
//  Created by Daniel on 20/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import CoreGraphics

public struct ChatMediaLayout: Layout {
    
    public typealias Content = UIView
    var message: BubbleLabel
    var media: UIImageView
    public init(message: BubbleLabel, media: UIImageView) {
        self.message = message
        self.media = media
    }
    
    mutating public func layout(in rect: CGRect) {
        let image = media.image!
        media.frame = CGRect(x:0, y:0, width: rect.width, height: image.size.height )
        message.frame = CGRect(x: 0, y: image.size.height, width: rect.width, height: message.bounds.height + 2.0)
    }
    public var contents: [Content] {
        return [message, media]
    }
}



