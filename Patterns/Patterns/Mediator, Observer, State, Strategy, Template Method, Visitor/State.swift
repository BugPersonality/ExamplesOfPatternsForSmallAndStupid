import Foundation

protocol IState {
    func ActionOnPressUp()
    func ActionOnPressDown()
    func ActionOnPressBlock()
}

class Phone{
    private var state: IState?
    
    func changeState(state_: IState){
        state = state_
    }
    
    func pressUp(){
        state!.ActionOnPressUp()
    }
    
    func pressDown(){
        state!.ActionOnPressDown()
    }
    
    func pressBlock(){
        state!.ActionOnPressBlock()
    }
}

class PhoneState: IState{
    var phone: Phone
    
    init(phone: Phone) {
        self.phone = phone
    }
    
    func setPhone(phone: Phone){
        self.phone = phone
    }
    
    func ActionOnPressUp() {
    }
    
    func ActionOnPressDown() {
    }
    
    func ActionOnPressBlock() {
    }
}

class BlockedState: PhoneState{
    override init(phone: Phone) {
        super.init(phone: phone)
    }
    
    override func ActionOnPressUp() {
        print("can't use it")
    }
    
    override func ActionOnPressDown() {
        print("can't use it")
    }
    
    override func ActionOnPressBlock() {
        phone.changeState(state_: UnBlockState(phone: phone))
    }
}

class UnBlockState: PhoneState{
    override init(phone: Phone) {
        super.init(phone: phone)
    }
    
    override func ActionOnPressUp() {
        print("Voulem Up")
    }
    
    override func ActionOnPressDown() {
        print("Voulem Down")
    }
    
    override func ActionOnPressBlock() {
        phone.changeState(state_: BlockedState(phone: phone))
    }
}
