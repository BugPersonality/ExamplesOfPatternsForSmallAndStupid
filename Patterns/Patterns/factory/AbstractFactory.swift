import Foundation

protocol IMovement {
    func move(hero: Hero)
}

protocol IHit{
    func hit(hero: Hero)
    
}

class Sword: IHit{
    func hit(hero: Hero) {
        print("hit by sword hero: \(hero)")
    }
}

class Bow: IHit{
    func hit(hero: Hero) {
        print("hit by bow hero: \(hero)")
    }
}

class Staff: IHit{
    func hit(hero: Hero) {
        print("hit by staff hero: \(hero)")
    }
}

class Run: IMovement{
    func move(hero: Hero) {
        print("hero \(hero) runing now")
    }
}

class Fly: IMovement{
    func move(hero: Hero) {
        print("hero \(hero) flying now")
    }
}

class Teleport: IMovement{
    func move(hero: Hero) {
        print("hero \(hero) teleportating now")
    }
}

class Hero{
    var weapon: IHit?
    var movement: IMovement?
    
    init(factory: IHeroFactory) {
        weapon = factory.getHit()
        movement = factory.getMovement()
    }
}

protocol IHeroFactory{
    func getHit() -> IHit
    func getMovement() -> IMovement
}

class ClassicElf: IHeroFactory{
    func getHit() -> IHit {
        return Bow()
    }
    
    func getMovement() -> IMovement {
        return Run()
    }
}

class ClassicMage: IHeroFactory{
    func getHit() -> IHit {
        return Staff()
    }
    
    func getMovement() -> IMovement {
        return Teleport()
    }
}

class CustomHero: IHeroFactory{
    func getHit() -> IHit {
        print("Choose Weapon for hero!\n1: Sword\n2: Bow\n3: Staff")
        let type = readLine()
        if type == "1"{
            return Sword()
        }else if type == "2"{
            return Bow()
        }else if type == "3"{
            return Staff()
        }else{
            print("give defoult weapon - sword")
            return Sword()
        }
    }
    
    func getMovement() -> IMovement {
        print("Choose movement for Hero!\n1: run\n2: Fly\n3: Teleport")
        let type = readLine()
        if type == "1"{
            return Run()
        }else if type == "2"{
            return Fly()
        }else if type == "3"{
            return Teleport()
        }else{
            print("give defoult movement - run")
            return Run()
        }
    }
    
    
}
