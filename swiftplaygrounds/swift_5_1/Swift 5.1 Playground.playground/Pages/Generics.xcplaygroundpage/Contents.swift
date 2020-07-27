//: [Previous](@previous)

import Foundation

var str = "Hello, Generics"

protocol ItemStorable {
    associatedtype DataType
    var items: [DataType]! { get set }
    subscript(i: Int) ->  DataType {get}
    mutating func add(_ items: [DataType])
    mutating func add(_ item: DataType)
}

extension ItemStorable {
    mutating func add(_ items: [DataType]) {
        self.items.append(contentsOf: items)
    }

    mutating func add(_ item: DataType) {
        self.items.append(item)
    }
    
    subscript(i: Int) -> DataType {
        return items[i]
    }
}

struct NewDataBase: ItemStorable {
    var items: [String]!
    typealias DataType = String
}
 
var db = NewDataBase(items: ["A", "B", "C"])
db.add(["E", "F", "G"])
db.items[4]




protocol Container {
    associatedtype Item
    mutating  func append(_ item: Item)
    var count:  Int {get}
    subscript(i: Int) -> Item {get}
}

struct  IntStack: Container {
    typealias Item = Int
    
    mutating  func append(_ item: Item) {
        self.push(item)
    }
    
    var count : Int {
        return items.count
    }
    
    subscript(i: Int) -> Item {
        return items[i]
    }
    
    var items = [Int]()
    
    mutating func push(_ item: Item) {
        items.append(item)
    }
    
    mutating func pop() -> Item {
        return items.removeLast()
    }
    
    // Conformance

}
//struct NameDatabase: ItemStorable {
//    typealias DataType = String
//
//
//}

struct Person{
    var name: String!
}


func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let tempA = a
    a = b
    b = tempA
}

var  a = 10,  b = 20
swapTwoValues(&a, &b)
a
b

var aStr = " A String "
var bStr  = " B string "
swapTwoValues(&aStr, &bStr)
aStr
bStr

var aPerson = Person(name: "A")
var bPerson = Person(name: "B")
swapTwoValues(&aPerson, &bPerson)
aPerson.name
bPerson.name

//: [Next](@next)
