//: [Previous](@previous)

import Foundation
import GLChat
import PlaygroundSupport


struct DefaultTextStyle: TextStyleProviderType {
    var font = UIFont.systemFont(ofSize: 12)
    var color = UIColor.white
    var backgroundColor = UIColor.blue
    var cornerRadius: CGFloat = 12.0
}

let defaultStyle = DefaultTextStyle()

let m: String = "Etiam purus ante."
let f: UIFont = defaultStyle.font
let w: CGFloat = 300.0
let p: CGFloat = 12.0

var lbl = BubbleLabel(message: m, width: w, font: f, padding: p)
lbl.applyStyle(defaultStyle)
PlaygroundPage.current.liveView = lbl
//: [Next](@next)
