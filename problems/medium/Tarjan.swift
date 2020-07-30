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