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
//结构体类型的成员初始化器
//如果结构体类型中没有定义任何自定义初始化器，它会自动获得一个成员初始化器。不同于默认初始化器，结构体会接收成员初始化器即使它的存储属性没有默认值。

//这个成员初始化器是一个快速初始化新结构体实例成员属性的方式。新实例的属性初始值可以通过名称传递到成员初始化器里。

struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2, height: 2)
//值类型的初始化器委托
//初始化器可以调用其他初始化器来执行部分实例的初始化。这个过程，就是所谓的初始化器委托，避免了多个初始化器里冗余代码。
//初始化器委托的运作，以及允许那些形式的委托，这些规则对于值类型和类类型是不同的。值类型(结构体和枚举)不支持继承，所以他它们的初始化器委托的过程相当简单，因为它们只能提供它们自己为另一个初始化器委托。如同继承里描述的那样，总之，类可以从其他类继承。这就意味着类有额外的责任来确保它们继承的所有存储属性在初始化期间都分配了一个合适的值。这些责任在下边的类的继承和初始化里做详述。

//对于值类型，当你写自己自定义的初始化器时可以使用 self.init 从相同的值类型里引用其他初始化器。你只能从初始化器里调用 self.init 。
    
    //注意如果你为值类型定义了自定义初始化器，你就不能访问那个类型的默认初始化器(或者是成员初始化器，如果是结构体的话)。这个限制防止了别人意外地使用自动初始化器从而绕过复杂初始化器里提供的额外必要配置这种情况的发生。
//如果你想要你自己的自定义值类型能够使用默认初始化器和成员初始化器初始化，以及你的自定义初始化器来初始化，把你的自定义初始化器写在扩展里而不是作为值类型原始实的一部分。
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() {
        print(self)
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
    
}
//第一个 Rect 初始化器， init() ，和默认初始化器有一样的功能，就是那个如果 Rect 没有自定义初始化器，它将会使用的那个默认初始化器。这个初始化器是空的，用一个大括号 {} 来表示，并且不会执行任何初始化。调用这个初始化器会返回一个 origin 和 size 属性都被初始化为默认值 0.0 的 Rect 实例：
let basicRect = Rect()
//第二个 Rect 初始化器， init(origin:size:) ，和成员初始化器功能相同，就是如果 Rect 没有自定义的初始化器，它将使用的那个初始化器。这个初始化器只是把 origin 和 size 实际参数值赋值给合适的存储属性：
let orginRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//第三个 Rect 的初始化器， init(center:size:) ，略显复杂。它以计算一个基于 center 和 size 值的原点开始。然后调用(或是委托) init(origin:size:) 初始化器，它在合适的属性里储存了新的原点和大小值：
let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
//init(center:size:) 初始化器可能自己已经为 origin 和 size 属性赋值了新值。总之，对于 init(center:size:) 初始化器来说，可以更方便(更清楚)地利用现有已经提供了准确功能的初始化器。
//另一种方法是不需要你自己定义 init() 和 init(origin:size:) 初始化器，请看扩展。
//类的继承和初始化
//所有类的存储属性——包括从它的父类继承的所有属性——都必须在初始化期间分配初始值。

//Swift 为类类型定义了两种初始化器以确保所有的存储属性接收一个初始值。这些就是所谓的指定初始化器和便捷初始化器。
//指定初始化器和便捷初始化器
//指定初始化器是类的主要初始化器。指定的初始化器可以初始化所有那个类引用的属性并且调用合适的父类初始化器来继续这个初始化过程给父类链。
//类偏向于少量指定初始化器，并且一个类通常只有一个指定初始化器。指定初始化器是初始化开始并持续初始化过程到父类链的“传送”点。
//每个类至少得有一个指定初始化器。如同在初始化器的自动继承里描述的那样，在某些情况下，这些需求通过从父类继承一个或多个指定初始化器来满足。
//便捷初始化器是次要的，为一个类支持初始化器。你可以在相同的类里定义一个便捷初始化器来调用一个指定的初始化器作为便捷初始化器来给指定初始化器设置默认形式参数。你也可以为具体的使用情况或输入的值类型定义一个便捷初始化器从而创建这个类的实例。
//如果你的类不需要便捷初始化器你可以不提供它。在为通用的初始化模式创建快捷方式以节省时间或者类的初始化更加清晰明了的时候便捷初始化器。(翻译好垃圾)
//指定初始化器和便捷初始化器语法
//用与值类型的简单初始化器相同的方式来写类的指定初始化器：
//init(parameters) {
//    statements
//}
//便捷初始化器有着相同的书写方式，但是要用 convenience 修饰符放到 init 关键字前，用空格隔开：
//convenience init(parameters) {
//    statements
//}
//类类型的初始化器委托
//为了简化指定和便捷初始化器之间的调用关系，Swift 在初始化器之间的委托调用有下面的三个规则:
//规则 1

//指定初始化器必须从它的直系父类调用指定初始化器。

//规则 2

//便捷初始化器必须从相同的类里调用另一个初始化器。

//规则 3

//便捷初始化器最终必须调用一个指定初始化器。

//简单记忆的这些规则的方法如下：

//指定初始化器必须总是向上委托。
//便捷初始化器必须总是横向委托。
//这些规则不会影响你的类的使用者为每个类创建实例。任何上图的初始化器都可以用来完整创建对应类的实例。这个规则只在类的实现时有影响。
//两段式初始化
//Swift 的类初始化是一个两段式过程。在第一个阶段，每一个存储属性被引入类为分配了一个初始值。一旦每个存储属性的初始状态被确定，第二个阶段就开始了，每个类都有机会在新的实例准备使用之前来定制它的存储属性。

//两段式初始化过程的使用让初始化更加安全，同时在每个类的层级结构给与了完备的灵活性。两段式初始化过程可以防止属性值在初始化之前被访问，还可以防止属性值被另一个初始化器意外地赋予不同的值。
//两段式初始化过程的使用让初始化更加安全，同时在每个类的层级结构给与了完备的灵活性。两段式初始化过程可以防止属性值在初始化之前被访问，还可以防止属性值被另一个初始化器意外地赋予不同的值。
//Swift 的两段式初始化过程与 Objective-C 的初始化类似。主要的不同点是在第一阶段，Objective-C 为每一个属性分配零或空值(例如 0 或 nil )。Swift 的初始化流程更加灵活，它允许你设置自定义的初始值，并可以自如应对那些不把 0 或 nil 做为合法值的类型。
//Swift编译器执行四种有效的安全检查来确保两段式初始化过程能够顺利完成：

//安全检查 1

//指定初始化器必须保证在向上委托给父类初始化器之前，其所在类引入的所有属性都要初始化完成。

//如上所述，一个对象的内存只有在其所有储存型属性确定之后才能完全初始化。为了满足这一规则，指定初始化器必须保证它自己的属性在它上交委托之前先完成初始化。

//安全检查 2

//指定初始化器必须先向上委托父类初始化器，然后才能为继承的属性设置新值。如果不这样做，指定初始化器赋予的新值将被父类中的初始化器所覆盖。

//安全检查 3

//便捷初始化器必须先委托同类中的其它初始化器，然后再为任意属性赋新值（包括同类里定义的属性）。如果没这么做，便捷构初始化器赋予的新值将被自己类中其它指定初始化器所覆盖。

//安全检查 4

//初始化器在第一阶段初始化完成之前，不能调用任何实例方法、不能读取任何实例属性的值，也不能引用 self 作为值。

//直到第一阶段结束类实例才完全合法。属性只能被读取，方法也只能被调用，直到第一阶段结束的时候，这个类实例才被看做是合法的。
//以下是两段初始化过程，基于上述四种检查的流程：
//阶段 1

//指定或便捷初始化器在类中被调用；
//为这个类的新实例分配内存。内存还没有被初始化；
//这个类的指定初始化器确保所有由此类引入的存储属性都有一个值。现在这些存储属性的内存被初始化了；
//指定初始化器上交父类的初始化器为其存储属性执行相同的任务；
//这个调用父类初始化器的过程将沿着初始化器链一直向上进行，直到到达初始化器链的最顶部；
//一旦达了初始化器链的最顶部，在链顶部的类确保所有的存储属性都有一个值，此实例的内存被认为完全初始化了，此时第一阶段完成。
//阶段 2

//从顶部初始化器往下，链中的每一个指定初始化器都有机会进一步定制实例。初始化器现在能够访问 self 并且可以修改它的属性，调用它的实例方法等等；
//最终，链中任何便捷初始化器都有机会定制实例以及使用 slef 。

//初始化器的继承和重写
//不像在 Objective-C 中的子类，Swift 的子类不会默认继承父类的初始化器。Swift 的这种机制防止父类的简单初始化器被一个更专用的子类继承并被用来创建一个没有完全或错误初始化的新实例的情况发生。
//只有在特定情况下才会继承父类的初始化器，但只有这样是安全且合适的时候。
//在子类的初始化器定义之前你必须写 override 修饰符。如同默认初始化器所描述的那样，即使是自动提供的默认初始化器你也可以重写。
//作为一个重写的属性，方法或下标脚本， override 修饰符的出现会让 Swift 来检查父类是否有一个匹配的指定初始化器来重写，并且验证你重写的初始化器已经按照意图指定了形式参数。
//当重写父类指定初始化器时，你必须写 override 修饰符，就算你子类初始化器的实现是一个便捷初始化器
//相反，如同上边类类型的初始化器委托所描述的规则那样，如果你写了一个匹配父类便捷初始化器的子类初始化器，父类的便捷初始化器将永远不会通过你的子类直接调用。因此，你的子类不能(严格来讲)提供父类初始化器的重写。当提供一个匹配的父类便捷初始化器的实现时，你不用写 override 修饰符。

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
//Vehicle 类只为它的存储属性提供了默认值，并且没有提供自定义的初始化器。因此，如同默认初始化器中描述的那样，它会自动收到一个默认初始化器。默认初始化器(如果可用的话)总是类的指定初始化器，也可以用来创建一个新的 Vehicle 实例， numberOfWheels 默认为 0
let vehicle = Vehicle()
print("Vehicle:\(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

//子类 Bicycle 定义了一个自定义初始化器 init() 。这个指定初始化器和 Bicycle 的父类的指定初始化器相匹配，所以 Bicycle 中的指定初始化器需要带上 override 修饰符。
//Bicycle 类的 init() 初始化器以调用 super.init() 开始，这个方法作用是调用父类的初始化器。这样可以确保 Bicycle 在修改属性之前它所继承的属性 numberOfWheels 能被 Vehicle 类初始化。在调用 super.init() 之后，一开始的 numberOfWheels 值会被新值 2 替换。

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
//子类可以在初始化时修改继承的变量属性，但是不能修改继承过来的常量属性。
//初始化器的自动继承
//如上所述，子类默认不会继承父类初始化器。总之，在特定的情况下父类初始化器是可以被自动继承的。实际上，这意味着在许多场景中你不必重写父类初始化器，只要可以安全操作，你就可以毫不费力地继承父类的初始化器。
//假设你为你子类引入的任何新的属性都提供了默认值，请遵守以下2个规则：
//规则1

//如果你的子类没有定义任何指定初始化器，它会自动继承父类所有的指定初始化器。

//规则2

//如果你的子类提供了所有父类指定初始化器的实现——要么是通过规则1继承来的，要么通过在定义中提供自定义实现的——那么它自动继承所有的父类便捷初始化器。

//就算你的子类添加了更多的便捷初始化器，这些规则仍然适用。
//子类能够以便捷初始化器的形式实现父类指定初始化器来作为满足规则2的一部分

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
print("\(namedMeat.name)")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem0: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? "✔" : "✘"
        return output
    }
}

//ShoppingListItem 没有定义初始化器来给 purchased 一个初始值，这是因为任何添加到购物单（这里的模型）的项的初始状态总是未购买
//由于它为自己引入的所有属性提供了一个默认值并且自己没有定义任何初始化器， ShoppingListItem 会自动从父类继承所有的指定和便捷初始化器

var breakfastList = [
    ShoppingListItem0(),
    ShoppingListItem0(name: "Bacon"),
    ShoppingListItem0(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[1].purchased = true
for item in breakfastList {
    print(item.description)
}
//可失败初始化器
//定义类、结构体或枚举初始化时可以失败在某些情况下会管大用。这个失败可能由以下几种方式触发，包括给初始化传入无效的形式参数值，或缺少某种外部所需的资源，又或是其他阻止初始化的情况。

//为了妥善处理这种可能失败的情况，在类、结构体或枚举中定义一个或多个可失败的初始化器。通过在 init 关键字后面添加问号( init? )来写
//你不能定义可失败和非可失败的初始化器为相同的形式参数类型和名称。
//可失败的初始化器创建了一个初始化类型的可选值。你通过在可失败初始化器写 return nil 语句，来表明可失败初始化器在何种情况下会触发初始化失败。
//严格来讲，初始化器不会有返回值。相反，它们的角色是确保在初始化结束时， self 能够被正确初始化。虽然你写了 return nil 来触发初始化失败，但是你不能使用 return 关键字来表示初始化成功了
//比如说，可失败初始化器为数字类型转换器做实现。为了确保数字类型之间的转换保持值不变，使用 init(exactly:)  初始化器。如果类型转换不能保持值不变，初始化器失败
let wholeNumner: Double = 12345.0
let pi = 3.14159
if let valueMaintained = Int(exactly: wholeNumner) {
    print("\(wholeNumner) conversion to int maintains value")
}

let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to int does not maintain value")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty{ return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
//检查空字符串值(比如是 "" 而不是 "Giraffe" )和检查值是否为 nil 来表明可选项String是不是没有值是两个不一样的的概念。上面的栗子中，空字符串( "" )是合法的，非可选的 String 。总之，对于 Animal 来说让它的species属性有一个空的字符串作为值是不合适的。要模式化这个限制，可失败的初始化器就会在发现空字符串时触发初始化失败
//枚举的可失败初始化器
