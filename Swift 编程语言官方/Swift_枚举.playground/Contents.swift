	
//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
//如果你熟悉 C ，那么你可能知道 C 中的枚举会给一组整数值分配相关的名称。Swift 中的枚举则更加灵活，并且不需给枚举中的每一个成员都提供值。如果一个值（所谓“原始”值）要被提供给每一个枚举成员，那么这个值可以是字符串、字符、任意的整数值，或者是浮点类型

//你可以用 enum关键字来定义一个枚举，然后将其所有的定义内容放在一个大括号（ {}）中
enum SomeEnumeration {
    // enumeration definition goes here
}
enum CompassPoint0 {
    case north
    case south
    case east
    case west
}
//在一个枚举中定义的值（比如： north， south， east和 west）就是枚举的成员值（或成员） case关键字则明确了要定义成员值
//不像 C 和 Objective-C 那样，Swift 的枚举成员在被创建时不会分配一个默认的整数值。在上文的 CompassPoint例子中， north， south， east和 west并不代表 0， 1， 2和 3。而相反，不同的枚举成员在它们自己的权限中都是完全合格的值，并且是一个在 CompassPoint中被显式定义的类型
//多个成员值可以出现在同一行中，要用逗号隔开
enum Planet0 {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//每个枚举都定义了一个全新的类型。正如 Swift 中其它的类型那样，它们的名称（例如： CompassPoint和 Planet）需要首字母大写。给枚举类型起一个单数的而不是复数的名字，从而使得它们能够顾名思义
var directionToHead = CompassPoint0.west
//当与 CompassPoint中可用的某一值一同初始化时 directionToHead的类型会被推断出来。一旦 directionToHead以 CompassPoint类型被声明，你就可以用一个点语法把它设定成不同的 CompassPoint值
directionToHead = .east
//directionToHead的类型是已知的，所以当设定它的值时你可以不用写类型。这样做可以使得你在操作确定类型的枚举时让代码非常易
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// prints "Watch out for penguins"
let somePlanet = Planet0.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
// Prints "Mostly harmless"
//对于某些枚举来说，如果能有一个集合包含了枚举的所有情况就好了。你可以通过在枚举名字后面写 : CaseIterable 来允许枚举被遍历。Swift 会暴露一个包含对应枚举类型所有情况的集合名为 allCases 。下面是例子

//enum Beverage: CaseIterable {
//    case coffee, tea, juice
//}
//let numberOfChoices = Beverage.allCases.count
//print("\(numberOfChoices) beverages available")
    
// Prints "3 beverages available"
//在上面的例子中，你写了一个 Beverage.allCases 来访问包含 Beverage 枚举所有情况的集合。你可以把 allCases 当成和其他任意集合——集合的元素就是枚举类型的实例，所以在这里就是 Beverage 的值。上面的例子计数了有多少个情况，然后下面的例子使用 for 循环来遍历所有情况
    
//    for beverage in Beverage.allCases {
//        print(beverage)
//    }
    
    //上面例子中使用的语法是标记枚举遵循 CaseIterable 协议
    
    enum Barcode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    //“定义一个叫做 Barcode的枚举类型，它要么用 (Int, Int, Int, Int)类型的关联值获取 upc 值，要么用 String 类型的关联值获取一个 qrCode的值。”
    
    var productBarcode = Barcode.upc(8, 85909, 51226, 3)
    
    productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
    
    //这时，最初的 Barcode.upc和它的整数值将被新的 Barcode.qrCode和它的字符串值代替。 Barcode类型的常量和变量可以存储一个 .upc或一个 .qrCode（和它们的相关值一起存储）中的任意一个，但是它们只可以在给定的时间内存储它们它们其中之一
    
    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
    }
    // Prints "QR code: ABCDEFGHIJKLMNOP."
    
    //如果对于一个枚举成员的所有的相关值都被提取为常量，或如果都被提取为变量，为了简洁，你可以用一个单独的 var或 let在成员名称前标注
    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
    }
    // Prints "QR code: ABCDEFGHIJKLMNOP."
    
    //关联值中条形码的栗子展示了枚举成员是如何声明它们存储不同类型的相关值的。作为相关值的另一种选择，枚举成员可以用相同类型的默认值预先填充（称为原始值）
    enum ASCIIControlCharacter: Character {
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    //原始值与关联值不同。原始值是当你第一次定义枚举的时候，它们用来预先填充的值，正如上面的三个 ASCII 码。特定枚举成员的原始值是始终相同的。关联值在你基于枚举成员的其中之一创建新的常量或变量时设定，并且在你每次这么做的时候这些关联值可以是不同的。
    
    //当你在操作存储整数或字符串原始值枚举的时候，你不必显式地给每一个成员都分配一个原始值。当你没有分配时，Swift 将会自动为你分配值。
    
    //实际上，当整数值被用于作为原始值时，每成员的隐式值都比前一个大一。如果第一个成员没有值，那么它的值是 0
    
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
    
    //在上面的例子中， Planet.mercury有一个明确的原始值 1 ， Planet.venus的隐式原始值是 2
    //当字符串被用于原始值，那么每一个成员的隐式原始值则是那个成员的名称
    enum CompassPoint: String {
        case north, south, east, west
    }
    //在上面的例子中， CompassPoint.south有一个隐式原始值 "south" ，以此类推
    //你可以用 rawValue属性来访问一个枚举成员的原始值
    let earthsOrder = Planet.earth.rawValue
    // earthsOrder is 3
    
    let sunsetDirection = CompassPoint.west.rawValue
    // sunsetDirection is "west"
    //如果你用原始值类型来定义一个枚举，那么枚举就会自动收到一个可以接受原始值类型的值的初始化器（叫做 rawValue的形式参数）然后返回一个枚举成员或者 nil 。你可以使用这个初始化器来尝试创建一个枚举的新实例
    let possiblePlanet = Planet(rawValue: 7)
    // possiblePlanet is of type Planet? and equals Planet.Uranus
    //总之，不是所有可能的 Int值都会对应一个行星。因此原始值的初始化器总是返回可选的枚举成员。在上面的例子中， possiblePlanet的类型是 Planet? ，或者“可选项 Planet”
    //原始值初始化器是一个可失败初始化器，因为不是所有原始值都将返回一个枚举成员
    //如果你尝试寻找有位置 11的行星，那么被原始值初始化器返回的可选项 Planet值将会是 nil
    let positionToFind = 11
    if let somePlanet = Planet(rawValue: positionToFind) {
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }
    // Prints "There isn't a planet at position 11"
//递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的。
