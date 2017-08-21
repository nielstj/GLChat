//
//  UIView+Layout.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//


import UIKit

extension UIView: Layout {
    typealias  Content = UIView
    func layout(in rect: CGRect) {
        self.frame = rect
    }
    var contents: [Content] {
        return [self]
    }
    
}
