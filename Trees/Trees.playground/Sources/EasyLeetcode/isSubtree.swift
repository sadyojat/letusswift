import Foundation

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
        
        if s == t { // if the nodes match, then start exploring both the left and right subtrees of each for a match
            return isSubtree(s.left, t.left) && isSubtree(s.right, t.right)
        } else {
            return isSubtree(s.left, t) || isSubtree(s.right, t)
        }
    }
}
