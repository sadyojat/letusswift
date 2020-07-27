/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        guard (s != nil && t != nil) || (s == nil && t == nil) else {
            return false
        }
        
        if let s = s, let t = t {
            
            // Once the root of the subtree is matched then subsequent subtrees have to be equal
            if s.val == t.val {
                return isSubtree(s.left, t.left) && isSubtree(s.right, t.right)
            } else {
                return isSubtree(s.left, t) || isSubtree(s.right, t)
            }
        } else {
            return true
        }
    }
}
   
