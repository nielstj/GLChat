//
//  ChatCellStyle.swift
//  GLChat
//
//  Created by Daniel on 25/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation

public protocol ChatStyleType {
    var incomingColor: UIColor { get set }
    var outgoingColor: UIColor { get set }
    var incomingTextColor: UIColor { get set }
    var outgoingTextColor: UIColor { get set }
    var cornerRadius: CGFloat { get set }
}

public struct DefaultChatStyle {
    public var incomingColor: UIColor = UIColor.blue
    public var outgoingColor: UIColor = UIColor.red
    public var incomingTextColor: UIColor = UIColor.white
    public var outgoingTextColor: UIColor = UIColor.white
    public var cornerRadius: CGFloat = 12.0
}

public struct ChatCellStyle {
    public var incomingColor: UIColor
    public var outgoingColor: UIColor
    public var incomingTextColor: UIColor
    public var outgoingTextColor: UIColor
    public var cornerRadius: CGFloat
    
    public init(incomingColor: UIColor,
                outgoingColor: UIColor,
                incomingTextColor: UIColor,
                outgoingTextColor: UIColor,
                cornerRadius: CGFloat) {
        self.incomingTextColor = incomingTextColor
        self.outgoingTextColor = outgoingTextColor
        self.incomingColor = incomingColor
        self.outgoingColor = outgoingColor
        self.cornerRadius = cornerRadius
    }
}

extension ChatCellStyle:  ChatStyleType {}
extension DefaultChatStyle: ChatStyleType {}
