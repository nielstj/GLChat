//
//  IncomingChatLayout.swift
//  GLChat
//
//  Created by Daniel on 20/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import CoreGraphics

public struct IncomingChatLayout<AvatarContent: Layout, messageContent: Layout, timestampContent: Layout>: Layout {
    
    public typealias Content = UIView
    
    var avatar: AvatarView
    var message: BubbleLabel
    var timestamp: UILabel
    
    public init(avatar: AvatarView, message: BubbleLabel, timestamp: UILabel) {
        self.avatar = avatar
        self.message = message
        self.timestamp = timestamp
    }
    
    mutating public func layout(in rect: CGRect) {
        let avatarRect = self.avatarRect(in: rect)
        let messageRect = self.messageRect(in: rect)
        let timestampRect = self.timestampRect(in: rect)
        avatar.layout(in: avatarRect)
        message.layout(in: messageRect)
        timestamp.layout(in: timestampRect)
    }
    
    private func avatarRect(in rect: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: 50, height: 50)
    }
    
    private func messageRect(in rect: CGRect) -> CGRect {
        return CGRect(x: 50, y: 0, width: rect.width * 0.6, height:rect.height)
    }
    private func timestampRect(in rect: CGRect) -> CGRect {
        return CGRect(x: 50, y: rect.height - 20, width: rect.width * 0.5, height: 20)
    }
    
    public var contents: [Content] {
        let contents = avatar.contents + message.contents + timestamp.contents
        return contents.flatMap({$0})
    }
    
    
    
    
    
}
