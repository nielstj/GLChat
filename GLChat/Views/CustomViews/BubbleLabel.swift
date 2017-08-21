//
//  BubbleLabel.swift
//  GLChat
//
//  Created by Daniel on 18/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation


public class BubbleLabel: UILabel {
    
    public var padding: CGFloat = 8.0
    
    public init(message m: String, width w:CGFloat, font f: UIFont, padding p: CGFloat = 8.0) {
        let mh = m.height(withConstrainedWidth: w - (2 * p), font: f)
        let mw = m.width(withConstrainedHeight: 100.0, font: f)
        let rect = CGRect(x: 0, y: 0, width : min(mw,w) + 2 * p, height: mh + 2 * p)
        super.init(frame: rect)
        self.padding = p
        self.numberOfLines = 0
        self.font = f
        self.text = m
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override public func drawText(in rect: CGRect) {
        let p = max(padding, 8.0)
        super.drawText(in: rect.insetBy(dx: p, dy: p))
    }
}
