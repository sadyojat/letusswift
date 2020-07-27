import Foundation

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

extension TreeNode: Equatable, Hashable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.left?.val == rhs.left?.val && lhs.right?.val == rhs.right?.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(left)
        hasher.combine(right)
    }
}

class Solution {
    func isSubtree(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        guard let s = a, let t = b else {
            if a == nil && b == nil {
                return true
            } else {
                return false
            }
        }
        
        if s == t {
            return isSubtree(s.left, t.left) && isSubtree(s.right, t.right)
        } else {
            return isSubtree(s.left, t) || isSubtree(s.right, t)
        }
    }
}
