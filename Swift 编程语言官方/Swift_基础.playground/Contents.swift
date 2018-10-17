//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("hello world")

let a = 1
var b = 2
b = 4
var c: Double = 90
var d: Float = 6
var f: String = "how are you"
var 你是: String = "中文"
你是 = "hello"
let label = "The width is "
let width = 94
//let widthLabel = label + width
let widthLabel = label + String(width)
//其实还有一种更简单的方法来把值加入字符串：将值写在圆括号里，然后再在圆括号的前边写一个反斜杠 （ \）
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
//为字符串使用三个双引号（ """ ）来一次输入多行内容。只要每一行的缩进与末尾的引号相同，这些缩进都会被移除
let quotation = """
I said "I have \(apples) apples."
And then I said "I have \(apples + oranges) pieces of fruit."
"""
print(quotation)
//:  - 空字符串: 用""字面量
var aa = ""
var bb = "   "
//:  - 判断字符串是否为空
aa.isEmpty
bb.isEmpty
let aaa = """
sajopdjao
         asodja
aass
"""
print(aaa)
var optionalString: String? = nil
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)
var numbers = [20, 19, 7, 12]
//numbers.map({
//    (number: Int) -> Int in
//    let result = 3 * number
//    return result
//})
//let mappedNumbers = numbers.map({ number in 3 * number })
//print(mappedNumbers)

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 11) {
    _ = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return " my hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
