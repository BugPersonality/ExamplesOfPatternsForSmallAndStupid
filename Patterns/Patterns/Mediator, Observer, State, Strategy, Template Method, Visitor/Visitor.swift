import Foundation
//пример с дотой и зевсом
protocol IVisitor {
    func visit(admin: Admin)
    func visit(user: User)
    func visit(staff: StuffInSystem)
}

protocol Ivisitable {
    func accept(visitor: IVisitor)
}

class Admin: Ivisitable{
    var info: String = "Admin"
    
    func accept(visitor: IVisitor) {
        visitor.visit(admin: self)
    }
}

class User: Ivisitable{
    var info: String = "User"
    
    func accept(visitor: IVisitor) {
        visitor.visit(user: self)
    }
}

class StuffInSystem: Ivisitable{
    var info: String = "StuffInSystem"
    
    func accept(visitor: IVisitor) {
        visitor.visit(staff: self)
    }
}

class HtmVisitor: IVisitor{
    var data: String = ""
    
    func visit(admin: Admin) {
        self.data += "<p>\(admin.info)<p> "
    }
    
    func visit(user: User) {
        self.data += "<p>\(user.info)<p> "
    }
    
    func visit(staff: StuffInSystem) {
        self.data += "<p>\(staff.info)<p> "
    }
    
    func report() -> String{
        return self.data
    }
}

class Company{
    var participant: [Ivisitable] = []
    
    func add(v: Ivisitable){
        participant.append(v)
    }
    
    func remove(v: Ivisitable){
        participant.removeFirst()
    }
    
    func accept(visitor: IVisitor){
        for i in participant{
            i.accept(visitor: visitor)
        }
    }
    
}
