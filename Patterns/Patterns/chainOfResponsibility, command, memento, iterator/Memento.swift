import Foundation

enum error1: Error {
    case NoBulletForShoot
}

class HeroMemento{
    var _bullets: Int
    var _lives: Int
    
    init(bullets: Int, lives: Int) {
        _bullets = bullets
        _lives = lives
    }
}

class MHero{
    var bullets = 10
    var lives = 5
    
    func shoot()throws {
        if bullets > 0{
            bullets -= 1
            print("piu - piu - piu (bullets: \(bullets))")
        }
        else{
            throw error1.NoBulletForShoot
        }
    }
    
    func save() -> HeroMemento{
        return HeroMemento(bullets: self.bullets, lives: self.lives)
    }
    
    func restore(to: HeroMemento){
        self.bullets = to._bullets
        self.lives = to._lives
    }
}
