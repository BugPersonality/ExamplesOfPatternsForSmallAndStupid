import Foundation

//MARK: -Factory
print("Factory: ")
var houseDeveloper = HouseDeveloper(name: "houseDeveloper")
var building  = houseDeveloper.create()
var bathDeveloper = BathDeveloper(name: "bathDeveloper")
var building2 = bathDeveloper.create()
print("building1 : \(building.name!) | building2: \(building2.name!) \n")

//MARK: -AbstractFactory
print("AbstractFactory: ")
var elf = Hero(factory: ClassicElf())
var mag = Hero(factory: ClassicMage())
//var customHero = Hero(factory: CustomHero())

print("\(elf.movement!) | \(elf.weapon!)")
print("\(mag.movement!) | \(mag.weapon!) \n")
//print("\(customHero.movement!) | \(customHero.weapon!) \n")

//MARK: -Prototype
print("Prototype: ")
var btn = Button(width: 12, height: 30)
var button = btn.clone()
btn.height = 40
btn.width = 10
print(btn.info())
print(button.info())
print()

//MARK: -Singleton
print("Singleton: ")
var config = Config.Instance()
var cfg = Config.Instance()
print("config === cfg: \(config === cfg)\n")

//MARK: -Adapter
print("Adapter: ")
var client = Client()
var xml = XmlService()
var adapter = XmlToJsonAdapter(service: xml)
client.doWork(service: adapter)
print("The client works with json. I am converting xml to json using adapter and client is fed by adapter \n")

//MARK: -Bridge
print("Bridge: ")
var console1 = Console1()
var console2 = Console2()
var smartJoystick = SmartJoystick()

smartJoystick.changeConsole(_console: console1)
smartJoystick.sendSmartButton()
smartJoystick.changeConsole(_console: console2)
smartJoystick.sendSmartButton()
print()

//MARK: -Composite
print("Composite: ")
var fileSystem = Directory(fileName: "~/")
var diskC = Directory(fileName: "C")
var diskB = Directory(fileName: "B")
fileSystem.addDir(dir: diskB)
fileSystem.addDir(dir: diskC)
var txtFile = File(fileName: "file.txt")
var pngFile = File(fileName: "file.png")
diskB.addElement(file: txtFile)
diskC.addElement(file: pngFile)
fileSystem.display()
print()

//MARK: -Decorator
print("Decorator: ")
var notifier: INotificator = BaseNotificatorDecorator(notificator: nil)
var needSms: Bool = true
var needTelegram: Bool = true
var needDiscord: Bool = true
if needSms{
    notifier = SmsDecorator(notificator: notifier)
}
if needTelegram{
    notifier = TelegramDecorator(notificator: notifier)
}
if needDiscord{
    notifier = DiscordDecorator(notificator: notifier)
}
notifier.send(text: "hello world!")
print()

//MARK: -Facade
print("Facade: ")
var ide = VisualStudioFacade()
ide.CreateCode()
ide.run()
ide.stop()
print()

//MARK: -Flyweight
print("Flyweight: ")

var factory = FactoryExercise()
var ex = factory.get(id: 2)
var workout = Workout(ex: ex)
workout.doIt()
print()

//MARK: -Proxy
print("Proxy: ")
var downloader = CachedDownloader(downloader: YouTubeDownloader())
var a = downloader.download(url: "www.pornohub")
var b = downloader.download(url: "www.")
var c = downloader.download(url: "www.")
print()

//MARK: -ChainOfResponsibility
print("ChainOfResponsibility: ")
var tinkoff1: ITransfer = TinkoffCard(money: 10000, number: "1111 0000 2222 3333")
var tinkoff2: ITransfer = TinkoffCard(money: 30000, number: "2222 0000 2222 3333")
var payPal1: ITransfer = PayPal(money: 40000)

var handler: ITransfer = tinkoff1
tinkoff1.successor = payPal1
payPal1.successor = tinkoff2

do {
    try handler.transfer(money: 30000)
    try handler.transfer(money: 10000)
    try handler.transfer(money: 40000)
    try handler.transfer(money: 50000)
}
catch {
    print(error)
}
print()

//MARK: -Command
print("Command: ")
var editor: Editor = Editor()
editor.text = "Hello world!"

var stackCommands: [ICommand] = []

print(editor.text!)
var cmd = CutCommand(editor: editor)
cmd.execute()
stackCommands.append(cmd)
print(editor.text as Any)
stackCommands.last?.undo()
stackCommands.removeLast()
print(editor.text!)
print()

//MARK: -Memento
print("Memento: ")
var history: [HeroMemento] = []
var heroMemento = MHero()
history.append(heroMemento.save())
try heroMemento.shoot()
try heroMemento.shoot()
try heroMemento.shoot()
try heroMemento.shoot()
heroMemento.restore(to: history.last!)
history.removeLast()
try heroMemento.shoot()
try heroMemento.shoot()
print()

//MARK: -Iterator
print("Iterator: ")

var lib = Library()
lib.books.append(Book(name: "1 book"))
lib.books.append(Book(name: "2 book"))
lib.books.append(Book(name: "3 book"))
var it = lib.iterator()

while it.hasNext(){
    let b = it.next()
    print(b.name)
}
print()

//MARK: -Mediator
print("Mediator:")

var manager = Manager()
var customer = Customer(mediator: manager)
var developer = MDeveloper(mediator: manager)
var tester = Tester(mediator: manager)
manager.customer = customer
manager.developer = developer
manager.tester = tester

customer.send(msg: "хочу фичу")
developer.send(msg: "Готово можно тестить")
tester.send(msg: "Все ок, деплоим")
print()

//MARK: -Observer
print("Observer:")
var stock = Stock()
var bank1 = Bank()
var bank2 = Bank()

stock.register(bank: bank1)
stock.register(bank: bank2)
stock.market()
print()

//MARK: -State
print("State:")
var phone = Phone()
phone.changeState(state_: BlockedState(phone: phone))

phone.pressUp()
phone.pressDown()
phone.pressBlock()
phone.pressUp()
phone.pressDown()
print()


//MARK: -Strategy
print("Strategy:")
var app = MapApp(planner: WalkPlanner())
var pointA = Point()
var pointB = Point()

let _  = app.buildTrack(a: pointA, b: pointB)
app.setPlanner(planner_: CarPlanner())
let _ = app.buildTrack(a: pointA, b: pointB)
print()


//MARK: -TemplateMethod
print("TemplateMethod:")
var myHuman = Human()
var monster = Monster()
myHuman.turn()
monster.turn()
print()

//MARK: -Visitor
print("Visitor:")

var company = Company()
company.add(v: Admin())
company.add(v: User())
company.add(v: StuffInSystem())

var htmlVisitor = HtmVisitor()
company.accept(visitor: htmlVisitor)
print(htmlVisitor.report())
