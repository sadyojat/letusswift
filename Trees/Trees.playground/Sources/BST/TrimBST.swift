import Foundation

/*
    Given the root of a binary search tree and the lowest and highest boundaries as low and high, trim the tree so that all its elements lies in [low, high]. You might need to change the root of the tree, so the result should return the new root of the trimmed binary search tree.
 
 PROBLEM LINK :: https://leetcode.com/problems/trim-a-binary-search-tree/
*/

func trimBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> TreeNode? {
    var root = root
    guard let r = root else {
        return root
    }
    
    // When the root has a value lower than the value in the valid range, then the left subtree is invalid in a BST scenario
    // hence, you can push the right subtree to the root position and process recursively
    // similarly when the root value is higher than the valid range, then the right subtree is invalid and the left subtree should be pushed to root position
    // when the value is in range, process both the left and right subtrees
    if r.val < low {
        root = trimBST(root?.right, low, high)
    } else if r.val > high {
        root = trimBST(root?.left, low, high)
    } else {
        root?.left = trimBST(root?.left, low, high)
        root?.right = trimBST(root?.left, low, high)
    }    
    return root
}
