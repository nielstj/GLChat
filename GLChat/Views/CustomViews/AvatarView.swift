//
//  AvatarView.swift
//  GLChat
//
//  Created by Daniel on 18/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation

public class AvatarView: UIView {
    
    lazy var image: UIImage? = nil
    lazy var name: String = "Anonymous"
    lazy var color: UIColor = UIColor.blue
    
    public var font: UIFont = UIFont.systemFont(ofSize: 12.0) {
        didSet { self.draw(self.bounds) }
    }
    
    public init(model: AvatarType) {
        super.init(frame: CGRect.zero)
        self.color = model.color
        self.image = model.image
        self.name = model.name
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var maskLayer: CALayer = {
        let maskLayer = CALayer()
        maskLayer.masksToBounds = true
        maskLayer.backgroundColor = UIColor.black.cgColor
        return maskLayer
    }()
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        setMaskLayerIn(rect)
        if let img = image {
            drawImageIn(rect, image: img)
        } else {
            drawInitialsIn(rect, initials: name.initials)
        }
    }
    
    private func setMaskLayerIn(_ rect: CGRect) {
        let d = min(rect.width, rect.height)
        let p = CGPoint(x: rect.width/2 - d/2, y: rect.height/2 - d/2)
        maskLayer.frame = CGRect(origin: p, size: CGSize(width:d, height:d))
        maskLayer.cornerRadius = d/2
        self.layer.mask = maskLayer
    }
    
    private func drawImageIn(_ rect: CGRect, image: UIImage) {
        let d = min(rect.width, rect.height)
        let p = CGPoint(x: rect.width/2 - d/2, y: rect.height/2 - d/2)
        let scaledImg = image.scaled(to: CGSize(width:d, height:d), scalingMode: .aspectFill)
        scaledImg.draw(at: p)
    }
    
    private func drawInitialsIn(_ rect: CGRect, initials: String) {
        let d = min(rect.width, rect.height)
        drawCircleIn(rect)
        let charCount = max(CGFloat(initials.characters.count),1.5)
        let fontResize = font.withSize(d/charCount)
        let w = initials.boundingRect(with: rect.size,
                                      options: .usesFontLeading,
                                      attributes: [.font: fontResize],
                                      context: nil).size
        let textPoint = CGPoint(x: rect.width/2 - w.width/2, y: rect.height/2 - w.height/2)
        initials.draw(at:textPoint, withAttributes:[.font:fontResize, .foregroundColor: UIColor.white])
    }
    
    private func drawCircleIn(_ rect: CGRect) {
        let d = min(rect.width, rect.height)
        let path = UIBezierPath(arcCenter: rect.center,
                                radius: d/2,
                                startAngle: 0.0,
                                endAngle: CGFloat(Double.pi)*2,
                                clockwise: true)
        color.set()
        path.fill()
    }
}

//extension AvatarView: Drawable {}

