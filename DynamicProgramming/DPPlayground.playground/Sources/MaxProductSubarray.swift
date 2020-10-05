import Foundation


/*
 Problem URL :: https://leetcode.com/problems/maximum-product-subarray/
 */

public func maxProductSubArray(_ nums: [Int]) -> Int {
    guard let first = nums.first else {
        return 0
    }
    
    var maxProduct = 1
    var minProduct = 1
    var result = 0
    
//    [2,3,-2,4]
    for number in nums {
        let newMax = max(maxProduct*number, minProduct*number, number)
        let newMin = min(maxProduct*number, minProduct*number, number)
        minProduct = (newMin < minProduct) ? newMin : minProduct
        
        if (maxProduct > newMax) {
            result = max(result, maxProduct)
            maxProduct = 1
            minProduct = 1
        } else {
            maxProduct = newMax
        }
    }
    
    
    return result
}
