import Foundation

let match = 0
let insert = 1
let delete = 2

public func compare(_ s: String, _ t: String) -> Int {
    let s = Array(" "+s)
    let t = Array(" "+t)
    
    var cost = Array(repeating: Array(repeating: 0, count: t.count), count: s.count)
    var parent = Array(repeating: Array(repeating: 0, count: t.count), count: s.count)
    
    for i in 0..<s.count {
        cost[i][0] = i
        parent[i][0] = (i > 0) ? 1 : -1
    }
    
    for j in 0..<t.count {
        cost[0][j] = j
        parent[0][j] = ( j > 0 ) ? 2 : -1
    }
    
    
    for i in 1..<s.count {
        for j in 1..<t.count {
            var opt = Array(repeating: -1, count: 3)
            opt[match] = cost[i-1][j-1] + matchCost(s[i], t[j])
            opt[1] = cost[i][j-1] + forcedCount()
            opt[2] = cost[i-1][j] + forcedCount()
                        
            var lowCost = opt[0]
            var lowestParent = 0
            for p in 1...2 where opt[p] < lowCost {
                lowCost = opt[p]
                lowestParent = p
            }
            cost[i][j] = lowCost
            parent[i][j] = lowestParent
        }
    }
//    reconstruct(s,t,parent, s.count-1, t.count-1)
    print(parent)
    print("Cost \n \(cost)")
    return cost[s.count-1][t.count-1]
}

func matchCost(_ x: Character, _ y: Character) -> Int {
    return (x == y ) ? 0 : 1
}

func forcedCount() -> Int {
    return 1
}

func reconstruct(_ s: [Character], _ t:[Character], _ parent: [[Int]], _ i: Int, _ j: Int) {    
    guard parent[i][j] > -1, i > 0, j > 0 else {
        return
    }
    if parent[i][j] == match {
        if s[i] == t[j] {
            print("M")
        } else {
            print("S")
        }
        reconstruct(s,t,parent, i-1, j-1)
    } else if parent[i][j] == insert {
        print("I")
        reconstruct(s,t,parent, i, j-1)
    } else if parent[i][j] == delete {
        print("D")
        reconstruct(s,t,parent, i-1, j)
    } else {
        return
    }
}
