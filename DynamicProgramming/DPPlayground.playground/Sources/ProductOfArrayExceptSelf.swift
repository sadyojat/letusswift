import Foundation

enum ExecutionType {
    case dp, iteration
}

let executionCase = ExecutionType.dp


public func productExceptSelf(_ nums: [Int]) -> [Int] {
    switch executionCase {
        case .dp:
            return dp_productExceptSelf(nums)
        case .iteration:
            return iteration(nums)
    }
}


// O(n) operation
fileprivate func iteration(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else {
        return []
    }

    var left = Array(repeating: 1, count: nums.count)
    var right = Array(repeating: 1, count: nums.count)
    for i in 1..<nums.count {
        left[i] = left[i-1] * nums[i-1]
    }

    for i in (0..<nums.count-1).reversed() {
        right[i] = right[i+1] * nums[i+1]
    }

    var result = [Int]()
    for i in 0..<left.count {
        result.append(left[i]*right[i])
    }
    return result
}


// O(n^2) operation
fileprivate func dp_productExceptSelf(_ nums: [Int]) -> [Int] {
    var m = Array(repeating: Array(repeating: 1, count: nums.count+1), count: nums.count)
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i == j {
                m[i][j+1] = m[i][j] * 1
            } else {
                m[i][j+1] = m[i][j] * nums[j]
            }
        }
    }
    return m.map {$0[nums.count]}
}
