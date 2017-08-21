//
//  GLChatCell.swift
//  GLChat
//
//  Created by Daniel on 17/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation


public class GLIncomingChatCell<T: Layout>: UITableViewCell {
    
    private var content: T
    private var avatar: AvatarView
    private var timestamp: UILabel
    
    init(style: UITableViewCellStyle, reuseIdentifier: String, content: T, avatar: AvatarView, timestamp: UILabel) {
        self.content = content
        self.avatar = avatar
        self.timestamp = timestamp
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // TODO: Setup Layout here and add contents to contentview
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        // SETUP layout here and Lay out all contents
    }
}

public class GLOutgoingChatCell<T: Layout>: UITableViewCell {
    private var content: T
    private var timestamp: UILabel
    
    init(style: UITableViewCellStyle, reuseIdentifier: String, content: T, timestamp: UILabel) {
        self.content = content
        self.timestamp = timestamp
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // TODO: Setup layout here and add contents to contentview
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        // TODO: setup layout here and layout all contents with contentview.bounds
    }
    
}


