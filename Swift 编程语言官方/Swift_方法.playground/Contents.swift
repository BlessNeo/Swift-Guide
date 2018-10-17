//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//方法 是关联了特定类型的函数。类，结构体以及枚举都能定义实例方法，方法封装了给定类型特定的任务和功能。类，结构体和枚举同样可以定义类型方法，这是与类型本身关联的方法。类型方法与 Objective-C 中的类方法相似
//事实上在 结构体和枚举中定义方法是 Swift 语言与 C 语言和 Objective-C 的主要区别。在 Objective-C 中，类是唯一能定义方法的类型。但是在 Swift ，你可以选择无论类，结构体还是枚举，它们都拥有强大的灵活性来在你创建的类型中定义方法
//实例方法 是属于特定类实例、结构体实例或者枚举实例的函数。他们为这些实例提供功能性，要么通过提供访问和修改实例属性的方法，要么通过提供与实例目的相关的功能。实例方法与函数的语法完全相同
//要写一个实例方法，你需要把它放在对应类的花括号之间。实例方法默认可以访问同类下所有其他实例方法和属性。实例方法只能在类型的具体实例里被调用。它不能在独立于实例而被调用

class Counter {
var count = 0
func increment() {
    self.count += 1
}
func increment(by amount: Int) {
    count += amount
}
func reset() {
    count = 0
}
}

let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0
//如同函数实际参数标签和形式参数名中描述的那样，函数的形式参数可以同时拥有一个局部名称（用于函数体）和一个实际参数标签（用于调用函数的时候）。同样的，对于方法的形式参数来说也可以，因为方法就是与类型关联的函数
//每一个类的实例都隐含一个叫做 self的属性，它完完全全与实例本身相等。你可以使用 self属性来在当前实例当中调用它自身的方法。

//在上边的例子中， increment()方法可以写成这样
//func increment() {
//    self.count += 1
//}

//实际上，你不需要经常在代码中写 self。如果你没有显式地写出 self，Swift会在你于方法中使用已知属性或者方法的时候假定你是调用了当前实例中的属性或者方法。这个假定通过在 Counter的三个实例中使用 count（而不是 self.count）来做了示范

//对于这个规则的一个重要例外就是当一个实例方法的形式参数名与实例中某个属性拥有相同的名字的时候。在这种情况下，形式参数名具有优先权，并且调用属性的时候使用更加严谨的方式就很有必要了。你可以使用 self属性来区分形式参数名和属性名。
//这时， self就避免了叫做 x 的方法形式参数还是同样叫做 x 的实例属性这样的歧义
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"
//结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改
//总之，如果你需要在特定的方法中修改结构体或者枚举的属性，你可以选择将这个方法异变。然后这个方法就可以在方法中异变（嗯，改变）它的属性了，并且任何改变在方法结束的时候都会写入到原始的结构体中。方法同样可以指定一个全新的实例给它隐含的 self属性，并且这个新的实例将会在方法结束的时候替换掉现存的这个实例。

//你可以选择在 func关键字前放一个 mutating关键字来使用这个行为

struct PointMutation {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePointMutation = PointMutation(x: 1.0, y: 1.0)
somePointMutation.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePointMutation.x), \(somePointMutation.y))")
// prints "The point is now at (3.0, 4.0)"

//被添加到定义中的 mutating关键字允许它修改自身的属性
//注意，如同 常量结构体实例的存储属性 里描述的那样，你不能在常量结构体类型里调用异变方法，因为自身属性不能被改变，就算它们是变量属性
let fixedPoint = Point(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)
// this will report an error
//异变方法可以指定整个实例给隐含的 self属性
struct Point0 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point0(x: x + deltaX, y: y + deltaY)
    }
}

//枚举的异变方法可以设置隐含的 self属性为相同枚举里的不同成员
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off

//如上文描述的那样，实例方法是特定类型实例中调用的方法。你同样可以定义在类型本身调用的方法。这类方法被称作类型方法。你可以通过在 func关键字之前使用 static关键字来明确一个类型方法。类同样可以使用 class关键字来允许子类重写父类对类型方法的实现
//在 Objective-C 中，你只能在 Objective-C 的类中定义类级别的方法。但是在 Swift 里，你可以在所有的类里定义类级别的方法，还有结构体和枚举。每一个类方法都能够对它自身的类范围显式生效
//类型方法和实例方法一样使用点语法调用。不过，你得在类上调用类型方法，而不是这个类的实例
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

//在类型方法的函数体中，隐含的 self属性指向了类本身而不是这个类的实例。对于结构体和枚举，这意味着你可以使用 self来消除类型属性和类型方法形式参数之间的歧义，用法和实例属性与实例方法形式参数之间的用法完全相同
//一般来说，你在类型方法函数体内书写的任何非完全标准的方法和属性名 都将会指向另一个类级别的方法和属性。一个类型方法可以使用方法名调用另一个类型方法，并不需要使用类型名字作为前缀。同样的，结构体和枚举中的类型方法也可以通过直接使用类型属性名而不需要写类型名称前缀来访问类型属性。
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// Prints "highest unlocked level is now 2"
player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// Prints "level 6 has not yet been unlocked"
