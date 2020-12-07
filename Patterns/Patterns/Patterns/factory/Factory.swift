import Cocoa

protocol IBuilding{
    var name: String? { get set }
    var square: Double? { get set }
    var height: Double? { get set }
}

class House: IBuilding{
    var name: String?
    var square: Double?
    var height: Double?
    
    init(name: String, square: Double, height: Double) {
        self.name = name
        self.square = square
        self.height = height
    }
}

class Bath: IBuilding{
    var name: String?
    var square: Double?
    var height: Double?
    
    init(name: String, square: Double, height: Double) {
        self.name = name
        self.square = square
        self.height = height
    }
}

class Developer{
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func create() -> IBuilding{
        return House(name: "", square: 0, height: 0)
    }
}

class HouseDeveloper: Developer{
    override func create() -> IBuilding {
        return House(name: "house", square: 34, height: 5)
    }
}

class BathDeveloper: Developer{
    override func create() -> IBuilding {
        return Bath(name: "bath", square: 34, height: 1)
    }
}


