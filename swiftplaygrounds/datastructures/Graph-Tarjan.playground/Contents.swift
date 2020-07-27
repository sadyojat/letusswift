import UIKit

var str = "Tarjan's Algorithm"

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

class Graph {
    var visited = Set<Node>()
    var initialDiscoveryTime = [Node: Int]()
    var lowestDiscoveryTime = [Node: Int]()
    var map = [Node: Set<Node>]()
    var previousNeighbor = [Node: Node]()
    var failureNodes = Set<Node>()
    var criticalPaths = [[Int]]()
    static var time = 0
    
    func addEdge(_ value1: Int, _ value2: Int) {
        let node1 = Node(value1)
        let node2 = Node(value2)
        
        if var neighbors = map[node1] {
            neighbors.insert(node2)
            map[node1] = neighbors
        } else {
            map[node1] = Set([node2])
        }
        initialDiscoveryTime[node1] = Int.max
        if var neighbors = map[node2] {
            neighbors.insert(node1)
            map[node2] = neighbors
        } else {
            map[node2] = Set([node1])
        }
        initialDiscoveryTime[node2] = Int.max
    }
    
    private func dfs(_ graph: inout [Node: Set<Node>], _ s: Node ) {
        visited.insert(s)
        initialDiscoveryTime[s] = Graph.time
        lowestDiscoveryTime[s] = Graph.time
        Graph.time = Graph.time + 1
        for neighbor in map[s] ?? [] where previousNeighbor[s] != neighbor {
            previousNeighbor[neighbor] = s
            if !visited.contains(neighbor) {
                dfs(&graph, neighbor)
            }
            
            if let i = initialDiscoveryTime[s], let ln = lowestDiscoveryTime[neighbor], i > ln {
                // not an articulation point hence update lowestDiscoveryTime of node
                lowestDiscoveryTime[s] = ln
            } else {
                // articulation point = failure nodes in the graph
                failureNodes.insert(s)
                
                // Critical Edges = If these break then the graph becomes disjointed
                if let ls = lowestDiscoveryTime[s], let ln = lowestDiscoveryTime[neighbor], ls != ln {
                    criticalPaths.append([s.value, neighbor.value])
                }
                
            }
        }
    }
    
    func callLoop(_ startingNode: Node) {
        var tempGraph = map
        failureNodes.insert(startingNode)
        dfs(&tempGraph, startingNode)
    }
}



var g = Graph()
g.addEdge(0, 4)
g.addEdge(4, 2)
g.addEdge(2, 1)
g.addEdge(2, 3)
g.addEdge(3, 4)
g.addEdge(0, 5)
g.addEdge(5, 6)
g.addEdge(5, 7)
g.addEdge(7, 6)
g.addEdge(6, 5)
g.addEdge(7, 8)


let sNode = Node(0)
g.callLoop(sNode)
//print(g.failureNodes)
//
//for node in g.failureNodes.sorted(by: {$0.value < $1.value}) {
//    print(node.value)
//}


print(g.criticalPaths)
//for tuple in g.map {
//    let node = tuple.key
//    g.map[node] = tuple.value
//    print("node: \(node.value) || visited Time = \(node.initialDiscoveryTime) || lowestDiscoveryTime = \(node.lowestDiscoveryTime)")
//}
