import Foundation

//public  func two_sum(_ nums: [Int], target: Int) -> [Int] {
//    var hash = [Int: Int]()
//    var result = [Int]()
//    for i in 0..<nums.count {
//        var element = nums[i]
//        var diff = target - element
//        if let value = hash[diff] {
//            result = [value, i]
//            break
//        } else  {
//            hash[element] = i
//        }
//    }
//    return result
//}


public func twoSum (_ numbers:  [Int], target: Int) ->  [Int] {
    var index = 0
    var map: [Int:Int] = [Int:  Int]()
    var finalIndices: [Int] = [Int]()
    for element in numbers {
        var difference = target - element
        if let value = map[difference] {
            return [value, index]
        } else {
            map[difference] = index
        }
        index = index + 1
    }
    
    return [0]
}




