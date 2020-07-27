import Foundation


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
    
    public static func <= (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val <= rhs.val
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(next)
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let first = l1, let second = l2 else {
            if l1 == nil && l2 != nil {
                return l2
            } else if l2 == nil && l1 != nil {
                return l1
            } else {
                return nil
            }
        }
        
        if first <= second {
            first.next = mergeTwoLists(first.next, second)
            return first
        } else {
            second.next = mergeTwoLists(first, second.next)
            return second
        }

        
    }
}
