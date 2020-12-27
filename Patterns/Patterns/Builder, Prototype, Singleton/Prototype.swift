import Foundation

protocol IElement{
    func clone() -> IElement
    func info() -> String
}

class Button: IElement{
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.height = height
        self.width = width
    }
    
    init(other: Button) {
        self.width = other.width
        self.height = other.height
    }
    
    func clone() -> IElement {
        return Button(other: self)
    }
    
    func info() -> String {
        return "Button(width: \(width), height: \(height))"
    }
}
