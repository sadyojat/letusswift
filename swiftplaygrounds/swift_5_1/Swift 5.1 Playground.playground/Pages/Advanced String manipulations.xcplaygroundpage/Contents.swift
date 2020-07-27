//: [Previous](@previous)

import Foundation

var str = "Hello, String Manipulations"

var testString = "abcdefghi"

for (n, w)  in testString.enumerated() {
    print("\(n) -- \(w)")
}

//  Extract character "e" from the string
testString[testString.index(testString.startIndex, offsetBy: 4)]


// Identify the number of incidences of a substring in a string
var pattern = "a*b*c*d*e"

let patEnum = pattern.enumerated().filter { (char) -> Bool in
    return String(char) == "*"
}


for (position, character)  in  patEnum {
    print("\(position) -- \(character)")
}
//: [Next](@next)
