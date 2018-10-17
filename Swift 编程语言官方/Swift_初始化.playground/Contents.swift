//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//初始化是为类、结构体或者枚举准备实例的过程
//这个过需要给实例里的每一个存储属性设置一个初始值并且在新实例可以使用之前执行任何其他所必须的配置或初始化。
//你通过定义初始化器来实现这个初始化过程，它更像是一个用来创建特定类型新实例的特殊的方法。不同于 Objective-C 的初始化器，Swift 初始化器不返回值。这些初始化器主要的角色就是确保在第一次使用之前某类型的新实例能够正确初始化
//类类型的实例同样可以实现一个反初始化器，它会在这个类的实例被释放之前执行任意的自定义清理
//在创建类和结构体的实例时必须为所有的存储属性设置一个合适的初始值。存储属性不能遗留在不确定的状态中。

//你可以在初始化器里为存储属性设置一个初始值，或者通过分配一个默认的属性值作为属性定义的一部分

//当你给一个存储属性分配默认值，或者在一个初始化器里设置它的初始值的时候，属性的值就会被直接设置，不会调用任何属性监听器
//初始化器在创建特定类型的实例时被调用。在这个简单的形式中，初始化器就像一个没有形式参数的实例方法，使用 init 关键字来写
//init() {
//    // perform some initialization here
//}

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// prints "The default temperature is 32.0° Fahrenheit"
//如上所述，你可以在初始化器里为存储属性设置初始值。另外，指定一个默认属性值作为属性声明的一部分。当属性被定义的时候你可以通过为这个属性分配一个初始值来指定默认的属性值
//如果一个属性一直保持相同的初始值，可以提供一个默认值而不是在初始化器里设置这个值。最终结果是一样的，但是默认值将属性的初始化与声明更紧密地联系到一起。它使得你的初始化器更短更清晰，并且可以让你属性根据默认值推断类型。如后边的章节所述，默认值也让你使用默认初始化器和初始化器继承更加容易。
struct FahrenheitSimple {
    var temperature = 32.0
}
//自定义初始化
//初始化形式参数
//你可以提供初始化形式参数作为初始化器的一部分，来定义初始化过程中的类型和值的名称。初始化形式参数与函数和方法的形式参数具有相同的功能和语法
struct Celsius {
var temperatureInCelsius: Double
init(fromFahrenheit fahrenheit: Double) {
    temperatureInCelsius = (fahrenheit - 32.0) / 1.8
}
init(fromKelvin kelvin: Double) {
    temperatureInCelsius = kelvin - 273.15
}
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0

//形式参数名和实际参数标签
//与函数和方法的形式参数一样，初始化形式参数也可以在初始化器内部有一个局部变量名以及实际参数标签供调用的时候使用。
//总之，初始化器并不能像函数和方法那样在圆括号前面有一个用来区分的函数名。因此，一个初始化器的参数名称和类型在识别该调用哪个初始化器的时候就扮演了一个非常重要的角色。因此，如果你没有提供外部名 Swift 会自动为每一个形式参数提供一个外部名称。

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//注意不使用外部名称是不能调用这些初始化器的。如果定义了外部参数名就必须用在初始化器里，省略的话会报一个编译时错误：
//let veryGreen = Color(0.0, 1.0 ,0.0)
//Missing argument labels 'red:green:blue:' in call

//无实际参数标签的初始化器形式参数
//如果你不想为初始化器形式参数使用实际参数标签，可以写一个下划线( _ )替代明确的实际参数标签以重写默认行为。
struct Celsius1 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius1(37.0)
// bodyTemperature.temperatureInCelsius is 37.0
//调用初始化器 Celsius(37.0) 有着清楚的意图而不需要外部形式参数名。因此，把初始化器写为 init(_ celsius: Double) 是合适的，它也就可以通过提供未命名的 Double 值被调用了。
//可选属性类型
//如果你的自定义类型有一个逻辑上是允许“无值”的存储属性——大概因为它的值在初始化期间不能被设置，或者因为它在稍后允许设置为“无值”——声明属性为可选类型。可选类型的属性自动地初始化为 nil ，表示该属性在初始化期间故意设为“还没有值”。
class SurveyQuestion {
    var text: String
    var respinse: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
        print(respinse as Any)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.respinse = "Yes, I do like cheese"
cheeseQuestion.ask()
//对调查问题的回答直到被问的时候才能知道，所以 response 属性被声明为 String? 类型，或者是“可选 Stirng ”。当新的 SurveyQuestion 实例被初始化的时候，它会自动分配一个为 nil 的默认值，意味着“还没有字符串”。
//在初始化中分配常量属性
//在初始化的任意时刻，你都可以给常量属性赋值，只要它在初始化结束是设置了确定的值即可。一旦为常量属性被赋值，它就不能再被修改了。
//你可以修改上面 SurveyQuestion 的例子，给 text 使用常量属性而不是变量属性来表示问题，来明确一旦 SurveyQuestion 的实例被创建，那个问题将不会改变。尽管现在 text 属性是一个常量，但是它依然可以在类的初始化器里设置：

class SurveyQuestion1 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion1(text: "How about beets?")
beetsQuestion.ask()
// prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"
//默认初始化器
//Swift 为所有没有提供初始化器的结构体或类提供了一个默认的初始化器来给所有的属性提供了默认值。这个默认的初始化器只是简单地创建了一个所有属性都有默认值的新实例。

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
//由于 ShoppingListItem 类的所有属性都有默认值(如果没有的话报错error: 'ShoppingListItem' cannot be constructed because it has no accessible initializers)，又由于它是一个没有父类的基类， ShoppingListItem 类自动地获得了一个默认的初始化器，使用默认值设置了它的所有属性然后创建了新的实例。( name 属性是一个可选 String 属性，所以它会自动设置为 nil 默认值，尽管这个值没有写在代码里。)上面的栗子给 ShoppingListItem 类使用默认初始化器以及初始化器语法创建新的实例，写作 ShoppingListItem() ，并且给这个新实例赋了一个名为 item 的变量。

