import UIKit

var str = "Hello, playground"

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class BSTIterator {

    var queue = [TreeNode]()
    init(_ root: TreeNode?) {
        dfs(root)
    }
    
    func dfs(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
                
        if let right = node.right {
            dfs(right)
        }
        queue.append(node)
        if let left = node.left {
            dfs(left)
        }
        
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        return queue.removeLast().val
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !queue.isEmpty
    }
}
