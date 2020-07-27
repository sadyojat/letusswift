import UIKit

var str = "Topological Sort"


class Node: Hashable, Equatable {
   
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}


class DirectedGraph {
    var graph = [Node: Set<Node>]()

    func addEdge(_ startValue: Int, _ endValue: Int) {
        let startNode = Node(startValue)
        let endNode = Node(endValue)
        if var neighbors = graph[startNode]  {
            neighbors.insert(endNode)
            graph[startNode] = neighbors
        } else {
            graph[startNode] = Set([endNode])
        }
    }
    
    
    var visited = Set<Node>()
    var stack = [Node]()
    
    func dfs_loop() {
        for tuple in graph where !visited.contains(tuple.key) {
            dfs(tuple.key)
            stack.append(tuple.key)
        }
    }
    
    fileprivate func dfs(_ s: Node) {
        visited.insert(s)
        if let neighbors = graph[s] {
            for aNeighbor in neighbors where !visited.contains(aNeighbor) {
                dfs(aNeighbor)
                stack.append(aNeighbor)
            }
        }
    }
    
    func topologicalSort() -> [Int] {
        return Array(stack.map { $0.value }.reversed())
    }
}


var graph = DirectedGraph()
graph.addEdge(1, 2)
graph.addEdge(2, 4)
graph.addEdge(4, 6)
graph.addEdge(4, 5)
graph.addEdge(1, 3)
graph.addEdge(3, 5)
graph.addEdge(3, 7)


graph.dfs_loop()

graph.topologicalSort()
