//
//  UIView+Layout.swift
//  GLChat
//
//  Created by Daniel on 17/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import UIKit

extension UIView: Layout {
    public typealias Content = UIView
    
    public func layout(in rect: CGRect) {
        self.frame = rect
    }
    
    public var contents: [Content] {
        return [self]
    }
}
