//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Swift 的 String类型桥接到了基础库中的 NSString类。Foundation 同时也扩展了所有 NSString 定义的方法给 String 。也就是说，如果你导入 Foundation ，就可以在 String 中访问所有的 NSString  方法，无需转换格式。
//如果你需要很多行的字符串，使用多行字符串字面量。多行字符串字面量是用三个双引号引起来的一系列字符
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
print(quotation)
//如同上面展示的那样，由于多行用了三个双引号而不是一个，你可以在多行字面量中使用单个双引号 " 。要在多行字符串中包含 """ ，你必须用反斜杠（ \ ）转义至少其中一个双引号。举例来说
let threeDoubleQuotes = """
Escaping the first quote \"""
Escaping all three quotes \"\"\"
"""
print(threeDoubleQuotes)
//在这个多行格式中，字符串字面量包含了双引号包括的所有行。字符串起始于三个双引号（ """ ）之后的第一行，结束于三个双引号（ """ ）之前的一行，也就是说双引号不会开始或结束带有换行。下面的两个字符串是一样的
let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""
//要让多行字符串字面量开始或结束带有换行，写一个空行作为第一行或者是最后一行
"""

This string starts with a line feed.
It also ends with a line feed.

"""

//多行字符串可以缩进以匹配周围的代码。双引号（ """ ）前的空格会告诉 Swift 其他行前应该有多少空白是需要忽略的。比如说，尽管下面函数中多行字符串字面量缩进了，但实际上字符串不会以任何空白开头

func generateQuotation() -> String {
    let quotation = """
        The White Rabbit put on his spectacles.  "Where shall I begin,
        please your Majesty?" he asked.

        "Begin at the beginning," the King said gravely, "and go on
        till you come to the end; then stop."
        """
    return quotation
}
print(quotation == generateQuotation())
//Prints "true"
//为了绑定一个更长的字符串，要在一开始创建一个空的 String值，要么赋值一个空的字符串字面量给变量，要么使用初始化器语法来初始化一个新的 String实例
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
//通过检查布尔量 isEmpty属性来确认一个 String值是否为空
if emptyString.isEmpty {
    print("Nothing to see here")
}
//你可以通过把一个 String设置为变量（这里指可被修改），或者为常量（不能被修改）来指定它是否可以被修改（或者改变）
//这个功能与 Objective-C 和 Cocoa 中的字符串改变不同，通过选择不同的类（ NSString和 NSMutableString）来明确字符串是否可被改变
//Swift 的 String类型是一种值类型。如果你创建了一个新的 String值， String值在传递给方法或者函数的时候会被复制过去，还有赋值给常量或者变量的时候也是一样。每一次赋值和传递，现存的 String值都会被复制一次，传递走的是拷贝而不是原本。
//Swift 的默认拷贝 String行为保证了当一个方法或者函数传给你一个 String值，你就绝对拥有了这个 String值，无需关心它从哪里来。你可以确定你传走的这个字符串除了你自己就不会有别人改变它。

//另一方面，Swift 编译器优化了字符串使用的资源，实际上拷贝只会在确实需要的时候才进行。这意味着当你把字符串当做值类型来操作的时候总是能够有用很棒的性能
//String值可以通过传入 Character值的字符串作为实际参数到它的初始化器来构造
let catCharacters: [Character] = ["C", "a", "t", "!", "?"]
let catString = String(catCharacters)
print(catString)
//String值能够被加起来（或者说连接），使用加运算符（ +）来创建新的String值
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
//你同样也可以使用加赋值符号（ +=）在已经存在的 String值末尾追加一个 String值
var instruction = "look over"
instruction += string2
print(instruction)
//你使用 String类型的 append()方法来可以给一个 String变量的末尾追加 Character值
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
//字符串插值是一种从混合常量、变量、字面量和表达式的字符串字面量构造新 String值的方法。每一个你插入到字符串字面量的元素都要被一对圆括号包裹，然后使用反斜杠前缀
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
//你作为插值写在圆括号中的表达式不能包含非转义的双引号 ( ")或者反斜杠 ( \)，并且不能包含回车或者换行符。总之，它们可以包含其他字符串字面量
//字符串字面量能包含以下特殊字符
//转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
//任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}" // $, Unicode scalar U+0024
let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // ?, Unicode scalar U+1F496
//扩展字形集群是一种非常灵活的把各种复杂脚本字符作为单一 Character值来表示的方法。比如说韩文字母中的音节能被表示为复合和分解序列两种。这两种表示在 Swift 中都完全合格于单一 Character值
let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ
//要在字符串中取回 Character值的总数，使用字符串的 count属性
let unusualMenagerie = "Koala ?, Snail ?, Penguin ?, Dromedary ?"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
let testMenagerie = "你好"
print("testMenagerie has \(testMenagerie.count) characters")
//注意 Swift 为 Character值使用的扩展字形集群意味着字符串的创建和修改可能不会总是影响字符串的字符统计数。
//比如说，如果你使用四个字符的cafe来初始化一个新的字符串，然后追加一个 COMBINING ACUTE ACCENT  ( U+0301)到字符串的末尾，字符串的字符统计结果将仍旧是 4，但第四个字符是 é而不是 e
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"
//扩展字形集群能够组合一个或者多个 Unicode 标量。这意味着不同的字符——以及相同字符的不同表示——能够获得不同大小的内存来储存。因此，Swift 中的字符并不会在字符串中获得相同的内存空间。所以说，字符串中字符的数量如果不遍历它的扩展字形集群边界的话，是不能被计算出来的。如果你在操作特殊的长字符串值，要注意 count属性为了确定字符串中的字符要遍历整个字符串的 Unicode 标量。

//通过 count属性返回的字符统计并不会总是与包含相同字符的 NSString中 length属性相同。 NSString中的长度是基于在字符串的 UTF-16 表示中16位码元的数量来表示的，而不是字符串中 Unicode 扩展字形集群的数量。
//如上文中提到的那样，不同的字符会获得不同的内存空间来储存，所以为了明确哪个 Character 在哪个特定的位置，你必须从 String的开头或结尾遍历每一个 Unicode 标量。因此，Swift 的字符串不能通过整数值索引
//使用 startIndex属性来访问 String中第一个 Character的位置。 endIndex属性就是 String中最后一个字符后的位置。所以说， endIndex属性并不是字符串下标脚本的合法实际参数。如果 String为空，则 startIndex与 endIndex相等。

//使用 index(before:) 和 index(after:) 方法来访问给定索引的前后。要访问给定索引更远的索引，你可以使用 index(_:offsetBy:) 方法而不是多次调用这两个方法。

//你可以使用下标脚本语法来访问 String索引中的特定 Character
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a
//尝试访问的 Character如果索引位置在字符串范围之外，就会触发运行时错误
//greeting[greeting.endIndex] // error
//greeting.index(after: endIndex) // error
//使用 indices属性来访问字符串中每个字符的索引
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "
//你可以在任何遵循了 Indexable 协议的类型中使用 startIndex 和 endIndex 属性以及 index(before:) ， index(after:) 和 index(_:offsetBy:) 方法。这包括这里使用的 String ，还有集合类型比如 Array ， Dictionary 和 Set
//要给字符串的特定索引位置插入字符，使用 insert(_:at:)方法，另外要冲入另一个字符串的内容到特定的索引，使用 insert(contentsOf:at:) 方法
var welcome0 = "hello"
welcome0.insert("!", at: welcome0.endIndex)
// welcome now equals "hello!"

welcome0.insert(contentsOf: " there", at: welcome0.index(before: welcome0.endIndex))
// welcome now equals "hello there!"
//要从字符串的特定索引位置移除字符，使用 remove(at:)方法，另外要移除一小段特定范围的字符串，使用 removeSubrange(_:) 方法
welcome0.remove(at: welcome0.index(before: welcome0.endIndex))
// welcome now equals "hello there"

let range = welcome0.index(welcome0.endIndex, offsetBy: -6)..<welcome0.endIndex
welcome0.removeSubrange(range)
// welcome now equals "hello"
//你可以在任何遵循了 RangeReplaceableIndexable 协议的类型中使用 insert(_:at:) ， insert(contentsOf:at:) ， remove(at:) 方法。这包括了这里使用的 String ，同样还有集合类型比如 Array ， Dictionary 和 Set
//当你获得了一个字符串的子字符串——比如说，使用下标或者类似 prefix(_:) 的方法——结果是一个 Substring 的实例，不是另外一个字符串。Swift 中的子字符串拥有绝大部分字符串所拥有的方法，也就是说你可以用操作字符串相同的方法来操作子字符串。总之，与字符串不同，在字符串上执行动作的话你应该使用子字符串执行短期处理。当你想要把结果保存得长久一点时，你需要把子字符串转换为 String 实例。比如说

var greeting0 = "Hello, world!"
let index0 = greeting0.index(of: ",") ?? greeting0.endIndex
let beginning = greeting0[..<index0]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)
greeting0 = "你是个,好人"
beginning
//与字符串类似，每一个子字符串都有一块内存区域用来保存组成子字符串的字符。字符串与子字符串的不同之处在于，作为性能上的优化，子字符串可以重用一部分用来保存原字符串的内存，或者是用来保存其他子字符串的内存。（字符串也拥有类似的优化，但是如果两个字符串使用相同的内存，他们就是等价的。）这个性能优化意味着在你修改字符串或者子字符串之前都不需要花费拷贝内存的代价。如同上面所说的，子字符串并不适合长期保存——因为它们重用了原字符串的内存，只要这个字符串有子字符串在使用中，那么这个字符串就必须一直保存在内存里。

//在上面的例子中， greeting 是一个字符串，也就是说它拥有一块内存保存着组成这个字符串的字符。由于 beginning 是 greeting 的子字符串，它重用了 greeting 所用的内存。不同的是， newString 是字符串——当它从子字符串创建时，它就有了自己的内存
//String 和 Substring 都遵循 StringProtocol 协议，也就是说它基本上能很方便地兼容所有接受 StringProtocol 值的字符串操作函数。你可以无差别使用 String 或 Substring 值来调用这些函数
//两个 String值（或者两个 Character值）如果它们的扩展字形集群是规范化相等，则被认为是相等的。如果扩展字形集群拥有相同的语言意义和外形，我们就说它规范化相等，就算它们实际上是由不同的 Unicode 标量组合而成
//比如说， LATIN SMALL LETTER E WITH ACUTE ( U+00E9)是规范化相等于 LATIN SMALL LETTER E( U+0065)加 COMBINING ACUTE ACCENT ( U+0301)的。这两个扩展字形集群都是表示字符é的合法方式，所以它们被看做规范化相等
// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// prints "These two strings are considered equal"
//字符串和字符的比较在 Swift 中并不区分区域设置
//要检查一个字符串是否拥有特定的字符串前缀或者后缀，调用字符串的 hasPrefix(_:)和 hasSuffix(_:)方法，它们两个都会接受一个 String 类型的实际参数并且返回一个布尔量值
//如同字符串和字符相等性一节所描述的那样， hasPrefix(_:)和 hasSuffix(_:)方法只对字符串当中的每一个扩展字形集群之间进行了一个逐字符的规范化相等比较

