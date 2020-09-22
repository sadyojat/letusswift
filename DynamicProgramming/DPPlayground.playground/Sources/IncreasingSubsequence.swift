import Foundation

// [6,2,5,1,7,4,8,3] --> [2,5,7,8]

public func increasingSubsequence(_ nums: [Int]) -> [Int] {
    guard let first = nums.first else {
        return []
    }
    
    var subsequences = [[Int]]()
    subsequences.append([first])
    for i in 1..<nums.count {
        insert(&subsequences, nums[i])
    }
    return subsequences.sorted { $0.count > $1.count }.first ?? []
//    return subsequences.sorted { $0.count > $1.count }.first.count ?? 0
}

fileprivate func insert(_ subsequences: inout [[Int]], _ value: Int) {
    let copy = subsequences
    var flag = false
    for (i, list) in copy.enumerated() {
        if let last = list.last, last < value {
            var current = subsequences[i]
            subsequences.append(current)
            current.append(value)
            subsequences[i] = current
            flag = true
        }
    }
    
    if !flag {
        subsequences.append([value])
    }
    print(subsequences)
}



