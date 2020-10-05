import Foundation




public func mergeSort(_ arr: [Int]) -> [Int] {
    return divide(arr)
}

fileprivate func divide(_ arr: [Int]) -> [Int] {
    guard arr.count > 1 else {
        return arr
    }
    let median = arr.count / 2
    let left = divide(Array(arr[0..<median]))
    let right = divide(Array(arr[median..<arr.count]))
    return conquer(left, right)
}

fileprivate func conquer(_ left: [Int], _ right: [Int]) -> [Int] {    
    var left = left, right = right
    var result = [Int]()
    while let topLeft = left.first, let topRight = right.first {
        if topLeft <= topRight {
            left = Array(left[1..<left.count])
            result.append(topLeft)
        } else {
            right = Array(right[1..<right.count])
            result.append(topRight)
        }
    }
    result = result + left + right
    return result
}
