import Foundation

enum error: Error{
    case NOMoneyForTransfer
}

protocol ITransfer {
    var successor: ITransfer? { get set }
    func transfer(money: Double)throws
}

class PaymentMethod: ITransfer{
    var moneyCount: Double
    var successor: ITransfer?
    
    init(money: Double) {
        self.moneyCount = money
    }
    
    func selfTransfer(money: Double){
        
    }
    
    func transfer(money: Double)throws {
        if moneyCount < money{
            if successor != nil{
                try successor!.transfer(money: money)
            }
            else{
                throw error.NOMoneyForTransfer
            }
        }
        else{
            selfTransfer(money: money)
        }
    }
}

class TinkoffCard: PaymentMethod{
    var number: String
    
    init(money: Double, number: String) {
        self.number = number
        super.init(money: money)
    }
    
    override func selfTransfer(money: Double) {
        self.moneyCount -= money
        print("Transfer \(money) from tinkoff card \(number)")
    }
}

class PayPal: PaymentMethod{
    override init(money: Double) {
        super.init(money: money)
    }
    
    override func selfTransfer(money: Double) {
        self.moneyCount -= money
        print("Transfer \(money) from pay pal card")
    }
}
