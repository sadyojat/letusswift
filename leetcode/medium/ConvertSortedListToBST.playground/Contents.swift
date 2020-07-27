import UIKit

var str = "https://leetcode.com/problems/convert-sorted-list-to-binary-search-tree/"


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
//    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//        let list = array(head)
//        return recurse(list)
//    }
    
    func recurse(_ list: [Int]) -> TreeNode? {
        if list.count > 1 {
            let median = (list.count ) / 2
            print("start \(list.startIndex) || median \(median) || end \(list.endIndex)")
            let node = TreeNode(list[median])
            node.left = recurse(Array(list[0..<median]))
            node.right = recurse(Array(list[median..<list.endIndex]))
            return node
        } else if list.count == 1 {
            let node = TreeNode(list[0])
            return node
        } else {
            return nil
        }
    }
    
    func printNode(_ node: TreeNode?) {
        guard let node = node else {
            return
        }
        
        print(node.val)
        printNode(node.left)
        printNode(node.right)
    }
    
//    func array(_ head: ListNode?) -> [Int] {
//        var head = head
//        var result = [Int]()
//        while let h = head {
//            result.append(h.val)
//            head = head?.next
//        }
//        return result
//    }
}


let s = Solution()
var node = s.recurse([-10,-3,0,5,9])
s.printNode(node)
