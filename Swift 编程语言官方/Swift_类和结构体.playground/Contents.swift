//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//不像其他的程序语言，Swift不需要你为自定义类和结构体创建独立的接口和实现文件。在 Swift 中，你在一个文件中定义一个类或者结构体， 则系统将会自动生成面向其他代码的外部接口
//一个类的实例通常被称为对象。总之，Swift 的类和结构体在功能上要比其他语言中的更加相近，并且本章节所讨论的大部分功能都可以同时用在类和结构体的实例上。因此，我们使用更加通用的术语实例
//在 Swift 中类和结构体有很多共同之处，它们都能
//定义属性用来存储值；
//定义方法用于提供功能；
//定义下标脚本用来允许使用下标语法访问值；
//定义初始化器用于初始化状态；
//可以被扩展来默认所没有的功能；
//遵循协议来针对特定类型提供标准功能。

//类有而结构体没有的额外功能
//继承允许一个类继承另一个类的特征;
//类型转换允许你在运行检查和解释一个类实例的类型；
//反初始化器允许一个类实例释放任何其所被分配的资源；
//引用计数允许不止一个对类实例的引用

//结构体在你的代码中通过复制来传递，并且并不会使用引用计数

//类与结构体有着相似的定义语法，你可以通过使用关键词 class来定义类使用 struct来定义结构体。并在一对大括号内定义它们的具体内容
class SomeClass {
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}
//无论你在何时定义了一个新的类或者结构体，实际上你定义了一个全新的 Swift 类型。请用 UpperCamelCase 命名法[1]命名 (比如这里我们说到的 SomeClass和 SomeStructure)以符合 Swift 的字母大写风格（比如说 String ， Int 以及 Bool）。相反，对于属性和方法使用 lowerCamelCase命名法[1] (比如 frameRate 和 incrementCount)，以此来区别于类型名称
struct Resolution {
var width = 0
var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

//结构体和类两者都能使用初始化器语法来生成新的实例。初始化器语法最简单的是在类或结构体名字后面接一个空的圆括号，例如 Resolution()或者 VideoMode()。这样就创建了一个新的类或者结构体的实例，任何属性都被初始化为它们的默认值

//你可以用点语法来访问一个实例的属性。在点语法中，你只需在实例名后面书写属性名，用( .)来分开，无需空格
print("The width of someResolution is \(someResolution.width)")
//你可以继续下去来访问子属性，如 VideoMode中 resolution属性中的 width属性
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//你亦可以用点语法来指定一个新值到一个变量属性中
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
//不同于 Objective-C，Swift 允许你直接设置一个结构体属性中的子属性。在上述最后一个栗子中， someVideoMode的 resolution属性中的 width这个属性可以直接设置，不用你重新设置整个 resolution 属性到一个新值
//所有的结构体都有一个自动生成的成员初始化器，你可以使用它来初始化新结构体实例的成员属性。新实例属性的初始化值可以通过属性名称传递到成员初始化器中
let vga = Resolution(width: 640, height: 480)
//与结构体不同，类实例不会接收默认的成员初始化器
//值类型是一种当它被指定到常量或者变量，或者被传递给函数时会被拷贝的类型
//其实，在之前的章节中我们已经大量使用了值类型。实际上，Swift 中所有的基本类型——整数，浮点数，布尔量，字符串，数组和字典——都是值类型，并且都以结构体的形式在后台实现
//Swift 中所有的结构体和枚举都是值类型，这意味着你所创建的任何结构体和枚举实例——和实例作为属性所包含的任意值类型——在代码传递中总是被拷贝的
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
//之后声明了一个叫 cinema的变量并且以当前 hd 的值进行初始化。因为 Resolution是一个结构体，现有实例的拷贝会被制作出来，然后这份新的拷贝就赋值给了 cinema。尽管 hd和 cinema有相同的像素宽和像素高，但是在后台中他们是两个完全不同的实例
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
//println "cinema is now 2048 pixels wide"
//总之，原始 hd实例中的 width属性依旧是 1920
print("hd is still \(hd.width) pixels wide")
//当 cinema被赋予 hd的当前值，存储在 hd中的值就被拷贝给了新的 cinema实例。这最终的结果是两个完全不同的实例，它们只是碰巧包含了相同的数字值。由于它们是完全不同的实例， cinema的宽度被设置 2048并不影响 hd中 width存储的值
let arr0 = [1,2,3]
var arr1 = arr0
arr1[0] = 0
print(arr0)
print(arr1)
//与 oc 有很大不一样(⊙o⊙)…
//Java 跟 oc 一样，包括 JS，都是引用类型

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}
// prints "The remembered direction is still .West"
//当 rememberedDirection被赋予了 currentDirection中的值，实际上是值的拷贝。之后再改变 currentDirection的值并不影响 rememberedDirection所存储的原版值
//不同于值类型，在引用类型被赋值到一个常量，变量或者本身被传递到一个函数的时候它是不会被拷贝的。相对于拷贝，这里使用的是同一个对现存实例的引用
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
//因为类是引用类型， tenEighty 和 alsoTenEighty其实都是引用了相同的 VideoMode实例。实际上，它们只是相同实例的两个不同命名罢了
//下面， tenEighty的 frameRate属性展示了它正确地显示了来自于 VideoMode实例的新帧率
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// prints "The frameRate property of tenEighty is now 30.0"
//注意 tenEighty和 alsoTenEighty都被声明为常量。然而，你仍然能改变 tenEighty.frameRate和 alsoTenEighty.frameRate因为 tenEighty和 alsoTenEighty常量本身的值不会改变。 tenEighty和 alsoTenEighty本身是并没有存储 VideoMode实例—相反，它们两者都在后台指向了 VideoMode实例。这是 VideoMode的 frameRate参数在改变而不是引用 VideoMode的常量的值在改变
//因为类是引用类型，在后台有可能有很多常量和变量都是引用到了同一个类的实例。(相同这词对结构体和枚举来说并不是真的相同，因为它们在赋予给常量，变量或者被传递给一个函数时总是被拷贝过去的。)
//有时候找出两个常量或者变量是否引用自同一个类实例非常有用，为了允许这样，Swift提供了两个特点运算符：

//相同于 ( ===)
//不相同于( !==)
if tenEighty === alsoTenEighty {
print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
//注意”相同于”(用三个等于号表示，或者说 ===)这与”等于”的意义不同(用两个等于号表示，或者说 ==)
//“相同于”意味着两个类类型常量或者变量引用自相同的实例；
//“等于”意味着两个实例的在值上被视作“相等”或者“等价”，某种意义上的“相等”，就如同类设计者定义的那样

//如果你有过 C，C++ 或者 Objective-C 的经验，你可能知道这些语言使用可指针来引用内存中的地址。一个 Swift 的常量或者变量指向某个实例的引用类型和 C 中的指针类似，但是这并不是直接指向内存地址的指针，也不需要你书写星号( *)来明确你建立了一个引用。相反，这些引用被定义得就像 Swift 中其他常量或者变量一样。

//总之，结构体实例总是通过值来传递，而类实例总是通过引用来传递。这意味着他们分别适用于不同类型的任务。当你考虑你的工程项目中数据结构和功能的时候，你需要决定把每个数据结构定义成类还是结构体。
//按照通用准则，当符合以下一条或多条情形时应考虑创建一个结构体：

//结构体的主要目的是为了封装一些相关的简单数据值；
//当你在赋予或者传递结构实例时，有理由需要封装的数据值被拷贝而不是引用；
//任何存储在结构体中的属性是值类型，也将被拷贝而不是被引用；
//结构体不需要从一个已存在类型继承属性或者行为。
//合适的结构体候选者包括：

//几何形状的大小，可能封装了一个 width属性和 height属性，两者都为 double类型；
//一定范围的路径，可能封装了一个 start属性和 length属性，两者为 Int类型；
//三维坐标系的一个点，可能封装了 x , y 和 z属性，他们都是 double类型。
//在其他的情况下，定义一个类，并创建这个类的实例通过引用来管理和传递。事实上，大部分的自定义的数据结构应该是类，而不是结构体
//Swift 的 String , Array 和 Dictionary类型是作为结构体来实现的，这意味着字符串，数组和字典在它们被赋值到一个新的常量或者变量，亦或者它们本身被传递到一个函数或方法中的时候，其实是传递了拷贝。

//这种行为不同于基础库中的 NSString, NSArray和 NSDictionary，它们是作为类来实现的，而不是结构体。 NSString , NSArray 和 NSDictionary实例总是作为一个已存在实例的引用而不是拷贝来赋值和传递
