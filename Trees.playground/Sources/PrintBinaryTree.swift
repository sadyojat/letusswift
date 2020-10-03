import Foundation

/* Problem:: https://leetcode.com/problems/print-binary-tree/ */
/* Solution :: https://leetcode.com/problems/print-binary-tree/discuss/877477/DFS-%2B-DandC-oror-Recursive-%2B-EASY-oror-Super-Fast */


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


public class PrintBinaryTree {
    func printTree(_ root: TreeNode?) -> [[String]] {
        return fill(root, height(root))
    }
    
    
    func height(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        if root.left == nil, root.right == nil {
            return 0
        }
        return 1 + max(height(root.left), height(root.right))
    }
    
    func fill(_ root: TreeNode?, _ height: Int) -> [[String]] {
        let maxWidth = Int(truncating: NSDecimalNumber(decimal: pow(2, height))) * 2 - 1
        var matrix:[[String]] = Array(repeating: Array(repeating: "", count: maxWidth), count: height + 1)
        dfs_fill(root, &matrix, 0, maxWidth/2, maxWidth)
        return matrix
    }
    
    func dfs_fill(_ root: TreeNode?, _ matrix: inout [[String]], _ row: Int, _ column: Int, _ maxWidth: Int) {
        guard let root = root else {
            return
        }
        
        matrix[row][column] = "\(root.val)"
        dfs_fill(root.left, &matrix, row + 1, column - (maxWidth - column)/2 , column)
        dfs_fill(root.right, &matrix, row + 1, (maxWidth - column)/2 + column, maxWidth)
    }
}
