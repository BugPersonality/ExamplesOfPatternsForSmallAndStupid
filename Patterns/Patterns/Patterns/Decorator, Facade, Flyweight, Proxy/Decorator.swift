import Foundation

protocol INotificator {
    func send(text: String)
}

class BaseNotificatorDecorator: INotificator{
    var wrappee: INotificator?
    
    init(notificator: INotificator?) {
        wrappee = notificator
    }
    
    func send(text: String) {
        wrappee?.send(text: text)
    }
}

class TelegramDecorator: BaseNotificatorDecorator {
    override init(notificator: INotificator?) {
        super.init(notificator: notificator)
    }
    override func send(text: String) {
        super.send(text: text)
        print("Send to telegram msg \(text)")
    }
}

class SmsDecorator: BaseNotificatorDecorator {
    override init(notificator: INotificator?) {
        super.init(notificator: notificator)
    }
    override func send(text: String) {
        super.send(text: text)
        print("Send to sms msg \(text)")
    }
}

class DiscordDecorator: BaseNotificatorDecorator {
    override init(notificator: INotificator?) {
        super.init(notificator: notificator)
    }
    override func send(text: String) {
        super.send(text: text)
        print("Send to discord msg \(text)")
    }
}
