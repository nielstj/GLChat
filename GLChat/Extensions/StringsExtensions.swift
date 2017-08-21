//
//  StringsExtensions.swift
//  GLChat
//
//  Created by Daniel on 16/8/17.
//  Copyright © 2017 Holmusk. All rights reserved.
//

import Foundation
public extension String {
    /// Public properties that return initials of string content
    public var initials: String {
        return self.toInitials()
    }
    /// Get initials of self content
    ///
    /// - Returns: Initials as string.
    private func toInitials() -> String {
        guard self.characters.count > 0 else { return "" }
        return self
            .components(separatedBy: " ")
            .flatMap({$0.characters.first})
            .map({String(describing: $0)})
            .reduce("", +)
    }
    
}

extension String {
    
    /// Get estimated height of string given width and font constraint
    ///
    /// - Parameters:
    ///   - width: width constraint.
    ///   - font: font constraint.
    /// - Returns: estimated height.
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    /// Get estimated width of string given height and font constraint
    ///
    /// - Parameters:
    ///   - height: height constraint.
    ///   - font: font constraint.
    /// - Returns: estimated width.
    public func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}

extension NSAttributedString {
    public func height(withConstrainedWidth width: CGFloat) -> CGFloat {
        let constraintrect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintrect, options: .usesFontLeading, context: nil)
    return boundingBox.size.height
    }
    
    public func width(withConstrainedHeight height: CGFloat) -> CGFloat {
        let constraintrect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintrect, options: .usesFontLeading, context: nil)
        return boundingBox.size.width
    }
}

