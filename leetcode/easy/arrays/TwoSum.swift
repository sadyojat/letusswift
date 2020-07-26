/*
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
*/


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var match = [Int: Int]()
        var result = [Int]()
        for (idx, value) in nums.enumerated() {

            if let i = match[value] {
                result = [i,idx]
                break
            }
            let difference = target - value
            match[difference] = idx
        }
        return result
    }
}
