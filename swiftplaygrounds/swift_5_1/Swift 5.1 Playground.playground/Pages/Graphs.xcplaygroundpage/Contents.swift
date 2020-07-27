//: [Previous](@previous)

import Foundation

var str = "Hello, Enumerations"


//enum BarCode {
//    case upc(Int, Int, Int,  Int)
//    case qr(String)
//}
//
//var productBarcode = BarCode.upc(8, 44567, 32661, 3)  // Create a upc product barcode with an associated value type of (Int, Int, Int, Int)
//var qrCode = BarCode.qr("asdfobnqweionqowerqwe") // Create a qr code barcode  with a string associated value
//var code = qrCode
//
//switch code {
//case .upc(let a, let b, let c, let d):
//    var (x, y, z, t) = ( a,  b, c, d)
//    print("Captured a  upc barcode")
//case .qr(let productCode):
//    var string = productCode
//    print("Captured a  string QRCode")
//}


/// MARK State Machine implementation

enum NodeState {
    case explored, unexplored
}


// These will also be referenced by pointer hence it has to be  a class object and not a struct
class Node {
    var state = NodeState.unexplored
    var value: Int = NSNotFound
    var distance: Int = NSNotFound
    var connectedNodes: [Node] = [Node]()
}

let nodes = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let edges = [
    1:[2, 3, 4, 5,  9],
    2:[1,3,5],
    3:[1,2,4],
    4:[1,3,5],
    5:[1,2,4],
    9: [1, 6, 7, 8]
]

protocol Graphable {
    mutating func bfs(node: Node)
    mutating  func dfs()
    mutating func connectivity()
}

struct Graph: Graphable {
    
    /// MARK: Pseudocode
    /*
        1. Identify a starting  node S
        2. Mark S as explored
        3. Add S to bfsQueue (FIFO)
        4. while bfsQueue is not empty
                    -  pop  S
                    - Identify  all edges {S, v} such that v is not explored
                    - Add v to Q
                    - mark v as EXPLORED
    */
    mutating func bfs(node: Node) {
        guard node.value !=  NSNotFound else { return }
        node.state = .explored
        bfsQueue.insert(node, at: bfsQueue.startIndex)
        
        while !bfsQueue.isEmpty {
            let searchNode = bfsQueue.removeFirst()
            print("Exploring connectivity  for node \(searchNode.value)")
            for aNode in searchNode.connectedNodes {
                if aNode.state  == .unexplored {
                    bfsQueue.append(aNode)
                    aNode.state = .explored
                    aNode.distance  =  searchNode.distance + 1
                    print("Node \(aNode.value) is explored at distance \(aNode.distance)")
                }
            }
        }
    }
    
    mutating func djikstras(destination nodeValue: Int) {
        
    }
    
    mutating  func connectivity()  {
        reset()
        for  node in nodes {
            bfs(node: node)
        }
    }
    
    mutating func dfs() {
        
    }
    
    mutating func reset() {
        for node in nodes {
            node.state = .unexplored
        }
    }
    
    var startNode: Node = Node()
    var nodes = [Node]()
    var bfsQueue = [Node]()
    init(nodes:[Int], edges:[Int:[Int]]) {
        var tempNodes = [Node]()
        for node in nodes {
            if startNode.value == NSNotFound {
                startNode.value = node
                startNode.distance  = 0
                tempNodes.append(startNode)
            } else {
                let newNode = Node()
                newNode.value = node
                tempNodes.append(newNode)
            }
        }
    
        for node in tempNodes {
            self.nodes.append(node)
            if let connectedValues = edges[node.value], connectedValues.count > 0 {
                let connectedNodes = tempNodes.filter { (node) -> Bool in
                    return connectedValues.contains(node.value)
                }
                node.connectedNodes.append(contentsOf: connectedNodes)
            }
        }
    }
}

var g = Graph(nodes: nodes, edges: edges)
//for node in g.nodes {
//    print("node --> \(node.value)|| state --> \(node.state) || connectedNodeCount --> \(node.connectedNodes.count)")
//}
g.bfs(node: g.startNode)

//g.connectivity()
//: [Next](@next)
