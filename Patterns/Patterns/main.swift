import Foundation

// Factory
print("Factory: ")
var houseDeveloper = HouseDeveloper(name: "houseDeveloper")
var building  = houseDeveloper.create()
var bathDeveloper = BathDeveloper(name: "bathDeveloper")
var building2 = bathDeveloper.create()
print("building1 : \(building.name!) | building2: \(building2.name!) \n")

//AbstractFactory
print("AbstractFactory: ")
var elf = Hero(factory: ClassicElf())
var mag = Hero(factory: ClassicMage())
//var customHero = Hero(factory: CustomHero())

print("\(elf.movement!) | \(elf.weapon!)")
print("\(mag.movement!) | \(mag.weapon!) \n")
//print("\(customHero.movement!) | \(customHero.weapon!) \n")

//Prototype
print("Prototype: ")
var btn = Button(width: 12, height: 30)
var button = btn.clone()
print(button.info())
print()

//Singleton
print("Singleton: ")
var config = Config.Instance()
var cfg = Config.Instance()
print("config === cfg: \(config === cfg)\n")

//Prototype
print("Prototype: ")
var client = Client()
var xml = XmlService()
var adapter = XmlToJsonAdapter(service: xml)
client.doWork(service: adapter)
print("The client works with json. I am converting xml to json using adapter and client is fed by adapter \n")

//Bridge
print("Bridge: ")
var console1 = Console1()
var console2 = Console2()
var smartJoystick = SmartJoystick()

smartJoystick.changeConsole(_console: console1)
smartJoystick.sendSmartButton()
smartJoystick.changeConsole(_console: console2)
smartJoystick.sendSmartButton()
print()

//Composite
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

//Decorator
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

//Facade
print("Facade: ")
var ide = VisualStudioFacade()
ide.CreateCode()
ide.run()
ide.stop()
print()

//Flyweight
print("Flyweight: ")

var factory = FactoryExercise()
var ex = factory.get(id: 2)
var workout = Workout(ex: ex)
workout.doIt()
print()

//Proxy
print("Proxy: ")
var downloader = CachedDownloader(downloader: YouTubeDownloader())
var a = downloader.download(url: "www.pornohub")
var b = downloader.download(url: "www.")
var c = downloader.download(url: "www.")
