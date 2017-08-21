//: [Previous](@previous)

import Foundation
import GLChat
import PlaygroundSupport



let strings: [String] = ["You think?",
               "Now that there is the Tec-9, a crappy spray gun from South Miami. This gun is advertised as the most popular gun in American crime",
               "Now that we know who you are, I know who I am. I'm not a mistake! It all makes sense! In a comic, you know how you can tell who the arch-villain's going to be? He's the exact opposite of the hero. And most times they're friends, like you and me! I should've known way back when... You know why, David? Because of the kids. They called me Mr Glass."]

let testStr = "The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men."

let font = UIFont.systemFont(ofSize: 12)
let color = UIColor.purple


class TVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(GLIncomingChatCell.self, forCellReuseIdentifier: "incoming")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")  ?? GLIncomingChatCell(style: .default, reuseIdentifier: "cell")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = tableView.cellForRow(at: indexPath)?.contentView.bounds.width ?? self.view.bounds.width
        let height = testStr.height(withConstrainedWidth: width * 0.4, font: font)
        return height
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}


let tvc: TVC = TVC()
tvc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)


PlaygroundPage.current.liveView = tvc.view












//: [Next](@next)
