//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//你可以为一个类型定义多个下标，并且下标会基于传入的索引值的类型选择合适的下标重载使用。下标没有限制单个维度，你可以使用多个输入形参来定义下标以满足自定义类型的需求
//使用关键字 subscript 来定义下标，并且指定一个或多个输入形式参数和返回类型，与实例方法一样。与实例方法不同的是，下标可以是读写也可以是只读的。这个行为通过与计算属性中相同的 getter 和 setter 传达
//subscript(index: Int) -> Int {
//    get {
//        // return an appropriate subscript value here
//    }
//    set(newValue) {
//        // perform a suitable setting action here
//    }
//}
//与只读计算属性一样，你可以给只读下标省略 get 关键字
//subscript(index: Int) -> Int {
//    // return an appropriate subscript value here
//}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// prints "six times three is 18"
//n倍表是基于固定的数学公式。并不适合对 threeTimesTable[someIndex] 进行赋值操作，所以 TimesTable 的下标定义为只读下标
//Swift 的 Dictionary 类型实现它的下标为接收和返回可选类型的下标。对于上例中的 numberOfLegs 字典，键值下标接收和返回一个 Int? 类型的值，或者说“可选的 Int  ”。 Dictionary 类型使用可选的下标类型来建模不是所有键都会有值的事实，并且提供了一种通过给键赋值为 nil 来删除对应键的值的方法
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2
//下标可以接收任意数量的输入形式参数，并且这些输入形式参数可以是任意类型。下标也可以返回任意类型。下标可以使用变量形式参数和可变形式参数，但是不能使用输入输出形式参数或提供默认形式参数值
//类或结构体可以根据自身需要提供多个下标实现，合适被使用的下标会基于值类型或者使用下标时下标方括号里包含的值来推断。这个对多下标的定义就是所谓的下标重载
//通常来讲下标接收一个形式参数，但只要你的类型需要也可以为下标定义多个参数
//如下例定义了一个 Matrix 结构体，它呈现一个 Double 类型的二维矩阵。 Matrix 结构体的下标接收两个整数形式参数
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
let someValue = matrix[1, 0]
// this triggers an assert, because [2, 2] is outside of the matrix bounds
