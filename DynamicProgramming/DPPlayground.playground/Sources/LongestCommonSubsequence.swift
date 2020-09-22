import Foundation


public func lcs(_ s: String, _ t: String) -> Int {
    
    guard s.count > 0, t.count > 0 else {
        return 0
    }
    
    let s = " "+s
    let t = " "+t
    var cost = Array(repeating: Array(repeating: 0, count: t.count), count: s.count)
    
    for (i, sChar) in s.enumerated() where i > 0 {
        for (j, tChar) in t.enumerated()  where j > 0 {
            if sChar == tChar {
                cost[i][j] = cost[i-1][j-1] + 1
            } else {
                cost[i][j] = max(cost[i-1][j], cost[i][j-1], cost[i-1][j-1])
            }
        }
    }
    return cost[s.count-1][t.count-1]
}

