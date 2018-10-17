//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//Swift 提供了三种主要的集合类型，所谓的数组、合集还有字典，用来储存值的集合。数组是有序的值的集合。合集是唯一值的无序集合。字典是无序的键值对集合
//Swift 中的数组、合集和字典总是明确能储存的值的类型以及它们能储存的键。就是说你不会意外地插入一个错误类型的值到集合中去。它同样意味着你可以从集合当中取回确定类型的值
//Swift 数组的类型完整写法是 Array<Element>， Element是数组允许存入的值的类型。你同样可以简写数组的类型为 [Element]。尽管两种格式功能上相同，我们更推荐简写并且全书涉及到数组类型的时候都会使用简写
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// prints "someInts is of type [Int] with 0 items."
//Swift 的 Array类型提供了初始化器来创建确定大小且元素都设定为相同默认值的数组。你可以传给初始化器对应类型的默认值（叫做 repeating）和新数组元素的数量（叫做 count）
var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
//你可以通过把两个兼容类型的现存数组用加运算符（ +）加在一起来创建一个新数组。新数组的类型将从你相加的数组里推断出来
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
var shoppingList: [String] = ["Eggs", "Milk"]
//要得出数组中元素的数量，检查只读的 count属性
print("The shopping list contains \(shoppingList.count) items.")
//使用布尔量 isEmpty属性来作为检查 count属性是否等于 0的快捷方式
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
//你可以通过 append(_:)方法给数组末尾添加新的元素
shoppingList.append("Flour")
//另外，可以使用加赋值运算符 ( +=)来在数组末尾添加一个或者多个同类型元素
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
var firstItem = shoppingList[0]
//你同样可以使用下标脚本语法来一次改变一个范围的值，就算替换与范围长度不同的值的合集也行。下面的栗子替换用 "Bananas"和 "Apples"替换 "Chocolate Spread", "Cheese", and "Butter"
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list
//类似地，你可以使用 remove(at:)方法来移除一个元素。这个方法移除特定索引的元素并且返回它（尽管你不需要的话可以无视返回的值）
let mapleSyrup = shoppingList.remove(at: 0)
//如果你访问或者修改一个超出数组边界索引的值，你将会触发运行时错误。你可以在使用索引前通过对比数组的 count属性来检查它。除非当 count为 0（就是说数组为空），否则最大的合法索引永远都是 count - 1，因为数组的索引从零开始
//当数组中元素被移除，任何留下的空白都会被封闭，所以索引 0 的值再一次等于 "Six eggs"
firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs"
//如果你想要移除数组最后一个元素，使用 removeLast()方法而不是 remove(at:)方法以避免查询数组的 count属性。与 remove(at:)方法相同， removeLast()返回删除了的元素
let apples = shoppingList.removeLast()
//如果你需要每个元素以及值的整数索引，使用 enumerated()方法来遍历数组。 enumerated()方法返回数组中每一个元素的元组，包含了这个元素的索引和值。你可以分解元组为临时的常量或者变量作为遍历的一部分
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
//合集将同一类型且不重复的值无序地储存在一个集合当中。当元素的顺序不那么重要的时候你就可以使用合集来代替数组，或者你需要确保元素不会重复的时候
//为了能让类型储存在合集当中，它必须是可哈希的——就是说类型必须提供计算它自身哈希值的方法。哈希值是Int值且所有的对比起来相等的对象都相同，比如 a == b，它遵循 a.hashValue == b.hashValue。

//所有 Swift 的基础类型（比如 String, Int, Double, 和 Bool）默认都是可哈希的，并且可以用于合集或者字典的键。没有关联值的枚举成员值（如同枚举当中描述的那样）同样默认可哈希
//你可以使用你自己自定义的类型作为合集的值类型或者字典的键类型，只要让它们遵循 Swift 基础库的 Hashable协议即可。遵循 Hashable协议的类型必须提供可获取的叫做 hashValue的 Int属性。通过 hashValue属性返回的值不需要在同一个程序的不同的执行当中都相同，或者不同程序。

//因为 Hashable协议遵循 Equatable，遵循的类型必须同时一个“等于”运算符 ( ==)的实现。 Equatable协议需要任何遵循 ==的实现都具有等价关系。就是说， ==的实现必须满足以下三个条件，其中 a, b, 和 c是任意值：

//a == a  (自反性)
//a == b 意味着 b == a  (对称性)
//a == b && b == c 意味着 a == c  (传递性)
//Swift 的合集类型写做 Set<Element>，这里的 Element是合集要储存的类型。不同与数组，合集没有等价的简写
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
//合集类型不能从数组字面量推断出来，所以 Set类型必须被显式地声明。总之，由于 Swift 的类型推断，你不需要在使用包含相同类型值的数组字面量初始化合集的时候写合集的类型。 favoriteGenres 的初始化可以写的更短一些：
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
//要得出合集当中元素的数量，检查它的只读 count属性
//使用布尔量 isEmpty属性作为检查 count属性是否等于 0的快捷方式
//你可通过调用 insert(_:)方法来添加一个新的元素到合集
favoriteGenres.insert("Jazz")
//你可以通过调用合集的 remove(_:)方法来从合集当中移除一个元素，如果元素是合集的成员就移除它，并且返回移除的值，如果合集没有这个成员就返回 nil。另外，合集当中所有的元素可以用 removeAll()一次移除
//要检查合集是否包含了特定的元素，使用 contains(_:)方法
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
//Swift 的 Set类型是无序的。要以特定的顺序遍历合集的值，使用 sorted()方法，它把合集的元素作为使用 < 运算符排序了的数组返回
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
//使用 intersection(_:)方法来创建一个只包含两个合集共有值的新合集；
//使用 symmetricDifference(_:)方法来创建一个只包含两个合集各自有的非共有值的新合集；
//使用 union(_:)方法来创建一个包含两个合集所有值的新合集；
//使用 subtracting(_:)方法来创建一个两个合集当中不包含某个合集值的新合集。
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
//使用“相等”运算符 ( == )来判断两个合集是否包含有相同的值；
//使用 isSubset(of:) 方法来确定一个合集的所有值是被某合集包含；
//使用 isSuperset(of:)方法来确定一个合集是否包含某个合集的所有值；
//使用 isStrictSubset(of:) 或者 isStrictSuperset(of:)方法来确定是个合集是否为某一个合集的子集或者超集，但并不相等；
//使用 isDisjoint(with:)方法来判断两个合集是否拥有完全不同的值。
//典储存无序的互相关联的同一类型的键和同一类型的值的集合。每一个值都与唯一的键相关联，它就好像这个值的身份标记一样。不同于数组中的元素，字典中的元素没有特定的顺序。当你需要查找基于特定标记的值的时候使用字典，很类似现实生活中字典用来查找特定字的定义
//Swift 的字典类型写全了是这样的： Dictionary<Key, Value>，其中的 Key是用来作为字典键的值类型， Value就是字典为这些键储存的值的类型
//你同样可以用简写的形式来写字典的类型为 [Key: Value]。尽管两种写法是完全相同的，但本书所有提及字典的地方都会使用简写形式
var namesOfIntegers = [Int: String]()
//这个栗子创建了类型为 [Int: String]的空字典来储存整数的可读名称。它的键是 Int类型，值是 String类型。
//如果内容已经提供了信息，你就可以用字典字面量创建空字典了，它写做 [:]（在一对方括号里写一个冒号）
namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]
//如同数组，你可以使用 count只读属性来找出 Dictionary拥有多少元素
//使用布尔量 isEmpty属性作为检查 count属性是否等于 0的快捷方式
//你同样可以通过访问字典的 keys和 values属性来取回可遍历的字典的键或值的集合
//作为下标脚本的代替，使用字典的 updateValue(_:forKey:)方法来设置或者更新特点键的值。就像上边下标脚本的栗子， updateValue(_:forKey:)方法会在键没有值的时候设置一个值，或者在键已经存在的时候更新它。总之，不同于下标脚本， updateValue(_:forKey:)方法在执行更新之后返回旧的值。这允许你检查更新是否成功。
//updateValue(_:forKey:)方法返回一个字典值类型的可选项值。比如对于储存 String值的字典来说，方法会返回 String?类型的值，或者说“可选的 String”。这个可选项包含了键的旧值如果更新前存在的话，否则就是 nil：
//Swift 的 Dictionary类型是无序的。要以特定的顺序遍历字典的键或值，使用键或值的 sorted()方法
