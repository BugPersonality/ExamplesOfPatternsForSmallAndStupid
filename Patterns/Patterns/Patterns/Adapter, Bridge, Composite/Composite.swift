import Foundation

protocol INode {
    var name: String { get }
    func display()
}


class File: INode{
    var name: String
    
    init(fileName: String) {
        name = fileName
    }
    
    func display() {
        print("File: \(name)")
    }
}

class Directory: INode{
    var name: String
    var childrens: [INode] = []
    
    init(fileName: String) {
        name = fileName
    }
    
    func addDir(dir: Directory){
        childrens.append(dir)
    }
    
    func addElement(file: File){
        childrens.append(file)
    }
    
    func removeElement(node: INode){
        for i in childrens.indices{
            if childrens[i].name == node.name{
                childrens.remove(at: i)
                break
            }
        }
    }
    
    func display() {
        print("Directory: \(name)")
        for i in childrens{
            print("\(i.display())")
        }
    }
}
