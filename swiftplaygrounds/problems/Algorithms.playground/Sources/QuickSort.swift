import Foundation

public func quickSort(_ unsortedValues: [Int]) -> [Int] {
    guard unsortedValues.count > 1 else { return unsortedValues }
    let (left, center, right) = partition(unsortedValues)
    return quickSort(left) + center + quickSort(right)
}


// Partitioning Uses Randomized pivot selection
public func partition(_ list: [Int]) -> ([Int], [Int], [Int]) {
    let pIndex = Int(arc4random_uniform(UInt32(list.count - 1)))
    var left = [Int]()
    var center = [Int]()
    var right = [Int]()
    let pivot  = list[pIndex]
    print("Partitioning --> \(list) || Pivot -- \(pivot) || index --> \(pIndex)")
    for i in 0..<list.count {
        if list[i] < pivot {
            left.append(list[i])
        } else if list[i] > pivot {
            right.append(list[i])
        } else {
            center.append(list[i])
        }
    }
    return (left, center, right)
}


public func spaceOptimizedQuickSort(_ list: inout [Int], _ start: Int,  _ end: Int) {
//    print("Input --> \(list)")
    guard list.count > 1 else { return }
    
    let pIndex = spaceOptimizedPartition(&list, start, end)
    spaceOptimizedQuickSort(&list, start, pIndex-1)
    spaceOptimizedQuickSort(&list, pIndex, end)
}

public func spaceOptimizedPartition(_ list: inout [Int], _ start: Int, _ end: Int) ->  Int {
    let pIndex = Int(arc4random_uniform(UInt32(end-start - 1)))
    let pivot = list[pIndex]
    swap(&list, pIndex, end)
    
    var left = 0
    var right =  list.count - 2
    
    while left <= right {
        if list[left] > pivot && pivot <= list[right] {
            right = right - 1
        } else if list[left] > pivot && pivot > list[right] {
            swap(&list, left, right)
            left = left + 1
            right = right - 1
        } else if list[left] <= pivot && pivot > list[right] {
            left  = left + 1
        } else {
            left =  left  + 1
            right = right - 1
        }
    }
    print("Pivot ->  \(pivot) || left -> \(list[left]) || right -> \(list[right])")
    swap(&list, left, list.count - 1)
    return left
}

func swap(_ list: inout [Int], _ leftIndex: Int, _ rightIndex: Int) {
    let temp = list[leftIndex]
    list[leftIndex] = list[rightIndex]
    list[rightIndex] = temp
}

