////: [Previous](@previous)
//
import Foundation
import GLChat
import PlaygroundSupport





let msg1 = "Lorem............."
let msg2 = "Integer blandit metus sit amet velit varius congue. Cras sit amet laoreet velit, ut vulputate dolor. Donec odio dolor, ultricies vulputate sem eget, tristique gravida massa. Etiam purus ante, imperdiet nec molestie non, consectetur id eros. Integer pretium magna ac sem imperdiet, ut ornare velit euismod. Cras nulla ipsum, dignissim ut leo non, volutpat rhoncus dolor. Nullam ultrices lectus non magna malesuada imperdiet at dictum turpis."
let msg3 = "Donec purus nisl, dictum at ultricies congue."

let gemma = Avatar(name: "Gemma Arterton",
                    image: #imageLiteral(resourceName: "gemma.jpg"),
                    color: UIColor.blue)
let daniel = Avatar(name: "Daniel Tjuatja",
                    image: nil,
                    color: UIColor.blue)

let obj1 = ChatObject(id: "01",
                      type: .outgoing,
                      sender: gemma,
                      message: msg3,
                      images: [#imageLiteral(resourceName: "gemma2.jpg")],
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
                      message: "Hello, is it me you looking for",
                      images: nil,
                      timestamp: Date())
let obj4 = ChatObject(id: "03",
                      type: .outgoing,
                      sender: gemma,
                      message: "Maybe",
                      images: nil,
                      timestamp: Date())
let obj5 = ChatObject(id: "03",
                      type: .outgoing,
                      sender: gemma,
                      message: "Maybe not....",
                      images: nil,
                      timestamp: Date())
let obj6 = ChatObject(id: "03",
                      type: .incoming,
                      sender: gemma,
                      message: "babe please",
                      images: nil,
                      timestamp: Date())

let objects: [ChatObject] = [obj1, obj2, obj3, obj4, obj5, obj6,
                             obj1, obj2, obj3, obj4, obj5, obj6]


//let f = UIFont.systemFont(ofSize: 12)
//let c = UIColor.purple
//let w: CGFloat = 320
//
//
//let view = obj1.generateView(width: w)
//let avatar = obj1.generateAvatar()
//let cell = obj1.generateCell(width: w)
//
//PlaygroundPage.current.liveView = cell





















class TVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.allowsSelection = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let indexPath = IndexPath(row: objects.count-1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.contentView.subviews.forEach({$0.removeFromSuperview()})
        DispatchQueue.main.async {
            let object = objects[indexPath.row]
            let view = object.generateCell(width: cell.contentView.bounds.width)
//            print("\(indexPath.row) - actual view height : \(view.bounds.height)")
            cell.contentView.addSubview(view)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0.0
        let obj = objects[indexPath.row]
        return obj.getActualHeightWith(width: view.bounds.width)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}


let tvc: TVC = TVC()
tvc.view.frame = CGRect(x: 0, y: 0, width: 300, height: 600)


PlaygroundPage.current.liveView = tvc.view


////: [Next](@next)

