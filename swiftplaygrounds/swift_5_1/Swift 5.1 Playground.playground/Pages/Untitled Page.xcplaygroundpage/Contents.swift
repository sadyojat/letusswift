//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


public func twoSum (_ numbers:  [Int], target: Int) ->  [Int] {
    var index = 0
    var map: [Int:Int] = [Int:  Int]()
    var finalIndices: [Int] = [Int]()
    for element in numbers {
        var difference = target - element
        if let value = map[element] {
            return [value, index]
        } else {
            map[difference] = index
            print("\(difference) \(index)")
        }
        map
        index = index + 1
    }
    
    return [0]
}

public func twoSumWithValues (_ numbers:  [Int], target: Int) ->  [Int] {
    var index = 0
    var map: [Int:Int] = [Int:  Int]()
    var finalIndices: [Int] = [Int]()
    for element in numbers {
        var difference = target - element
        if let value = map[element] {
            return [value, element]
        } else {
            map[difference] = element
            print("\(difference) \(index)")
        }
        map
        index = index + 1
    }
    
    return [0]
}


public func threeSum(_ numbers: [Int]) -> [[Int]] {
    var tempNumbers = numbers
    var result = [[Int]]()
    for index in 0..<numbers.count  {
        let target = numbers[index]
        tempNumbers.remove(at: index)
        var targetList =  twoSumWithValues(tempNumbers, target: -target)
        targetList.append(target)
        result.append(targetList)
        tempNumbers.insert(target, at: index)
    }
    return result
}
    

//twoSum([1,2,3,7], target: 9)
threeSum([1,0,-1])
//: [Next](@next)
