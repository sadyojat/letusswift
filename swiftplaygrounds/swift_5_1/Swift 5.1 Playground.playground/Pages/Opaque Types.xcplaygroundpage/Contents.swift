//: [Previous](@previous)

import Foundation

var str = "Hello, Opaque Types"

protocol Shape  {
    func draw() -> String
}

struct Triangle: Shape {
    func draw()  ->  String {
        return "triangle"
    }
}

struct Square:  Shape {
    func draw() -> String {
        return "square"
    }
}

struct JoinedShape<T: Shape, U: Shape> : Shape {
    var top: T
    var bottom: U
    
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

// Adding some  keyword makes it agnostic of the exact shape
// As long as the  returned  value conforms to a protocol we  are good.
func makeTrapezoid() -> some Shape {
    let top = Triangle()
    let middle = Square()
    let trapezoid = JoinedShape(top: top, bottom: middle)
    return trapezoid
}


let t = makeTrapezoid()
t.draw()

//: [Next](@next)

