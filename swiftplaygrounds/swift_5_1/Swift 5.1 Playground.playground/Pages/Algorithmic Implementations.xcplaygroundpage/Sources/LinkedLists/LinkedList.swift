import Foundation

public class Node {
    public var value: Int
    public var previous: Node?
    public var next: Node?
    
    public init(value: Int) {
        self.value = value
    }
}

public class LinkedList {
    
    public var head: Node?
    public var tail: Node?
    
    public init() {
    }
    
    public func isEmpty() -> Bool {
        return (head == nil)
    }
    
    public func push(value: Int) {
        let node = Node(value: value)
        if head == nil {
            head = node
            tail = node
        } else {
            node.previous = tail
            tail?.next = node
            tail = node
        }        
    }
    
    public func pop() {
        print("\n Popping Head element in Linked List")
        guard let head = head, let _ = tail else {
            print("Empty List, nothing to pop")
            return
        }
        self.head = head.next
        self.head?.previous = nil
    }
    
    public func printList() {
        guard let head = head, let _ = tail else { return }
        var pointer = head
        repeat {
            print("\(pointer.value)")
            guard let next = pointer.next else { break }
            pointer = next
        } while true
    }
}
