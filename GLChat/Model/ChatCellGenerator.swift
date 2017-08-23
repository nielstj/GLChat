//
//  ChatCellGenerator.swift
//  GLChat
//
//  Created by Daniel on 23/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import CoreGraphics

public protocol ChatCellGeneratorType {
    var width: CGFloat { get set }
    func heightFrom(obj: ChatObjectType) -> CGFloat
    func generateCell(obj: ChatObjectType) -> UIView
    
}

public final class ChatCellGenerator: ChatCellGeneratorType {
    
    public var width: CGFloat
    public var ratio: CGFloat
    public var padding: CGFloat
    public var tsHeight: CGFloat
    public var font: UIFont
    
    public init(constrainedWidth: CGFloat, ratio: CGFloat, padding: CGFloat, timestampHeight: CGFloat, font: UIFont) {
        self.width = constrainedWidth
        self.ratio = ratio
        self.padding = padding
        self.tsHeight = timestampHeight
        self.font = font
    }
    
    ///
    /// PUBLIC METHODS
    ///
    public func heightFrom(obj: ChatObjectType) -> CGFloat {
        let m = obj.message
        let w = width * ratio
        
        var height: CGFloat = 0.0
        height += 2 * padding
        height += tsHeight
        height += m.height(withConstrainedWidth: (w - 2 * padding), font: UIFont.systemFont(ofSize: 15.0))
        if let image = obj.images?.first {
            let ratio = w / image.size.width
            height += ceil(ratio * image.size.height)
        }
        return height
    }
    
    public func generateCell(obj: ChatObjectType) -> UIView {
        switch obj.type {
        case .incoming: return generateIncomingView(obj: obj, width: width)
        case .outgoing: return generateOutgoingView(obj: obj, width: width)
        case .options: return UIView()
        case .information: return UIView()
        }
    }
    
    ///
    /// PRIVATE METHODS
    ///
    private func generateOutgoingView(obj: ChatObjectType, width: CGFloat) -> UIView {
        let content = generateContentView(obj: obj, width: width * ratio)
        content.frame = content.frame.offsetBy(dx: width * (1.0 - ratio) - (2 * padding), dy: 0)
        let view = UIView(frame: CGRect(x: 0, y: padding, width: width, height: content.bounds.height))
        view.addSubview(content)
        return view
    }
    
    private func generateIncomingView(obj: ChatObjectType, width: CGFloat) -> UIView {
        let view = UIView()
        let content = generateContentView(obj: obj, width: width * ratio)
        let avatar = generateAvatar(obj.sender)
        avatar.frame = CGRect(x: 0, y: 0, width: 50, height: 50).insetBy(dx: 5, dy: 5)
        content.frame = content.frame.offsetBy(dx:55, dy: 0)
        view.addSubview(avatar)
        view.addSubview(content)
        view.frame = CGRect(x: 0, y: padding, width: width, height: content.bounds.height)
        return view
    }
    
    
    private func generateContentView(obj: ChatObjectType, width: CGFloat) -> UIView {
        let view = UIView()
        let content: UIView!
        
        if let image = obj.images?.first {
            content = generateImageBubble(image: image, caption: obj.message, width: width)
        }
        else {
            content = generateTextBubble(text: obj.message, width: width)
        }
        
        // TODO: DO Styling ere
        let color = obj.type == .incoming ? UIColor.blue : UIColor.red
        content.backgroundColor = color
        content.layer.cornerRadius = 15.0
        content.layer.masksToBounds = true
        // ENDOFTODO
        
        let alignment: NSTextAlignment = obj.type == .outgoing ? .right : .left
        var tsLayout = content.withDate(obj.timestamp, alignment: alignment)
        let rect = CGRect(x: 0, y: 0, width: width, height: content.bounds.height + 20)
        view.frame = rect
        tsLayout.layout(in: view.bounds)
        for v in tsLayout.contents { view.addSubview(v) }
        return view
    }
    
    private func generateTextBubble(text: String, width: CGFloat) -> BubbleLabel {
        let bubble = BubbleLabel(message: text, width: width, font: font, padding: padding)
        //TODO: APPLY STYLING
        bubble.textColor = UIColor.white
        return bubble
    }
    
    private func generateImageBubble(image: UIImage, caption: String, width: CGFloat) -> UIView {
        let view = UIView()
        let bubble = generateTextBubble(text: caption, width: width)
        let image = image.scaled(to: width)
        let iv = UIImageView(image: image)
        let th = bubble.bounds.height + image.size.height
        view.frame = CGRect(x: 0, y: 0, width: width, height: th)
        var layout = ChatMediaLayout(message: bubble, media: iv)
        for v in layout.contents { view.addSubview(v)}
        layout.layout(in: view.bounds)
        return view
    }
    
    private func generateAvatar(_ ava: AvatarType) -> AvatarView {
        return AvatarView(model: ava)
    }
}
