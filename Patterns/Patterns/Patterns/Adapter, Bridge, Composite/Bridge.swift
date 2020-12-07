import Foundation

protocol IConsole {
    func ExcuteCommand(cmd: String)
}

class Console1: IConsole{
    func ExcuteCommand(cmd: String){
        print("Console1: \(cmd)")
    }
}

class Console2: IConsole{
    func ExcuteCommand(cmd: String){
        print("Console2: \(cmd)")
    }
}

class Joystick {
    private(set) var console: IConsole?
    
    func changeConsole(_console: IConsole){
        console = _console
    }
    
    func sendX(){
        console!.ExcuteCommand(cmd: "X")
    }
    
    func sendY(){
        console!.ExcuteCommand(cmd: "Y")
    }
}

class SmartJoystick: Joystick{
    func sendSmartButton(){
        console!.ExcuteCommand(cmd: "X")
        console!.ExcuteCommand(cmd: "Y")
    }
}
