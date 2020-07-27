import UIKit

var str = "https://leetcode.com/problems/rotate-list/"


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var tracker: ListNode? = head
        var n = 1
        while tracker?.next != nil {
            tracker = tracker?.next
            n += 1
        }
        var tail:ListNode? = tracker
        tail?.next = head
        tracker = head
        var follower: ListNode? = head
        var counter = 0
        while counter < (n - (k%n)) {
            counter += 1
            follower = tracker
            tracker = tracker?.next
        }
        follower?.next = nil
        return tracker
    }
}
