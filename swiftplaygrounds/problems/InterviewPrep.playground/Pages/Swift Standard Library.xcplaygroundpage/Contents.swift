//: [Previous](@previous)

import Foundation

var str = "Hello, Swift Standard Library"

// Object Identity

class Person {
    var name: String?
}

var p1 = Person(); p1.name = "Alok"
var p2 = Person(); p2.name = "Alok"
var p3 = p1
(p1 === p2)
(p3 === p1)


//struct PersonStruct {
//    var name: String?
//}
//
//var p1s = PersonStruct(); p1.name = "Alok"
//var p2s = PersonStruct(); p2.name = "Alok"
//(p1s.name! == p2s.name!)
//: [Next](@next)


let cast = ["Vivien", "Marlon", "Kim", "Karl"]
cast.map { (s) -> String in
    return s.lowercased()
}
