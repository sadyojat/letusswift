/*
Runtime: 8 ms, faster than 97.03% of Swift online submissions for Binary Tree Zigzag Level Order Traversal.
Memory Usage: 21.3 MB, less than 33.33% of Swift online submissions for Binary Tree Zigzag Level Order Traversal.
*/

class Solution {
    
    var evenStack = [TreeNode]()
    var oddStack = [TreeNode]()
    var processor = [TreeNode]()


    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        return construct(root)
    }

    func construct(_ root: TreeNode) -> [[Int]]{
        evenStack.append(root)
        var depth = 0
        switchStack(depth)
        var result = [[Int]]()
        
        while !canExit() {
            var depthOutcome = [Int]()
            depth = depth + 1
            while !processor.isEmpty { 
                let last = processor.removeLast()
                depthOutcome.append(last.val)
                enqueue(last, depth)
            }
            result.append(depthOutcome)
            switchStack(depth)
        }
        return result
    }

    func canExit() -> Bool {
        return evenStack.isEmpty && oddStack.isEmpty && processor.isEmpty
    }

    func enqueue(_ node:TreeNode, _ depth: Int) {
        if depth%2 == 0 {
            if let right = node.right {
                evenStack.append(right)
            }
            if let left = node.left {
                evenStack.append(left)
            }
            
        } else {
            if let left = node.left {
                oddStack.append(left)
            }
            if let right = node.right {
                oddStack.append(right)
            }
            
            
        }
    }

    func switchStack(_ depth: Int) {
        if depth%2 == 0 {
            processor = Array(evenStack)
            evenStack = [TreeNode]()
        } else {
            processor =  Array(oddStack)
            oddStack = [TreeNode]()
        }
    }
}

extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val
    }
}

