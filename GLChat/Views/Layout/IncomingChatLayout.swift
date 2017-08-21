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
    
    public init(model: ChatObject) {
        avatar = AvatarView()
        message = BubbleLabel()
        timestamp = UILabel()
    }
    
    mutating public func layout(in rect: CGRect) {
        let avatarRect = self.avatarRect(in: rect)
        let messageRect = self.messageRect(in: rect)
        let timestampRect = self.timestampRect(in: rect)
        avatar.layout(in: avatarRect)
        message.layout(in: messageRect)
        timestamp.layout(in: timestampRect)
    }
    
    
    @discardableResult
    mutating public func layout(in rect: CGRect) -> CGRect {
        let avatarRect = self.avatarRect(in: rect)
        let messageRect = self.messageRect(in: rect)
        let timestampRect = self.timestampRect(in: rect)
        avatar.layout(in: avatarRect)
        message.layout(in: messageRect)
        timestamp.layout(in: timestampRect)
        return .zero
    }
    
    private func avatarRect(in rect: CGRect) -> CGRect {
        return .zero
    }
    
    private func messageRect(in rect: CGRect) -> CGRect {
        return .zero
    }
    private func timestampRect(in rect: CGRect) -> CGRect {
        return .zero
    }
    
    public var contents: [Content] {
        let contents = avatar.contents + message.contents + timestamp.contents
        return contents.flatMap({$0})
    }
    
    
    
    
    
}
