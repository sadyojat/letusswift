//: [Previous](@previous)

import Foundation

var str = "Hello, Initialization with Literals"

//struct Person {
//    public var rollNumber: Int
//    init(rollNumber: Int) {
//        self.rollNumber = rollNumber
//    }
//}
//
//extension Person: ExpressibleByIntegerLiteral {
//    public init(integerLiteral: IntegerLiteralType) {
//        self.init(rollNumber: integerLiteral)
//    }
//}
//
//var p: Person = 20



struct Constructor<Element:Hashable> {
    var list: [Element]
//
//    init(_ elements: [Element]) {
//        self.list = elements
//    }
}

extension Constructor: ExpressibleByArrayLiteral {
    public init(arrayLiteral: Element...) {
        self.init()
        print("\(arrayLiteral)")
    }
}

//var c = Constructor([1, 2, 3, 4, 5])
var c: Constructor = [1, 2, 3, 4, 5]
c

//: [Next](@next)
