//: [Previous](@previous)

import Foundation

var str = "Hello, Heap"

struct Heap {
    var isMinHeap: Bool
    
    var items = [Int]()
    var sortedItems = [Int]()
    
    init(isMinHeap: Bool) {
        self.isMinHeap = isMinHeap
    }
    
    mutating func insert(_ element: Int) {
        items.append(element)
        bubbleUp()
    }
    
    mutating func bubbleUp() {
        var childIndex = items.count - 1
        var parentIndex = parent(of: childIndex)
        var closure = bubbleUpClosure(parentIndex: parentIndex, childIndex: childIndex)
        while (parentIndex != NSNotFound) && closure()  {
            swap(parentIndex: parentIndex, childIndex: childIndex)
            childIndex = parentIndex
            parentIndex = parent(of: childIndex)
            closure = bubbleUpClosure(parentIndex: parentIndex, childIndex: childIndex)
        }
    }
    
    func bubbleUpClosure(parentIndex: Int, childIndex: Int) -> (()->Bool) {
        if isMinHeap {
            return { () -> Bool in
                return self.items[parentIndex] > self.items[childIndex]
            }
        } else {
            return { () -> Bool in
                return self.items[parentIndex] < self.items[childIndex]
                
            }
        }
    }
    
    mutating func swap(parentIndex: Int, childIndex: Int) {
        let temp = items[parentIndex]
        items[parentIndex] = items[childIndex]
        items[childIndex] = temp
    }
    
    func parent(of index: Int) -> Int  {
        return (index/2 >= 0) ? index/2 : NSNotFound
    }
    
    mutating func extractMin() -> Int {
        guard items.count > 0 else  { return NSNotFound }
        let minValue =  items.removeFirst()
        if  items.count > 0 {
            let lastValue = items.removeLast()
            items.insert(lastValue, at: items.startIndex)
            bubbleDown()
        }
        return minValue
    }
    
    mutating func bubbleDown() {
        // initialization
        guard items.count > 0 else { return }
        var parentIndex = items.startIndex
        var childIndex = child(of: parentIndex)
        
        while childIndex != NSNotFound && (items[parentIndex] > items[childIndex]) {
            swap(parentIndex: parentIndex, childIndex: childIndex)
            parentIndex = childIndex
            childIndex = child(of: parentIndex)
        }
    }
    
    func child(of index: Int) -> Int {
        guard index * 2  < items.count else { return NSNotFound }
        let firstChild = index * 2
        let secondChild = ((index * 2) + 1) < items.count  ? ((index * 2) + 1) : NSNotFound
        
        if secondChild == NSNotFound {
            return firstChild
        } else {
            return (items[firstChild] <= items[secondChild]) ? firstChild : secondChild
        }
    }
    
    mutating func sort() {
        sortedItems = [Int]()
        while items.count > 0 {
            sortedItems.append(self.extractMin())
        }
    }
    
}

var heap = Heap(isMinHeap: true)
var list = [7, 6, 10, 4 ,1, 9]

for element in list {
    heap.insert(element)
}
heap.items
//heap.extractMin()
//heap.items
//heap.extractMin()
//heap.items


heap.sort()
heap.sortedItems




