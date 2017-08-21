//
//  Layout.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation
import CoreGraphics

/// Layout Protocol
///
/// This Type can layout itself by the given area

public protocol Layout {
    associatedtype Content
    mutating func layout(in rect: CGRect)
    var contents: [Content] { get }
}
