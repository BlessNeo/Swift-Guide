//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//常量和变量必须在使用前被声明，使用关键字 let 来声明常量，使用关键字 var 来声明变量。
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

//你可以在声明一个变量或常量的时候提供类型标注，来明确变量或常量能够储存值的类型。添加类型标注的方法是在变量或常量的名字后边加一个冒号，再跟一个空格，最后加上要使用的类型名称。
var welcomeMessage: String
//声明中的冒号的意思是“是…类型”，所以上面的代码可以读作：
//“声明一个叫做 welcomMessage 的变量，他的类型是 String ”
//常量和变量的名字不能包含空白字符、数学符号、箭头、保留的（或者无效的）Unicode 码位、连线和制表符。也不能以数字开头，尽管数字几乎可以使用在名字其他的任何地方。

//一旦你声明了一个确定类型的常量或者变量，就不能使用相同的名字再次进行声明，也不能让它改存其他类型的值。常量和变量之间也不能互换。
//如果你需要使用 Swift 保留的关键字来给常量或变量命名，可以使用反引号（ ` ）包围它来作为名称。总之，除非别无选择，避免使用关键字作为名字除非你确实别无选择。
//print(_:separator:terminator:) 是一个用来把一个或者多个值用合适的方式输出的全局函数。
//Swift 中的注释和 C 的注释基本相同。单行注释用两个斜杠开头（ // ）
//多行的注释以一个斜杠加一个星号开头（ /* ），以一个星号加斜杠结尾( */ )。
//和许多其他的语言不同，Swift 并不要求你在每一句代码结尾写分号（ ; ），当然如果你想写的话也没问题。总之，如果你想在一行里写多句代码，分号还是需要的。
//Swift 提供了 8，16，32 和 64 位编码的有符号和无符号整数，这些整数类型的命名方式和 C 相似，例如 8 位无符号整数的类型是 UInt8 ，32 位有符号整数的类型是 Int32 。与 Swift 中的其他类型相同，这些整数类型也用开头大写命名法。
//你可以通过 min 和 max 属性来访问每个整数类型的最小值和最大值
let minValue = UInt8.min // 最小值是 0, 值的类型是 UInt8
let maxValue = UInt8.max // 最大值是 255, 值得类型是 UInt8
//在大多数情况下，你不需要在你的代码中为整数设置一个特定的长度。Swift 提供了一个额外的整数类型： Int ，它拥有与当前平台的原生字相同的长度
//在32位平台上， Int 的长度和 Int32 相同
//在64位平台上， Int 的长度和 Int64 相同
//除非你需操作特定长度的整数，否则请尽量在代码中使用 Int 作为你的整数的值类型。这样能提高代码的统一性和兼容性，即使在 32 位的平台上， Int 也可以存 -2,147,483,648 到 2,147,483,647 之间的任意值，对于大多数整数区间来说完全够用了。
//Swift 也提供了一种无符号的整数类型， UInt ，它和当前平台的原生字长度相同
//在32位平台上， UInt 长度和 UInt32 长度相同
//在64位平台上， UInt 长度和 UInt64 长度相同
//只在的确需要存储一个和当前平台原生字长度相同的无符号整数的时候才使用 UInt 。其他情况下，推荐使用 Int ，即使已经知道存储的值都是非负的。如同类型安全和类型推断中描述的那样，统一使用 Int  会提高代码的兼容性，同时可以避免不同数字类型之间的转换问题，也符合整数的类型推断。
//Double代表 64 位的浮点数
//Float 代表 32 位的浮点数
//Double 有至少 15 位数字的精度，而 Float 的精度只有 6 位。具体使用哪种浮点类型取决于你代码需要处理的值范围。在两种类型都可以的情况下，推荐使用 Double 类型
//当你操作不同类型的值时，类型检查能帮助你避免错误。当然，这并不意味着你得为每一个常量或变量声明一个特定的类型。如果你没有为所需要的值进行类型声明，Swift 会使用类型推断的功能推断出合适的类型。通过检查你给变量赋的值，类型推断能够在编译阶段自动的推断出值的类型。
//整数型字面量可以写作：

//一个十进制数，没有前缀
//一个二进制数，前缀是 0b
//一个八进制数，前缀是 0o
//一个十六进制数，前缀是 0x
let decimalInteger = 17
let binaryInteger = 0b10001 // 17 in binary notation
let octalInteger = 0o21 // 17 in octal notation
let hexadecimalInteger = 0x11 // 17 in hexadecimal notation
//浮点字面量可以是十进制（没有前缀）或者是十六进制（前缀是 0x ）。小数点两边必须有至少一个十进制数字（或者是十六进制的数字）。十进制的浮点字面量还有一个可选的指数，用大写或小写的 e 表示；十六进制的浮点字面量必须有指数，用大写或小写的 p 来表示。

//十进制数与 exp  的指数，结果就等于基数乘以 10exp：

//1.25e2 意味着 1.25 x 102, 或者 125.0  .
//1.25e-2  意味着 1.25 x 10-2, 或者 0.0125  .
//十六进制数与 exp 指数，结果就等于基数乘以2exp：

//0xFp2  意味着 15 x 22, 或者 60.0 .
//0xFp-2  意味着 15 x 2-2, 或者 3.75 .
//下面的这些浮点字面量的值都是十进制的 12.1875 ：
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
//数值型字面量也可以增加额外的格式使代码更加易读。整数和浮点数都可以添加额外的零或者添加下划线来增加代码的可读性。下面的这些格式都不会影响字面量的值。
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
//someType(ofInitialValue)  是调用 Swift 类型初始化器并传入一个初始值的默认方法。
//类型别名可以为已经存在的类型定义了一个新的可选名字。用 typealias 关键字定义类型别名。
//Swift 有一个基础的布尔量类型，就是 Bool ，布尔量被作为逻辑值来引用，因为他的值只能是真或者假。Swift为布尔量提供了两个常量值， true 和 false
//元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型
//任何类型的排列都可以被用来创建一个元组，他可以包含任意多的类型。例如 (Int, Int, Int) 或者 (String, Bool) ，实际上，任何类型的组合都是可以的
let http404Error = (404, "Not Found")
//你也可以将一个元组的内容分解成单独的常量或变量，这样你就可以正常的使用它们了
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// prints "The status code is 404"
print("The status message is \(statusMessage)")
// prints "The status message is Not Found"
//当你分解元组的时候，如果只需要使用其中的一部分数据，不需要的数据可以用下滑线（ _ ）代替
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// prints "The status code is 404"
//另外一种方法就是利用从零开始的索引数字访问元组中的单独元素
print("The status code is \(http404Error.0)")
// prints "The status code is 404"
print("The status message is \(http404Error.1)")
// prints "The status message is Not Found"
//在 C 和 Objective-C 中，没有可选项的概念。在 Objective-C 中有一个近似的特性，一个方法可以返回一个对象或者返回 nil 。 nil 的意思是“缺少一个可用对象”。然而，他只能用在对象上，却不能作用在结构体，基础的 C 类型和枚举值上。对于这些类型，Objective-C 会返回一个特殊的值（例如 NSNotFound ）来表示值的缺失。这种方法是建立在假设调用者知道这个特殊的值并记得去检查他。然而，Swift 中的可选项就可以让你知道任何类型的值的缺失，他并不需要一个特殊的值。
//你可以通过给可选变量赋值一个 nil 来将之设置为没有值：
var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value
//nil 不能用于非可选的常量或者变量，如果你的代码中变量或常量需要作用于特定条件下的值缺失，可以给他声明为相应类型的可选项。
//如果你定义的可选变量没有提供一个默认值，变量会被自动设置成 nil 。
var surveyAnswer: String?
// surveyAnswer is automatically set to nil
//Swift 中的 nil 和Objective-C 中的 nil 不同，在 Objective-C 中 nil 是一个指向不存在对象的指针。在 Swift中， nil 不是指针，他是值缺失的一种特殊类型，任何类型的可选项都可以设置成 nil 而不仅仅是对象类型。
//你可以利用 if 语句通过比较 nil 来判断一个可选中是否包含值。利用相等运算符 （ == ）和不等运算符（ != ）。
//如果一个可选有值，他就“不等于” nil ：
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// prints "convertedNumber contains some integer value."
//一旦你确定可选中包含值，你可以在可选的名字后面加一个感叹号 （ ! ） 来获取值，感叹号的意思就是说“我知道这个可选项里边有值，展开吧。”这就是所谓的可选值的强制展开。
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
//使用 ! 来获取一个不存在的可选值会导致运行错误，在使用!强制展开之前必须确保可选项中包含一个非 nil 的值
//可以使用可选项绑定来判断可选项是否包含值，如果包含就把值赋给一个临时的常量或者变量。可选绑定可以与 if 和 while 的语句使用来检查可选项内部的值，并赋值给一个变量或常量。
//if let constantName = someOptional {
//    statements
//}
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}
//你可以在同一个 if 语句中包含多可选项绑定，用逗号分隔即可。如果任一可选绑定结果是 nil 或者布尔值为 false ，那么整个 if 判断会被看作 false 。下面的两个 if 语句是等价的
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"
//如同提前退出中描述的那样，使用 if 语句创建的常量和变量只在if语句的函数体内有效。相反，在 guard 语句中创建的常量和变量在 guard 语句后的代码中也可用
//这种类型的可选项被定义为隐式展开可选项。通过在声明的类型后边添加一个叹号（ String! ）而非问号（  String? ） 来书写隐式展开可选项
//在可选项被定义的时候就能立即确认其中有值的情况下，隐式展开可选项非常有用。如同无主引用和隐式展开的可选属性中描述的那样，隐式展开可选项主要被用在 Swift 类的初始化过程中。

//隐式展开可选项是后台场景中通用的可选项，但是同样可以像非可选值那样来使用，每次访问的时候都不需要展开。下面的栗子展示了在访问被明确为 String  的可选项展开值时，可选字符串和隐式展开可选字符串的行为区别
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark
//你可以把隐式展开可选项当做在每次访问它的时候被给予了自动进行展开的权限，你可以在声明可选项的时候添加一个叹号而不是每次调用的时候在可选项后边添加一个叹号。
//如果你在隐式展开可选项没有值的时候还尝试获取值，会导致运行错误。结果和在没有值的普通可选项后面加一个叹号一样
//你可以像对待普通可选一样对待隐式展开可选项来检查里边是否包含一个值
if assumedString != nil {
    print(assumedString)
}
//你也可以使用隐式展开可选项通过可选项绑定在一句话中检查和展开值
if let definiteString = assumedString {
    print(definiteString)
}
//不要在一个变量将来会变为 nil 的情况下使用隐式展开可选项。如果你需要检查一个变量在生存期内是否会变为 nil ，就使用普通的可选项
//当一个函数遇到错误情况，他会抛出一个错误，这个函数的访问者会捕捉到这个错误，并作出合适的反应
func canThrowAnError() throws {
    // this function may or may not throw an error
}
//通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预置 try 关键字。

//Swift 会自动将错误传递到它们的生效范围之外，直到它们被 catch 分句处理
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
//do 语句创建了一个新的容器范围，可以让错误被传递到到不止一个的 catch 分句里

//func makeASandwich() throws {
//    // ...
//}
//
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch Error.OutOfCleanDishes {
//    washDishes()
//} catch Error.MissingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

//断言和先决条件用来检测运行时发生的事情
//断言和先决条件的不同之处在于他们什么时候做检查：断言只在 debug 构建的时候检查，但先决条件则在 debug 和生产构建中生效。在生产构建中，断言中的条件不会被计算。这就是说你可以在开发的过程当中随便使用断言而无需担心影响生产性能。
//断言会在运行的时候检查一个逻辑条件是否为 true 。顾名思义，断言可以“断言”一个条件是否为真。你可以使用断言确保在运行其他代码之前必要的条件已经被满足。如果条件判断为 true，代码运行会继续进行；如果条件判断为 false，代码运行结束，你的应用也就中止了。

//如果你的代码在调试环境下触发了一个断言，例如你在 Xcode 中创建并运行一个应用，你可以明确的知道不可用的状态发生在什么地方，还能检查断言被触发时你的应用的状态。另外，断言还允许你附加一条调试的信息。

//你可以使用全局函数 assert(_:_:)  函数来写断言。向 assert(_:_:) 函数传入一个结果为 true 或者 false 的表达式以及一条会在结果为 false 的时候显式的信息：
let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
//如果代码已经检查了条件，你可以使用 assertionFailure(_:file:line:) 函数来标明断言失败，比如
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}
//在你代码中任何条件可能潜在为假但必须肯定为真才能继续执行的地方使用先决条件。比如说，使用先决条件来检测下标没有越界，或者检测函数是否收到了一个合法的值。

//你可以通过调用 precondition(_:_:file:line:) 函数来写先决条件。给这个函数传入表达式计算为 true 或 false ，如果条件的结果是 false 信息就会显示出来。比如说：
// In the implementation of a subscript...
let index = -1
precondition(index > 0, "Index must be greater than zero.")
//你可以调用 preconditionFailure(_:file:line:) 函数来标明错误发生了——比如说，如果 switch 的默认情况被选中，但所有的合法输入数据应该被其他 switch 的情况处理。
//如果你在不检查模式编译（ -Ounchecked ），先决条件不会检查。编译器假定先决条件永远为真，并且它根据你的代码进行优化。总之， fatalError(_:file:line:) 函数一定会终止执行，无论你优化设定如何。

//你可以在草拟和早期开发过程中使用 fatalError(_:file:line:) 函数标记那些还没实现的功能，通过使用 fatalError("Unimplemented") 来作为代替。由于致命错误永远不会被优化，不同于断言和先决条件，你可以确定执行遇到这些临时占位永远会停止。

//垃圾翻译啊，看英文原版才是正理
