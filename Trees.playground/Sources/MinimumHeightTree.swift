import Foundation

fileprivate var minHeight = Int.max

public func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
    let edges = edges.map{Set($0)}
    var final = [[Int]]()
    for i in 0..<n {
        var visited = Set<Set<Int>>()
        var result = [Int]()
        dfs(edges, &visited, i, i, 0, &result)
        
        let runHeight = result[1]
        if minHeight >= runHeight && runHeight != Int.max {
            minHeight = runHeight
        }
        
        print(result)
        final.append(result)
    }
    
    print(minHeight)
    
    return final.compactMap {
        if $0[1] == minHeight {
            return $0[0]
        } else {
            return nil
        }
    }
}


fileprivate func dfs(_ edges: [Set<Int>], _ visited: inout Set<Set<Int>>, _ startingNode: Int, _ currentNode: Int, _ height: Int, _ result: inout [Int]) {
    var height = height
    let next = nextEdges(edges, visited, currentNode)    
    if next.isEmpty {
        if result.isEmpty {
            result.append(startingNode)
            result.append(height)
            
        } else {
            let oldHeight = result[1] ?? 0
            if height > oldHeight {
                result.removeLast()
                result.append(height)
            }
        }
        return
    } else {
        for n in next {
            for node in n where node != currentNode {
                height += 1
                visited.insert(n)
                dfs(edges, &visited, startingNode, node, height, &result)
                height -= 1
            }
        }
    }
    
}


fileprivate func nextEdges(_ edges: [Set<Int>], _ visited: Set<Set<Int>>, _ currentNode: Int) -> [Set<Int>] {
    return edges.compactMap {
        if !visited.contains($0) && $0.contains(currentNode) {
            return $0
        } else {
            return nil
        }
    }
}

