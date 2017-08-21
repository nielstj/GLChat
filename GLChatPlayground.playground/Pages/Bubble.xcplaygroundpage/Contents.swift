//: [Previous](@previous)

import Foundation
import GLChat
import PlaygroundSupport


struct DefaultTextStyle: TextStyleProviderType {
    var font = UIFont.systemFont(ofSize: 10)
    var color = UIColor.white
    var backgroundColor = UIColor.purple
    var cornerRadius: CGFloat = 12.0
}
let defaultStyle = DefaultTextStyle()

struct ChatBubbleStyles {
    static func incomingChatStyle(_ label : UILabel) {
        let s = DefaultTextStyle()
        label.backgroundColor = s.backgroundColor
        label.font = s.font
        label.textColor = s.color
        label.layer.cornerRadius = s.cornerRadius
        label.layer.masksToBounds = true
    }
}

let m: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis scelerisque purus et fringilla. Sed eget ante magna. Praesent id convallis libero, a eleifend turpis. Integer blandit metus sit amet velit varius congue. Cras sit amet laoreet velit, ut vulputate dolor. Donec odio dolor, ultricies vulputate sem eget, tristique gravida massa."
let f: UIFont = defaultStyle.font
let w: CGFloat = 300.0

var lbl = BubbleLabel(message: m, width: w, font: f)
lbl.apply(style: ChatBubbleStyles.incomingChatStyle)
PlaygroundPage.current.liveView = lbl
//: [Next](@next)
