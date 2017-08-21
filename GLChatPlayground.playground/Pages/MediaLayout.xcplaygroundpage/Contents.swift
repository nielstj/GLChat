//: [Previous](@previous)

import UIKit
import GLChat
import PlaygroundSupport


let text = "Etiam purus ante, imperdiet nec molestie non, consectetur id eros. Integer pretium magna ac sem imperdiet, ut ornare velit euismod. Cras nulla ipsum, dignissim ut leo non, volutpat rhoncus dolor. Nullam ultrices lectus non magna malesuada imperdiet at dictum turpis."
let img = #imageLiteral(resourceName: "gemma.jpg")
let w: CGFloat = 250
let image = img.scaled(to: w)


let label = BubbleLabel(message: text, width: w, font: UIFont.systemFont(ofSize: 12))
label.backgroundColor = UIColor.purple
label.textColor = UIColor.white

let imageView = UIImageView(image: image)
imageView.contentMode = .scaleAspectFill
imageView.clipsToBounds = true

let labelHeight = label.bounds.height
let imageHeight = image.size.height
let totalHeight = labelHeight + imageHeight

var mediaLayout = ChatMediaLayout(message: label, media: imageView)

let masterView = UIView(frame: CGRect(x:0,y:0, width: w, height: totalHeight))

for view in mediaLayout.contents {
    masterView.addSubview(view)
}





mediaLayout.layout(in: masterView.bounds)
masterView.layer.cornerRadius = 12.0
masterView.layer.masksToBounds = true

var dateLayout = masterView.withDate(Date())
let fullView = UIView(frame: CGRect(x: 0, y: 0, width: masterView.bounds.width, height: masterView.bounds.height + 20.0))
for view in dateLayout.contents {
    fullView.addSubview(view)
}
dateLayout.layout(in: fullView.bounds)




PlaygroundPage.current.liveView = fullView

//: [Next](@next)
