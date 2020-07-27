///**
// * Definition for singly-linked list.
// * public class ListNode {
// *     public var val: Int
// *     public var next: ListNode?
// *     public init(_ val: Int) {
// *         self.val = val
// *         self.next = nil
// *     }
// * }
// */
//
//
//public class ListNode {
//     public var val: Int
//     public var next: ListNode?
//     public init(_ val: Int) {
//         self.val = val
//         self.next = nil
//     }
//}
//
//
///**
// * Definition for singly-linked list.
// * public class ListNode {
// *     public var val: Int
// *     public var next: ListNode?
// *     public init(_ val: Int) {
// *         self.val = val
// *         self.next = nil
// *     }
// * }
// */
//
//
//class Solution {
//    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        var l1  = l1, l2 = l2
//        var sum =  0
//        var head:ListNode?
//        var tail:ListNode?
//        var carryover = 0
//        
//        while l1 != nil && l2 != nil {
//            sum = (l1?.val ??  0) + (l2?.val ?? 0) + carryover
//            carryover = 0
//            var node:  ListNode?
//            if sum > 9 {
//                var diff = sum - 10
//                carryover = 1
//                node  = ListNode(diff)
//            } else {
//                node = ListNode(sum)
//            }
//            
//            if  head == nil && tail == nil {
//                head = node
//                tail = node
//            } else {
//                tail?.next = node
//                tail = node
//            }
//            l1 = l1?.next
//            l2 = l2?.next
//        }
//    
//        
//        tail = l1?.next != nil ? l1 : l2
//        
//        while tail != nil {
//            var  sum = (tail?.val ?? 0) + carryover
//            if  sum > 9 {
//                var value = sum - 10
//                tail?.val = value
//                carryover = 1
//            } else {
//                tail?.val = sum
//                carryover = 0
//            }
//            tail  = tail?.next
//        }
//        
//        if carryover > 0 {
//            var lastNode = ListNode(carryover)
//            tail?.next = lastNode
//            tail = lastNode
//        }
//        
//        return head
//    }
//}
//
