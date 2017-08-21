//
//  CGRectExtensions.swift
//  GLChat
//
//  Created by Daniel on 18/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation

extension CGRect {
    
    /// Get center point of a CGRect
    ///
    /// - Returns: center point of self.
    var center: CGPoint { return CGPoint(x:self.width/2, y: self.height/2) }
}
