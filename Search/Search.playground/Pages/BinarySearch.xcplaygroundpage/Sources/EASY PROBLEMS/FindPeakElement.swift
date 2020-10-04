import Foundation


/* PROBLEM :: https://leetcode.com/problems/peak-index-in-a-mountain-array/ */

public func findPeakElement(_ arr: [Int]) -> Int {
    return find(arr, 0, arr.count - 1)
}

fileprivate func find(_ arr: [Int], _ start: Int, _ end: Int) -> Int {
    var start = start
    var end = end
    guard end - start > 1 else {
        return arr[start] < arr[end] ? end : start
    }
    
    let median = start + (end - start)/2
    if arr[median] < arr[median+1] {
        start = median
    } else {
        end = median
    }
    return find(arr, start, end)
}
