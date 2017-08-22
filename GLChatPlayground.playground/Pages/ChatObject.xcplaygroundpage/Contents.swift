////: [Previous](@previous)
//
import Foundation
import GLChat
import PlaygroundSupport





let msg1 = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas convallis scelerisque purus et fringilla. Sed eget ante magna. Praesent id convallis libero, a eleifend turpis."
let msg2 = "Integer blandit metus sit amet velit varius congue. Cras sit amet laoreet velit, ut vulputate dolor. Donec odio dolor, ultricies vulputate sem eget, tristique gravida massa. Etiam purus ante, imperdiet nec molestie non, consectetur id eros. Integer pretium magna ac sem imperdiet, ut ornare velit euismod. Cras nulla ipsum, dignissim ut leo non, volutpat rhoncus dolor. Nullam ultrices lectus non magna malesuada imperdiet at dictum turpis."
let msg3 = "Donec purus nisl, dictum at ultricies congue."

let gemma = Avatar(name: "Gemma Arterton",
                    image: #imageLiteral(resourceName: "gemma.jpg"),
                    color: UIColor.blue)
let daniel = Avatar(name: "Daniel Tjuatja",
                    image: nil,
                    color: UIColor.red)

let obj1 = ChatObject(id: "01",
                      type: .incoming,
                      sender: daniel,
                      message: msg1,
                      images: [#imageLiteral(resourceName: "gemma.jpg")],
                      timestamp: Date())
let obj2 = ChatObject(id: "02",
                      type: .incoming,
                      sender: gemma,
                      message: msg2,
                      images: nil,
                      timestamp: Date())
let obj3 = ChatObject(id: "03",
                      type: .incoming,
                      sender: gemma,
                      message: msg3,
                      images: [#imageLiteral(resourceName: "img.jpg")],
                      timestamp: Date())

let objects: [ChatObject] = [obj1, obj2, obj3]


let f = UIFont.systemFont(ofSize: 12)
let c = UIColor.purple
let w: CGFloat = 480


let view = obj1.generateView(width: w)
let avatar = obj1.generateAvatar()
let cell = obj1.generateViewWithAvatar(width: w)

PlaygroundPage.current.liveView = cell























//let strings: [String] = ["You think?",
//               "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime",
//               "Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass."]
//
//let testStr = "The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men."
//

//
//
//
//class TVC: UITableViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.register(GLIncomingChatCell.self, forCellReuseIdentifier: "incoming")
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        tableView.reloadData()
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return objects.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = GLIncomingChatCell(style: .default, reuseIdentifier: GLIncomingChatCell.reuseId)
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let width = tableView.cellForRow(at: indexPath)?.contentView.bounds.width ?? self.view.bounds.width
//        let height = testStr.height(withConstrainedWidth: width * 0.6, font: font)
//        return height
//        
//    }
//    
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    
//    
//}
//
//
//let tvc: TVC = TVC()
//tvc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)
//
//
//PlaygroundPage.current.liveView = tvc.view
//
//
//
//
//
//
//
//
//
//
//
//
////: [Next](@next)

