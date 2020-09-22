import Foundation

public func mergeSort(_ elements: [Int]) -> [Int] {
    let n = elements.count
    guard n > 1 else { return elements }
    let left = Array(elements[0..<n/2])
    let right = Array(elements[n/2..<n])
    return merge(mergeSort(left), mergeSort(right))
}

public func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var left = left, right = right
    
    var sorted = [Int]()
    while let l = left.first, let r = right.first {
        if l < r {
            sorted += [left.removeFirst()]
        } else {
            sorted += [right.removeFirst()]
        }
    }
    
    return sorted + left + right
}
