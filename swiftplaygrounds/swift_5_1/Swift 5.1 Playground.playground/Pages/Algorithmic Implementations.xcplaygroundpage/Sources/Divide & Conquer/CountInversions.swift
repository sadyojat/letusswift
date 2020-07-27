import Foundation

var elements  = [9,3,1,5,4,2]

public func countInversions(_ elements: [Int]) -> (Int, [Int]) {
    let n = elements.count
    guard n > 1 else  {
        return (0, elements)
    }
    let (leftInvCount, left)  = countInversions(Array(elements[0..<n/2]))
    let (rightInvCount, right) = countInversions(Array(elements[n/2..<n]))
    let (splitInvCount, sorted) = count(left, right)
    return (leftInvCount + rightInvCount + splitInvCount, sorted)
}

public func count(_ left: [Int], _ right: [Int]) -> (Int, [Int]) {
    var left = left, right = right
    var sorted = [Int]()
    var count = 0
    while let l = left.first, let r = right.first {
        if l < r {
            sorted.append(left.removeFirst())
        } else {
            count  =  count + 1
            sorted.append(right.removeFirst())
        }
    }
    return (count, sorted + left + right)
}
