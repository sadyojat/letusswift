
//: [Previous](@previous)

import Foundation

var str = "Divide And Conquer Algorithms"

var elements = [100, 10, 2, 4, 3, 1, 5, 8, 9, 7, 6, 99];

func mergeSort(_ elements: [Int]) -> [Int] {
    let n = elements.count
    guard n > 1 else { return elements }
    var left = Array(elements[0..<n/2])
    var right = Array(elements[n/2..<n])
    return merge(mergeSort(left), mergeSort(right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var left = left, right = right
    
    var sorted = [Int]()
    repeat {
        guard let l = left.first, let r = right.first else { break }
        if l < r {
            sorted = sorted + [left.removeFirst()]
        } else {
            sorted = sorted + [right.removeFirst()]
        }
    } while left.count > 0 && right.count > 0
    
    return sorted + left + right
}


//MARK: ==================== Test Run ==================

func testMergeSort() {
    var list = [Int]()
     
    for _ in 0..<100 {
        list.append(Int(arc4random_uniform(UInt32(100000))))
    }
//    print(list)
    print()
    print(mergeSort(list))
}

testMergeSort()

//: [Next](@next)
