import Foundation
// пример с телеграмом
struct typle {
    var key: String
    var value: Double
}

protocol IBank{
    var id: Int { get }
    func Notify(p: [typle])
}

protocol INotifier {
    func Notify(p: [typle])
}

class Stock: INotifier{
    var subs: [IBank] = []
    
    func register(bank: IBank){
        subs.append(bank)
    }
    
    func unRegister(bank: IBank){
        for i in subs.indices{
            if subs[i].id == bank.id{
                subs.remove(at: i)
            }
        }
    }
    
    func market(){
        let rnd = Double.random(in: 1...1000)
        let euro = rnd.nextUp * 20 + 70
        let dollar = rnd.nextUp * 20 + 70
        Notify(p: [typle(key: "euro", value: euro),
                   typle(key: "dollar", value: dollar)])
    }
    
    func Notify(p: [typle]) {
        for i in subs {
            i.Notify(p: p)
        }
    }
}

class Bank: IBank{
    var id: Int = Int.random(in: 1...1000)
    
    func Notify(p: [typle]) {
        for i in p {
            print("Курс \(i.key): \(i.value) | В банке \(self.id)")
        }
    }
}
