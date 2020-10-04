import Foundation

/* PROBLEM :: https://leetcode.com/problems/find-peak-element/ */

typealias Tuple = (index: Int, value: Int)
    
func findMaxPeakElement(_ nums: [Int]) -> Int {
    let peak = find(nums, 0, nums.count - 1)
    return peak.index
}

fileprivate func find(_ arr: [Int], _ start: Int, _ end: Int) -> Tuple {
    guard end - start > 1 else {
        return arr[start] < arr[end] ? (end, arr[end]) : (start, arr[start])
    }
    
    let median = start + (end - start)/2
    if arr[median] > arr[median - 1] && arr[median] > arr[median + 1] {
        return (median, arr[median])
    } else if arr[median - 1] < arr[median] && arr[median] < arr[median + 1] {
        return find(arr, median, end)
    } else if arr[median - 1] > arr[median] && arr[median] > arr[median + 1] {
        return find(arr, start, median)
    } else  {
        let leftPeak: Tuple = find(arr, start, median)
        let rightPeak: Tuple = find(arr, median, end)
        return leftPeak.value > rightPeak.value ? leftPeak : rightPeak
    }
}
