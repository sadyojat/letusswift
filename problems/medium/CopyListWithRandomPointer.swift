import UIKit

var str = "Copy List with random pointer"

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public var random: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *           self.random = nil
 *     }
 * }
 */


public class Node: Equatable, Hashable {
 public var val: Int
 public var next: Node?
 public var random: Node?
 public init(_ val: Int) {
     self.val = val
     self.next = nil
       self.random = nil
 }
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next && lhs.random == rhs.random
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next)
        hasher.combine(random)
    }
}


class Solution {
    var map = [Node: Node]()
    func copyRandomList(_ head: Node?) -> Node? {
        guard let head = head else {
            return nil
        }
        return recurse(head)
    }
    
    func recurse(_ original: Node) -> Node? {
        if let duplicate = copy(original) {
            if let random = original.random {
                duplicate.random = copy(random)
            }
            if let next = original.next {
                duplicate.next = recurse(next)
            }
            return duplicate
        } else {
            return nil
        }
    }
    
    func copy(_ original: Node) -> Node? {
        if map[original] == nil {
             map[original] = Node(original.val)
        }
        return map[original]
    }
}
