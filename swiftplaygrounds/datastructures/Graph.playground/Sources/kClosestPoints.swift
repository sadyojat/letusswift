import Foundation

class KClosestSolution {
    var heap = [HeapElement]()
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var result = [[Int]]()
        for point in points {
            insert(&heap, point, heapSize: K)
        }
        
        for heapElement in heap {
            result.append(heapElement.point)
        }
        return result
    }
    
    func eucledian(_ point: [Int]) -> Double {
        return sqrt(Double(point[0]*point[0]) + Double(point[1]*point[1]))
    }
    
    func insert(_ heap: inout [HeapElement], _ point: [Int], heapSize: Int) {
        let distance = eucledian(point)
        if heap.count < heapSize {
            var element = HeapElement()
            element.distance = distance
            element.point = point
            heap.append(element)
            bubbleUp(&heap, insertionIndex: heap.endIndex - 1)
        } else {
            if let top = heap.first {
                if top.distance > distance {
                    // top should be replaced
                    heap.removeFirst()
                    var element = HeapElement()
                    element.distance = distance
                    element.point = point
                    heap.insert(element, at: heap.startIndex)
                }
            }
        }
        
    }
    
    func bubbleUp(_ heap: inout [HeapElement], insertionIndex: Int) {
        var insertionIndex = insertionIndex
        let parentIndex = insertionIndex / 2
        
        while parentIndex >= heap.startIndex && heap[parentIndex] < heap[insertionIndex] {
            let temp = heap[parentIndex]
            heap[parentIndex] = heap[insertionIndex]
            heap[insertionIndex] = temp
            insertionIndex = parentIndex
        }
    }
    
}

struct HeapElement: Equatable {
    var distance = Double(Int.min)
    var point = [Int]()
    
    static func < (lhs: HeapElement, rhs: HeapElement) -> Bool {
        return lhs.distance < rhs.distance
    }
}
