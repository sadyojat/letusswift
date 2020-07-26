/*
Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

Your algorithm's runtime complexity must be in the order of O(log n).

If the target is not found in the array, return [-1, -1].

Example 1:

Input: nums = [5,7,7,8,8,10], target = 8
Output: [3,4]
Example 2:

Input: nums = [5,7,7,8,8,10], target = 6
Output: [-1,-1]

*/



class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var nums = nums
        let index = binarySearchMatch(nums, target, 0)
        if index > -1 {
            var start = index
            var end = index
            while start >= 0, end < nums.endIndex {
                var sFlag = false, rFlag = false
                if (start - 1) >= 0 && nums[start-1] == target {
                    start = start - 1
                    sFlag = true
                }
                if (end+1) < nums.endIndex && nums[end+1] == target {
                    end = end + 1
                    rFlag = true
                }

                if !(sFlag || rFlag) {
                    break
                }
            }

            return [start, end]
        } else {
            return [-1, -1]
        }
    }

    func binarySearchMatch(_ nums:[Int], _ target: Int, _ offset: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }

        if nums.count == 1 {
            return nums[0] == target ? offset : -1
        }

        let medianIndex = (nums.startIndex + nums.endIndex) / 2
        let medianValue = nums[medianIndex]

        if target == medianValue {
            return offset+medianIndex
        } else if target < medianValue {
            return binarySearchMatch(Array(nums[nums.startIndex..<medianIndex]), target, offset)
        } else if target > medianValue {
            return binarySearchMatch(Array(nums[medianIndex..<nums.endIndex]), target, offset + medianIndex)
        } else {
            return -1
        }
    }

}
