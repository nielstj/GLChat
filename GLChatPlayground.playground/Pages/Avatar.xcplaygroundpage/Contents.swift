//: [Previous](@previous)

import UIKit
import GLChat
import PlaygroundSupport

let avatar = Avatar(name: "Dicky ",
                    image: nil,
                    color: UIColor.purple)
let avatarView = AvatarView(model: avatar)
avatarView.frame = CGRect(x:0, y:0, width: 50, height: 50)
avatarView.backgroundColor = UIColor.clear
PlaygroundPage.current.liveView = avatarView

//: [Next](@next)
