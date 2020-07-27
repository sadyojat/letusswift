//: [Previous](@previous)

import Foundation

var str = "Map Function"


var digitAndNames = [
    1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine", 0: "zero"
]


var testNum = 51
testNum % 10

var numbers = [5, 10, 510]

let names = numbers.map({ (number) -> String in
    var output = ""
    var number = number
    repeat {
        guard let value = digitAndNames[number % 10] else {return output}
        output = value + output
        number /= 10
    } while(number > 0)
    return output
})

names
//: [Next](@next)


