import UIKit

var str = "3Sum"


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var indices = Set<[Int]>()
        var pivot: Int
        for i in 0..<nums.count {
            var pass = [Int]()
            pivot = nums[i]
            let target = 0 - pivot
            var map = [Int:Int]()
            
            // 2 Sum logic modification
            for j in 0..<nums.count where j != i {
                let element = nums[j]
                let difference = target - element
                if let value = map[difference] {
                    pass = [nums[i], nums[j], nums[value]]
                    break
                } else {
                    map[element] = j
                }
            }
            if !pass.isEmpty {
                indices.insert(pass.sorted{$0<$1})
            }
        }
        
        return Array(indices)
    }
}
