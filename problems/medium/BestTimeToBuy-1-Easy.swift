/*
121. Best Time to Buy and Sell Stock

KADANE's Algorithm = Amazon Easy
*/

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var maxCurrent = 0, maxSoFar = 0
        
        for i in 1..<prices.count {
            maxCurrent += prices[i] - prices[i-1]
            maxCurrent = max(0, maxCurrent)
            maxSoFar = max(maxCurrent, maxSoFar)
        }
        return maxSoFar
    }
}





// If multiple transactions can be done then accumulate the maxCurrent

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var maxCurrent = 0, maxSoFar = 0
        for i in 1..<prices.count {            
            maxCurrent += max(0, prices[i] - prices[i-1])            
        }
        return maxCurrent
        
    }
}