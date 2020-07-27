import Foundation

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}



// DIVIDE & CONQUER
class LinkedList {
    
    func merge2Lists(_ first: ListNode?, _ second: ListNode?) -> ListNode? {
        return conquer(first, second)
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else {
            return nil
        }
        return divide(lists, 0, lists.endIndex-1)
    }
    
    
    func divide(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start == end {
            return lists[start]
        } else if end - start == 1 {
            return conquer(lists[start], lists[end])
        } else if end < start {
            return nil
        } else {
            let median = (end + start) / 2
            return conquer(divide(lists, start, median-1), divide(lists, median, end))
        }
    }
    
    func conquer(_ first: ListNode?, _ second: ListNode?) -> ListNode? {
        guard let f = first, let s = second else {
            if first == nil && second != nil {
                return second
            } else if second == nil && first != nil {
                return first
            } else {
                return nil
            }
        }
        
        if f.val <= s.val {
            f.next = conquer(f.next, s)
            return f
        } else {
            s.next = conquer(f, s.next)
            return s
        }
    }
}
