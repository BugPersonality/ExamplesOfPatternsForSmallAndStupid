import Foundation

class TextEditor{
    func createCode(){
        print("Write code ...")
    }
    func saveCode(){
        print("Save code ...")
    }
}

class Compiler{
    func compile(){
        print("Compilation...")
    }
}

class Linker{
    func link(){
        print("linking...")
    }
}

class Debuger{
    func Excecute(){
        print("Executing...")
    }
    func stop(){
        print("Stop.")
    }
}

class VisualStudioFacade{
    private var textEditor = TextEditor()
    private var compiler = Compiler()
    private var linker = Linker()
    private var debugger = Debuger()
    
    func CreateCode(){
        textEditor.createCode()
    }
    
    func SaveCode(){
        textEditor.saveCode()
    }
    
    func run(){
        SaveCode()
        compiler.compile()
        linker.link()
        debugger.Excecute()
    }
    
    func stop(){
        debugger.stop()
    }
}
