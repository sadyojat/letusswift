import UIKit

var str = "https://leetcode.com/problems/swap-nodes-in-pairs/"



/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: Equatable, Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next)
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if  let head = head, let next = head.next {
            head.next = swapPairs(next.next)
            next.next = head
            return next
        } else {
            return head
        }
        
    }
}
