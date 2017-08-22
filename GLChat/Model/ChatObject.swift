//
//  ChatObject.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation
import UIKit

public enum ChatObjectCellType: Int {
    case incoming
    case outgoing
    case options
    case information
}

public protocol ChatObjectType {
    var id: String { get }
    var type: ChatObjectCellType { get }
    var sender: AvatarType { get }
    var message: String { get }
    var images: [UIImage]? { get }
    var timestamp: Date { get }
}

public struct ChatObject: ChatObjectType {
    public var id: String
    public var type: ChatObjectCellType
    public var sender: AvatarType
    public var message: String
    public var images : [UIImage]?
    public var timestamp: Date
    
    public init(id: String,
                type: ChatObjectCellType,
                sender: AvatarType,
                message: String,
                images: [UIImage]?,
                timestamp: Date) {
        self.id = id
        self.type = type
        self.sender = sender
        self.message = message
        self.images = images
        self.timestamp = timestamp
    }
    
    public func generateAvatar() -> AvatarView {
        return AvatarView(model: sender)
    }
    
    
    public func generateViewWithAvatar(width: CGFloat) -> UIView {
        let view = UIView()
        let content = generateView(width: width * 0.6)
        let avatar = generateAvatar()
        avatar.frame = CGRect(x: 0, y: 0, width: 50, height: 50).insetBy(dx: 5, dy: 5)
        content.frame = content.frame.offsetBy(dx:55, dy: 0)
        view.addSubview(avatar)
        view.addSubview(content)
        view.frame = CGRect(x: 0, y: 0, width: width, height: content.bounds.height)
        return view
    }
    
    public func generateView(width: CGFloat) -> UIView {
        let view = UIView()
        let content: UIView!
        if let image = images?.first { content = generateMediaView(width: width,
                                                                   image: image,
                                                                   text: message) }
        else { content = generateBubble(width: width,
                                        text: message) }
        
        content.backgroundColor = UIColor.blue
        content.layer.cornerRadius = 12.0
        content.layer.masksToBounds = true
        
        var tsLayout = content.withDate(timestamp)
        let rect = CGRect(x: 0, y: 0, width: width, height: content.bounds.height + 20)
        view.frame = rect
        tsLayout.layout(in: view.bounds)
        for v in tsLayout.contents { view.addSubview(v) }
        return view
    }
    
    private func generateBubble(width: CGFloat, text: String) -> BubbleLabel {
        let bubble = BubbleLabel(message: text,
                                 width: width,
                                 font: UIFont.systemFont(ofSize: 12.0))
        bubble.textColor = UIColor.white
        return bubble
    }
    private func generateMediaView(width: CGFloat,
                                   image: UIImage,
                                   text: String) -> UIView {
        let view = UIView()
        let bubble = generateBubble(width: width, text: text)
        let image = image.scaled(to: width)
        let iv = UIImageView(image: image)
        let th = bubble.bounds.height + image.size.height
        view.frame = CGRect(x: 0, y: 0, width: width, height: th)
        var layout = ChatMediaLayout(message: bubble, media: iv)
        for v in layout.contents { view.addSubview(v)}
        layout.layout(in: view.bounds)
        return view
    }
}

