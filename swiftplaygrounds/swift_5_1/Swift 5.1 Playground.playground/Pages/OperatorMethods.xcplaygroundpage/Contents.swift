//: [Previous](@previous)

import Foundation

var str = "Operator  Methods"

struct Vector2D: Equatable {
    var x = 0.0, y = 0.0
}


// -- Add 2 Vectors
infix operator +-: AdditionPrecedence

precedencegroup Assignment {
    associativity: left
}



extension Vector2D {
    
    // Single Operator Method
    static func + (v1: Vector2D, v2: Vector2D) -> Vector2D {
        return Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
    }
    
    // Prefix operator method
    static prefix func - (v1: Vector2D) ->  Vector2D {
        return Vector2D(x: -v1.x , y: -v1.y)
    }
    
    // Compound Operator Assignment method
    static func += (v1: inout Vector2D, v2: Vector2D) {
        v1 = v1 + v2
    }
    
    // Custom  Unary Operator method
    static prefix func ++ (v1: inout  Vector2D) -> Vector2D {
         v1 += v1
        return v1
    }
    
//    static func == (v1: Vector2D, v2: Vector2D) -> Bool  {
//        return (v1.x ==  v2.x) && (v1.y == v2.y)
//    }
}

var v1 = Vector2D(x: 3.0, y: 4.0)
var v2 = Vector2D(x: 6.0, y: 7.0)

v1 == v2

var v3 = Vector2D(x: 10, y: 20)
v1 += v3
++v1

var sumOfVectors = v1 + v2
var negationVector = -v1


//: [Next](@next)
