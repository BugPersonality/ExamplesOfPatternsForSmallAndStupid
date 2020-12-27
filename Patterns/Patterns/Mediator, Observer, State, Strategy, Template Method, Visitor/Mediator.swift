import Foundation

class Mediator{
    func send(msg: String, p: Participant){
        
    }
}

class Participant{
    var _mediator: Mediator
    var index: Int = Int.random(in: 1...1000)
    
    init(mediator: Mediator) {
        _mediator = mediator
    }
    
    func send(msg: String){
        _mediator.send(msg: msg, p: self)
    }
    
    func receive(msg: String){
        
    }
}

class Customer: Participant{
    override init(mediator: Mediator) {
        super.init(mediator: mediator)
    }
    
    override func receive(msg: String) {
        print("Сообщение заказчику: \(msg)")
    }
}

class MDeveloper: Participant{
    override init(mediator: Mediator) {
        super.init(mediator: mediator)
    }
    
    override func receive(msg: String) {
        print("Сообщение девелоперу: \(msg)")
    }
}

class Tester: Participant{
    override init(mediator: Mediator) {
        super.init(mediator: mediator)
    }
    
    override func receive(msg: String) {
        print("Сообщение тестировщику: \(msg)")
    }
}

class Manager: Mediator{
    var customer: Customer?
    var developer: MDeveloper?
    var tester: Tester?
    
    override func send(msg: String, p: Participant) {
        if tester?.index == p.index{
            customer?.receive(msg: msg)
        }
        else if developer?.index == p.index{
            tester?.receive(msg: msg)
        }
        else if customer?.index == p.index{
            developer?.receive(msg: msg)
        }
    }
}
