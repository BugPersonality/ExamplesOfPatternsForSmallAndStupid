import Foundation

class Unit{
    func turn(){
        collectResources()
        building()
        if hasEnemy() {
            attack()
        }
    }
    
    func collectResources(){
        
    }
    
    func building(){
        
    }
    
    func hasEnemy() -> Bool{
        return true
    }
    
    func attack(){
        
    }
}

class Human: Unit{
    override func collectResources(){
        print("Собираю ресурсы")
    }
    
    override func building() {
        print("Строю стену")
    }
    
    override func attack() {
        print("Атакую лопатой")
    }
    
    override func hasEnemy() -> Bool {
        let number = Int.random(in: 1...100)
        
        if number < 50{
            return false
        }
        else{
            return true
        }
    }
}

class Monster: Unit{
    override func attack() {
        print("Рву и кусаю")
    }
}
