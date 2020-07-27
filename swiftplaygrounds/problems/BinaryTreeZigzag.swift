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
            while !processor.isEmpty { //print("Processor Is not empty")
                let last = processor.removeLast()
                //print("Pop \(last.val)")
                depthOutcome.append(last.val)
                enqueue(last, depth)
            }
            result.append(depthOutcome)
            switchStack(depth)
        }
        return result
    }

    func canExit() -> Bool {
        //print("evenStack \(evenStack.isEmpty) oddStack \(oddStack.isEmpty) processor \(processor.isEmpty)")
        return evenStack.isEmpty && oddStack.isEmpty && processor.isEmpty
    }

    func enqueue(_ node:TreeNode, _ depth: Int) {
        if depth%2 == 0 {
            if let right = node.right {
                evenStack.append(right)
                //print("inserting right \(right.val) in evenStack")
            }
            if let left = node.left {
                evenStack.append(left)
                //print("inserting left \(left.val) in evenStack")
            }
            
        } else {
            if let left = node.left {
                oddStack.append(left)
                //print("inserting left \(left.val) depth: \(depth) in oddStack")
            }
            if let right = node.right {
                oddStack.append(right)
                //print("inserting right \(right.val) depth: \(depth) in oddStack")
            }
            
            
        }
    }

    func switchStack(_ depth: Int) {
        //print("inside switchStack")
        if depth%2 == 0 {
            //print("processor is EVEN")
            processor = Array(evenStack)
            evenStack = [TreeNode]()
        } else {
            //print("processor is ODD")
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

