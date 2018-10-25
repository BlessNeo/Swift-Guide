import UIKit

//协议为方法、属性、以及其他特定的任务需求或功能定义蓝图。协议可被类、结构体、或枚举类型采纳以提供所需功能的具体实现。满足了协议中需求的任意类型都叫做遵循了该协议。

//除了指定遵循类型必须实现的要求外，你可以扩展一个协议以实现其中的一些需求或实现一个符合类型的可以利用的附加功能。
//协议的语法
//定义协议的方式与类、结构体、枚举类型非常相似
//protocol SomeProtocol {
//    // protocol definition goes here
//}
//在自定义类型声明时，将协议名放在类型名的冒号之后来表示该类型采纳一个特定的协议。多个协议可以用逗号分开列出
//struct SomeStructure: FirstProtocol, AnotherProtocol {
// structure definition goes here
//}
//若一个类拥有父类，将这个父类名放在其采纳的协议名之前，并用逗号分隔
//class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
// class definition goes here
//}
//属性要求
//协议可以要求所有遵循该协议的类型提供特定名字和类型的实例属性或类型属性。协议并不会具体说明属性是储存型属性还是计算型属性——它只具体要求属性有特定的名称和类型。协议同时要求一个属性必须明确是可读的或可读的和可写的。

//若协议要求一个属性为可读和可写的，那么该属性要求不能用常量存储属性或只读计算属性来满足。若协议只要求属性为可读的，那么任何种类的属性都能满足这个要求，而且如果你的代码需要的话，该属性也可以是可写的。

//属性要求定义为变量属性，在名称前面使用 var 关键字。可读写的属性使用 { get set } 来写在声明后面来明确，使用 { get } 来明确可读的属性。
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
//在协议中定义类型属性时在前面添加 static 关键字。当类的实现使用 class 或 static 关键字前缀声明类型属性要求时，这个规则仍然适用
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

//这里是一个只有一个实例属性要求的协议
protocol FullyNamed {
    var fullName: String { get }
}
//上面 FullyNamed 协议要求遵循的类型提供一个完全符合的名字。这个协议并未指定遵循类型的其他任何性质——它只要求这个属性必须为其自身提供一个全名。协议申明了所有 FullyNamed 类型必须有一个可读实例属性 fullName ，且为 String 类型

struct Person: FullyNamed {
    var fullName: String
    
}

let john = Person(fullName: "John Appleseed")
print(john.fullName)
//每一个 Person 的实例都有一个名为 fullName 的 String 类型储存属性。这符合了 FullyNamed 协议的单一要求，并且表示 Person 已经正确地遵循了该协议。（若协议的要求没有完全达标，Swift 在编译时会报错。）

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)
//这个类为一艘星舰实现了 fullName 计算型只读属性的要求。每一个 Starship 类的实例储存了一个不可选的 name 属性以及一个可选的 prefix 属性。当 prefix 值存在时， fullName 将 prefix 放在 name 之前以创建星舰的全名
//方法要求
//协议可以要求采纳的类型实现指定的实例方法和类方法。这些方法作为协议定义的一部分，书写方式与正常实例和类方法的方式完全相同，但是不需要大括号和方法的主体。允许变量拥有参数，与正常的方法使用同样的规则。但在协议的定义中，方法参数不能定义默认值。

//正如类型属性要求的那样，当协议中定义类型方法时，你总要在其之前添加 static 关键字。即使在类实现时，类型方法要求使用 class 或 static 作为关键字前缀，前面的规则仍然适用：
protocol SomeFuncProtocol {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

//异变方法要求
//有时一个方法需要改变（或异变）其所属的实例。例如值类型的实例方法（即结构体或枚举），在方法的 func 关键字之前使用 mutating 关键字，来表示在该方法可以改变其所属的实例，以及该实例的所有属性。这一过程写在了在实例方法中修改值类型中
//若你定义了一个协议的实例方法需求，想要异变任何采用了该协议的类型实例，只需在协议里方法的定义当中使用 mutating 关键字。这允许结构体和枚举类型能采用相应协议并满足方法要求。
//如果你在协议中标记实例方法需求为 mutating ，在为类实现该方法的时候不需要写 mutating 关键字。 mutating 关键字只在结构体和枚举类型中需要书写
protocol Togglable {
    mutating func toggle()
}
//若使用结构体或枚举实现 Togglable 协议，这个结构体或枚举可以通过使用 mutating 标记这个 toggle() 方法，来保证该实现符合协议要求
enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

//初始化器要求
//协议可以要求遵循协议的类型实现指定的初始化器。和一般的初始化器一样，只用将初始化器写在协议的定义当中，只是不用写大括号也就是初始化器的实体
protocol SomeInitProtocol {
    init(someParameter: Int)
}

//协议初始化器要求的类实现
//你可以通过实现指定初始化器或便捷初始化器来使遵循该协议的类满足协议的初始化器要求。在这两种情况下，你都必须使用 required 关键字修饰初始化器的实现
class SomeClass: SomeInitProtocol {
    required init(someParameter: Int) {
        // initializer implementation goes here
    }
}

//在遵循协议的类的所有子类中， required 修饰的使用保证了你为协议初始化器要求提供了一个明确的继承实现
//由于 final 的类不会有子类，如果协议初始化器实现的类使用了 final 标记，你就不需要使用 required 来修饰了。因为这样的类不能被继承子类。详见阻止重写了解更多 final 修饰符的信息
//如果一个子类重写了父类指定的初始化器，并且遵循协议实现了初始化器要求，那么就要为这个初始化器的实现添加 required 和 override 两个修饰符
protocol Some0Protocol {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

class SomeSubClass: SomeSuperClass, Some0Protocol {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        
    }
}

//可失败初始化器要求
//如同可失败初始化器定义的一样，协议可以为遵循该协议的类型定义可失败的初始化器。

//遵循协议的类型可以使用一个可失败的或不可失败的初始化器满足一个可失败的初始化器要求。不可失败初始化器要求可以使用一个不可失败初始化器或隐式展开的可失败初始化器满足。(😟)
//将协议作为类型
//实际上协议自身并不实现功能。不过你创建的任意协议都可以变为一个功能完备的类型在代码中使用
//由于它是一个类型，你可以在很多其他类型可以使用的地方使用协议，包括
//在函数、方法或者初始化器里作为形式参数类型或者返回类型；
//作为常量、变量或者属性的类型；
//作为数组、字典或者其他存储器的元素的类型
//由于协议是类型，要开头大写（比如说 FullyNamed 和 RandomNumberGenerator ）来匹配 Swift 里其他类型名称格式（比如说 Int 、 String 还有 Double ）
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

//委托
//委托[1]是一个允许类或者结构体放手（或者说委托）它们自身的某些责任给另外类型实例的设计模式。这个设计模式通过定义一个封装了委托责任的协议来实现，比如遵循了协议的类型（所谓的委托）来保证提供被委托的功能。委托可以用来响应一个特定的行为，或者从外部资源取回数据而不需要了解资源具体的类型。
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnackAndadders: DiceGame {
    let finalSquare = 25
    let dice: Dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare{
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
    
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnackAndadders {
            print("Started a new game of Snacks And Ladders")
        }
        print("The game is using a \(game.dice.sides) -sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnackAndadders()
game.delegate = tracker
game.play()

//在扩展里添加协议遵循
//你可以扩展一个已经存在的类型来采纳和遵循一个新的协议，就算是你无法访问现有类型的源代码也行。扩展可以添加新的属性、方法和下标到已经存在的类型，并且因此允许你添加协议需要的任何需要。
//类型已经存在的实例会在给它的类型扩展中添加遵循协议时自动地采纳和遵循这个协议。
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

//任何 Dice 实例现在都可以被视作 TextRepresentable
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)
//类似地， SnakesAndLadders 游戏类可以扩展来采纳和遵循 TextRepresentable 协议
extension SnackAndadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snacks and Ladders with \(finalSquare) squares"
    }
    
}

print(game.textualDescription)
//有条件地遵循协议
//泛型类型可能只在某些情况下满足一个协议的要求，比如当类型的泛型形式参数遵循对应协议时。你可以通过在扩展类型时列出限制让泛型类型有条件地遵循某协议。在你采纳协议的名字后面写泛型 where 分句。
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let myDice = [d6, d12]
print(myDice.textualDescription)
//使用扩展声明采纳协议
//如果一个类型已经遵循了协议的所有需求，但是还没有声明它采纳了这个协议，你可以让通过一个空的扩展来让它采纳这个协议
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable{}
let simonTheHamster = Hamster(name: "Simon")
let somethingTextReprentable: TextRepresentable = simonTheHamster
print(somethingTextReprentable.textualDescription)
//注意类型不会因为满足需要就自动采纳协议。它们必须显式地声明采纳了哪个协议
//协议类型的集合
//协议可以用作储存在集合比如数组或者字典中的类型，如同在协议作为类型（此处应有链接）。这个例子创建了一个 TextRepresentable 实例的数组
let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}

//协议继承

