import UIKit

var str = "Hello, playground"

class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    
    func validate(_ root: TreeNode?, upperBound: Int, lowerBound: Int) -> Bool {
        guard let root = root else {
            return true
        }
        if root.val >= upperBound || root.val <= lowerBound {
            return false
        }
        return validate(root.left, upperBound: root.val, lowerBound: lowerBound)
            && validate(root.right, upperBound: upperBound, lowerBound: root.val)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return validate(root, upperBound: Int.max, lowerBound: Int.min)
    }
    
    
}
