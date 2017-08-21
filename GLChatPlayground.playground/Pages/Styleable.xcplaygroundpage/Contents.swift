//: [Previous](@previous)

import UIKit
import GLChat
import PlaygroundSupport

struct BaseStyles {
    static func roundCornerStyle(_ view: UIView) {
        view.layer.cornerRadius = 12.0
        view.layer.masksToBounds = true
    }
    static func blueBackground(_ view: UIView) {
        view.backgroundColor = UIColor.blue
    }
    static func normalTextFont(_ label: UILabel) {
        label.font = UIFont.systemFont(ofSize: 12.0)
    }
    static func multipleLineLabel(_ label: UILabel) {
        label.numberOfLines = 0
    }
    static func whiteTextLabel(_ label: UILabel) {
        label.textColor = UIColor.white
    }
}

let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
let view = UILabel(frame: rect)
view.text = "Lorem Ipsum dorem"

view.apply(styles: [BaseStyles.roundCornerStyle,
                    BaseStyles.blueBackground,
                    BaseStyles.multipleLineLabel,
                    BaseStyles.whiteTextLabel])

PlaygroundPage.current.liveView = view







//: [Next](@next)
