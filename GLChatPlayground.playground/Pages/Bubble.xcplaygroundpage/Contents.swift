//: [Previous](@previous)

import Foundation
import GLChat
import PlaygroundSupport


struct DefaultTextStyle: TextStyleProviderType {
    var font = UIFont(name: "Helvetica-Light", size: 12.0)!
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

let m: String = "Lorem ipsum dorem."
let f: UIFont = defaultStyle.font
let w: CGFloat = 250.0

var lbl = BubbleLabel(message: m, width: w, font: f, padding: 8.0)

var timestampLayout = lbl.withDate(Date())
let x = UIView(frame: CGRect(x: 0, y: 0, width: w, height: lbl.bounds.height + 20.0))

for view in timestampLayout.contents {
    if let label = view as? BubbleLabel {
        label.apply(style: ChatBubbleStyles.incomingChatStyle)
    }
    x.addSubview(view)
}
timestampLayout.layout(in: x.bounds)



PlaygroundPage.current.liveView = x
//: [Next](@next)
