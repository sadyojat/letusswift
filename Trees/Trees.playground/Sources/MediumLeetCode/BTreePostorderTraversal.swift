import Foundation

/*
 Problem :: https://leetcode.com/problems/binary-tree-postorder-traversal/
 Solution :: https://leetcode.com/problems/binary-tree-postorder-traversal/discuss/879697/Simple-postorder-recursion-oror-Swift-0ms-100-faster
 */


func postorderTraversal(_ root: TreeNode?) -> [Int] {
        return traverse(root, [])
    }
    
fileprivate func traverse(_ root: TreeNode?, _ result: [Int]) -> [Int] {
    guard let root = root else {
        return []
    }
    var result = result
    result.append(contentsOf: traverse(root.left, []))
    result.append(contentsOf: traverse(root.right, []))
    result.append(root.val)
    return result
}
