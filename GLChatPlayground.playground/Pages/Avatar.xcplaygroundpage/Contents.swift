//: [Previous](@previous)

import UIKit
import GLChat
import PlaygroundSupport

let avatar = Avatar(name: "Dicky ",
                    image: #imageLiteral(resourceName: "gemma.jpg"),
                    color: UIColor.purple)
let avatarView = AvatarView(model: avatar)
avatarView.frame = CGRect(x:0, y:0, width: 200, height: 200)
avatarView.backgroundColor = UIColor.clear
PlaygroundPage.current.liveView = avatarView

//: [Next](@next)
