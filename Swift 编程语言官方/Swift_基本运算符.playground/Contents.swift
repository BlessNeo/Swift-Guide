//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//如果赋值符号右侧是拥有多个值的元组，它的元素将会一次性地拆分成常量或者变量
let (x, y) = (1, 2)
// x 等于 1, 同时 y 等于 2
//与 Objective-C 和 C 不同，Swift 的赋值符号自身不会返回值。下面的语句是不合法的
//if x = y {
//    // 这是不合法的, 因为 x = y 并不会返回任何值。
//}
//这个特性避免了赋值符号 (=) 被意外地用于等于符号 (==) 的实际意图上。Swift 通过让 if x = y  非法来帮助你避免这类的错误在你的代码中出
//与 C 和 Objective-C 中的算术运算符不同，Swift 算术运算符默认不允许值溢出。你可以选择使用 Swift 的溢出操作符（比如  a &+ b  ）来行使溢出行为
//加法运算符同时也支持 String  的拼接
"hello, " + "world" // equals "hello, world"
//如同 C ，Swift 提供了由赋值符号（ = ）和其他符号组成的 组合赋值符号 。一个加赋值符号的栗子 （ += ）
var a = 1
a += 2
// a is now equal to 3
//组合运算符不会返回任何值。举例来说，你不能写成这样 let b = a += 2  。这个与前边提到的增量和减量符号的行为不同
//Swift 同时也提供两个等价运算符（ ===  和 !== ），你可以使用它们来判断两个对象的引用是否相同
//你同样可以比较拥有同样数量值的元组，只要元组中的每个值都是可比较的。比如说， Int 和 String 都可以用来比较大小，也就是说 (Int,String) 类型的元组就可以比较。一般来说， Bool 不能比较，这意味着包含布尔值的元组不能用来比较大小。

//元组以从左到右的顺序比较大小，一次一个值，直到找到两个不相等的值为止。如果所有的值都是相等的，那么就认为元组本身是相等的
(1, "zebra") < (2, "apple")   // true because 1 is less than 2
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"
//Swift 标准库包含的元组比较运算符仅支持小于七个元素的元组。要比较拥有七个或者更多元素的元组，你必须自己实现比较运算符
//三元条件运算符提供了一个非常有效的简写来决策要两个表达式之间选哪个。总之，使用三元条件运算符要小心。它的简洁性会导致你代码重用的时候失去易读的特性。避免把多个三元条件运算符组合到一句代码当中
//合并空值运算符 （ a ?? b ）如果可选项 a  有值则展开，如果没有值，是 nil  ，则返回默认值 b 。表达式 a 必须是一个可选类型。表达式 b  必须与 a  的储存类型相同
//合并空值运算符是下边代码的缩写
//a != nil ? a! : b
//如果 a  的值是非空的， b  的值将不会被考虑。这就是所谓的 短路计算
let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
//闭区间运算符（ a...b ）定义了从 a  到 b  的一组范围，并且包含 a  和 b  。 a  的值不能大于 b
//在遍历你需要用到的所有数字时，使用闭区间运算符是个不错的选择，比如说在 for-in  循环当中
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25

//半开区间运算符（ a..<b ）定义了从 a  到 b  但不包括 b  的区间，即 半开 ，因为它只包含起始值但并不包含结束值。（十奶注：其实就是左闭右开区间。）如同闭区间运算符， a  的值也不能大于 b  ，如果 a  与 b  的值相等，那返回的区间将会是空的
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack
//闭区间有另外一种形式来让区间朝一个方向尽可能的远——比如说，一个包含数组所有元素的区间，从索引 2 到数组的结束。在这种情况下，你可以省略区间运算符一侧的值。因为运算符只有一侧有值，所以这种区间叫做单侧区间。比如说
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian
//半开区间运算符同样可以有单侧形式，只需要写它最终的值。和你两侧都包含值一样，最终的值不是区间的一部分。举例来说
for name in names[..<2] {
    print(name)
}
// Anna
// Alex
//单侧区间可以在其他上下文中使用，不仅仅是下标。你不能遍历省略了第一个值的单侧区间，因为遍历根本不知道该从哪里开始。你可以遍历省略了最终值的单侧区间；总之，由于区间无限连续，你要确保给循环添加一个显式的条件。你同样可以检测单侧区间是否包含特定的值，就如下面的代码所述。
let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
//逻辑 非  ( !a )
//逻辑 与  ( a && b )
//逻辑 或  ( a || b )
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// prints "ACCESS DENIED"
//在这个栗子当中，要注意布尔量的常量和变量名能够帮助你保持代码的可读和简洁，同时也要避免双重否定或者其他奇奇怪怪的逻辑语句
//Swift 语言中逻辑运算符 && 和 || 是左相关的，这意味着多个逻辑运算符组合的表达式会首先计算最左边的子表达式
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// prints "ACCESS DENIED"
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// prints "Welcome!"
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// prints "Welcome!"
