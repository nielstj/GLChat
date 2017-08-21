//
//  GLChatCell.swift
//  GLChat
//
//  Created by Daniel on 17/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation


public class GLIncomingChatCell: UITableViewCell {
    static let reuseId = "\(GLIncomingChatCell.self)"
    
    
    private var content = BubbleLabel()
    private var decoration = AvatarView(model: Avatar(name: "DICKY",
                                                      image: #imageLiteral(resourceName: "img.jpg"),
                                                      color: UIColor.purple))
    
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // TODO: INIT LAYOUT AND ADD TO SUBVIEW
        content.numberOfLines = 0
        content.backgroundColor = UIColor.purple
        content.textColor = UIColor.white
        content.layer.cornerRadius = 12.0
        content.layer.masksToBounds = true
        content.font = UIFont.systemFont(ofSize: 12)
        content.text = "The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men."
        let layout = DecoratingLayout(content: content, decoration: decoration)
        for view in layout.contents {
            contentView.addSubview(view)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        var layout = DecoratingLayout(content: content, decoration: decoration)
        layout.layout(in: contentView.bounds)
    }
}

