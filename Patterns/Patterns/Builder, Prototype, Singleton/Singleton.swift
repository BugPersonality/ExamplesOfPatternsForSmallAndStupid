import Foundation

class Config{
    
    static var _config: Config?
    
    private init(){
        
    }
    
    static func Instance() -> Config{
        if _config == nil{
            _config = Config()
        }
        return _config!
    }
}
