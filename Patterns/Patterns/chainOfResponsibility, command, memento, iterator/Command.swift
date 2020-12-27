import Foundation

class Editor{
    var text: String?
}

protocol ICommand {
    func execute()
    func undo()
}

class Command: ICommand{
    var editor: Editor
    
    init(editor: Editor) {
        self.editor = editor
    }
    
    func execute() {
        
    }
    
    func undo() {
        
    }
}

class CopyCommand: Command{
    override init(editor: Editor) {
        super.init(editor: editor)
    }
    
    override func execute() {
        print("Copy text from editor \(editor.text!)")
    }
}

class CutCommand: Command{
    var backup: String?
    
    override init(editor: Editor) {
        super.init(editor: editor)
    }
    
    override func execute() {
        backup = editor.text!
        editor.text = nil
    }
    
    override func undo() {
        editor.text = backup
    }
}
