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
    var styleProvider : TextStyleProviderType { get }
}

public struct ChatObject: ChatObjectType {
    public var id: String
    public var type: ChatObjectCellType
    public var sender: AvatarType
    public var message: String
    public var images : [UIImage]?
    public var timestamp: Date
    public var styleProvider: TextStyleProviderType
    
    public init(id: String,
                type: ChatObjectCellType,
                sender: AvatarType,
                message: String,
                images: [UIImage]?,
                timestamp: Date,
                styleProvider: TextStyleProviderType) {
        self.id = id
        self.type = type
        self.sender = sender
        self.message = message
        self.images = images
        self.timestamp = timestamp
        self.styleProvider = styleProvider
    }
}

