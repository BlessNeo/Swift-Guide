//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//Dictionary 中的元素没有必要安照它们写入的顺序遍历出来。 Dictionary 的内容内在无序，并且不在取回遍历时保证有序。需要注意的是，你给 Dictionary 插入元素的次序并不能代表你遍历时候的顺序
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
//如果你不需要序列的每一个值，你可以使用下划线来取代遍历名以忽略值
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
//下划线字符 _ （在循环变量那里使用的那个）导致单个值被忽略并且不需要在每次遍历循环中提供当前值的访问
let minutes = 60
for _ in 0..<minutes {
    // render the tick mark each minute (60 times)
}
//有些用户可能想要在他们的UI上少来点分钟标记。比如说每 5 分钟一个标记吧。使用 stride(from:to:by:) 函数来跳过不想要的标记
//很明显没有包括60 类似开区间0..<60
let minuteInterval = 5
for _ in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
}
//闭区间也同样适用，使用 stride(from:through:by:) 即可
//类似于0...12
let hours = 12
let hourInterval = 3
for _ in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}
//while 循环执行一个合集的语句指导条件变成 false 。这种循环最好在第一次循环之后还有未知数量的遍历时使用。Swift 提供了两种 while 循环
//while 在每次循环开始的时候计算它自己的条件；
//repeat-while 在每次循环结束的时候计算它自己的条件
//while 循环通过判断单一的条件开始。如果条件为 true ，语句的合集就会重复执行直到条件变为 false 。

//这里是一个 while 循环的通用格式：
//while condition {
    
//    statements
    
//}
//while 循环在这个情况当中合适是因为开始 while 循环之后游戏的长度并不确定。循环会一直执行下去直到特定的条件不满足
//while 循环的另一种形式，就是所谓的 repeat-while 循环，在判断循环条件之前会执行一次循环代码块。然后会继续重复循环直到条件为 false
//Swift 的 repeat-while 循环是与其他语言中的 do-while 循环类似的
//repeat {
//    statements
//} while condition
//每一个 switch 情况函数体都是独立的代码执行分支，与 if 语句的分支差不多。 switch 语句决定那个分支应该被选取。这就是所谓的在给定的值之间选择
//相比 C 和 Objective-C 里的 switch 语句来说，Swift 里的 switch 语句不会默认从每个情况的末尾贯穿到下一个情况里。相反，整个 switch 语句会在匹配到第一个 switch 情况执行完毕之后退出，不再需要显式的 break 语句。这使得 switch 语句比 C 的更安全和易用，并且避免了意外地执行多个 switch 情况
//在一个 switch 情况中匹配多个值可以用逗号分隔，并且可以写成多行，如果列表太长的话
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
//如同在贯穿中描述的那样，要在特定的 switch 情况中使用贯穿行为，使用 fallthrough 关键字
//switch情况的值可以在一个区间中匹配。这个栗子使用了数字区间来为语言中的数字区间进行转换
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
//你可以使用元组来在一个 switch 语句中测试多个值。每个元组中的元素都可以与不同的值或者区间进行匹配。另外，使用下划线（ _）来表明匹配所有可能的值。
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
//switch 情况可以将匹配到的值临时绑定为一个常量或者变量，来给情况的函数体使用。这就是所谓的值绑定，因为值是在情况的函数体里“绑定”到临时的常量或者变量的
let anotherPoint = (2, 0)
switch anotherPoint {
case (var x, 0):
    x = 3
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//在上边的栗子中， x 和 y 被 let 关键字声明为常量，因为它们没有必要在情况体内被修改。总之，它们也可以用变量来声明，使用 var 关键字。如果这么做，临时的变量就会以合适的值来创建并初始化。对这个变量的任何改变都只会在情况函数体内有效
//switch 情况可以使用 where 分句来检查额外的情况
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
//多个 switch 共享同一个函数体的多个情况可以在 case 后写多个模式来复合，在每个模式之间用逗号分隔。如果任何一个模式匹配了，那么这个情况都会被认为是匹配的。如果模式太长，可以把它们写成多行，比如说
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
//复合情况同样可以包含值绑定。所有复合情况的模式都必须包含相同的值绑定集合，并且复合情况中的每一个绑定都得有相同的类型格式。这才能确保无论复合情况的那部分匹配了，接下来的函数体中的代码都能访问到绑定的值并且值的类型也都相同
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
//控制转移语句在你代码执行期间改变代码的执行顺序，通过从一段代码转移控制到另一段。Swift 拥有五种控制转移语句

//continue
//
//break
//
//fallthrough
//
//return
//
//throw

//continue 语句告诉循环停止正在做的事情并且再次从头开始循环的下一次遍历。它是说“我不再继续当前的循环遍历了”而不是离开整个的循环
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
// Prints "grtmndsthnklk"
//break 语句会立即结束整个控制流语句。当你想要提前结束 switch 或者循环语句或者其他情况时可以在 switch 语句或者循环语句中使用 break 语句
//当在switch语句里使用时， break 导致 switch 语句立即结束它的执行，并且转移控制到 switch 语句结束花括号（ } ）之后的第一行代码上。

//这可以用来在一个 switch 语句中匹配和忽略一个或者多个情况。因为 Swift 的 switch 语句是穷尽且不允许空情况的，所以有时候有必要故意匹配和忽略一个匹配到的情况以让你的意图更加明确。要这样做的话你可以通过把 break 语句作为情况的整个函数体来忽略某个情况。当这个情况通过 switch 语句匹配到了，情况中的 break 语句会立即结束 switch 语句的执行。
//switch 的情况如果只包含注释的话会导致编译时错误。注释不是语句，并且不会导致 switch 情况被忽略。要使用 break 语句来忽略 switch 情况
//Swift 中的 Switch 语句不会从每个情况的末尾贯穿到下一个情况中。相反，整个 switch 语句会在第一个匹配到的情况执行完毕之后就直接结束执行。比较而言，C 你在每一个 switch 情况末尾插入显式的 break 语句来阻止贯穿。避免默认贯穿意味着 Swift 的 switch 语句比 C 更加清晰和可预料，并且因此它们避免了意外执行多个 switch 情况。

//如果你确实需要 C 风格的贯穿行为，你可以选择在每个情况末尾使用 fallthrough 关键字
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// prints "The number 5 is a prime number, and also an integer."
//这个栗子声明了一个新的 String 变量叫做 description 并且赋值给它一个初始值。然后函数使用一个 switch 语句来判断 integerToDescribe 。如果 integerToDescribe 是一个列表中的质数，函数就在 description 的末尾追加文字，来标记这个数字是质数。然后它使用 fallthrough 关键字来“贯穿到” default 情况。 default 情况添加额外的文字到描述的末尾，接着 switch 语句结束
//fallthrough 关键字不会为switch情况检查贯穿入情况的条件。 fallthrough 关键字只是使代码执行直接移动到下一个情况（或者 default 情况）的代码块中，就像C的标准 switch 语句行为一样
//通过把标签作为关键字放到语句开头来用标签标记一段语句，后跟冒号。这里是一个对 while 循环使用标签的栗子，这个原则对所有的循环和 switch 语句来说都相同
//label name: while condition {
//    statements
//}
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
//如果上边的 break 语句不使用 gameLoop 标签，它就会中断 switch 语句而不是 while 语句。使用 gameLoop 标签使得要结束那个控制语句变得清晰明了。

//同时注意当调用 continue gameLoop 来跳入下一次循环并不是强制必须使用 gameLoop 标签的。游戏里只有一个循环，所以 continue 对谁生效是不会有歧义的。总之，配合 continue 使用 gameLoop 也无伤大雅。一直在 break 语句里写标签会让游戏的逻辑更加清晰和易读。
//guard 语句，类似于 if 语句，基于布尔值表达式来执行语句。使用 guard 语句来要求一个条件必须是真才能执行 guard 之后的语句。与 if 语句不同， guard 语句总是有一个 else 分句—— else 分句里的代码会在条件不为真的时候执行
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."
//如果 guard 语句的条件被满足，代码会继续执行直到 guard 语句后的花括号。任何在条件中使用可选项绑定而赋值的变量或者常量在 guard 所在的代码块中随后的代码里都是可用的。

//如果这个条件没有被满足，那么在 else 分支里的代码就会被执行。这个分支必须转移控制结束 guard 所在的代码块。要这么做可以使用控制转移语句比如 return ， break ， continue 或者 throw ，或者它可以调用一个不带有返回值的函数或者方法，比如 fatalError() 。
    
//相对于使用 if 语句来做同样的事情，为需求使用 guard 语句来提升你代码的稳定性。它会让正常地写代码而不用把它们包裹进 else 代码块，并且它允许你保留在需求之后处理危险的需求
//Swift 拥有内置的对 API 可用性的检查功能，它能够确保你不会悲剧地使用了对部属目标不可用的 API。

//编译器在 SDK 中使用可用性信息来确保在你项目中明确的 API 都是可用的。如果你尝试使用一个不可用的 API 的话，Swift 会在编译时报告一个错误。

//你可以在 if 或者 guard 语句中使用一个可用性条件来有条件地执行代码，基于在运行时你想用的哪个 API 是可用的。当验证在代码块中的 API 可用性时，编译器使用来自可用性条件里的信息来检查
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
//上边的可用性条件确定了在 iOS 平台， if 函数体只在 iOS 10 及以上版本才会执行；对于 macOS 平台，在只有在 macOS 10.12 及以上版本才会运行。最后一个实际参数， * ，它需求并表明在其他所有平台， if 函数体执行你在目标里明确的最小部属。

//在这个通用的格式中，可用性条件接收平台的名称和版本列表。你可以使用 iOS，macOS 和 watchOS 来作为平台的名字。要说明额外的特定主版本号则使用类似 iOS 8 这样的名字，你可以明确更小一点的版本号比如 iOS 8.3 和 macOS 10.10.3

//if #available(platform name version, ..., *) {
//    statements to execute if the APIs are available
//} else {
//    fallback statements to execute if the APIs are unavailable
//}
