import Foundation

var str = "Amazon Problems"


// Topological Sort
//let graph = Graph()
//graph.topSort()


// K Closest Points to Origin

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
        print("points \(point) || distance \(distance)")
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
                    bubbleDown(&heap)
                }
            }
            print("heap after eviction \(heap)")
        }
        
    }
    
    func bubbleUp(_ heap: inout [HeapElement], insertionIndex: Int) {
        var insertionIndex = insertionIndex
        var parentIndex = insertionIndex / 2
//        print("\(parentIndex) \(insertionIndex)")
        while parentIndex >= heap.startIndex && heap[parentIndex] < heap[insertionIndex] {
            let temp = heap[parentIndex]
            heap[parentIndex] = heap[insertionIndex]
            heap[insertionIndex] = temp
            insertionIndex = parentIndex
            parentIndex = insertionIndex/2
        }
        print("heap after bubbleUp \(heap)")
    }
    
    func bubbleDown(_ heap: inout [HeapElement]) {
        var currentIndex = heap.startIndex
        
        
        while currentIndex < heap.endIndex {
            var childIndex0 = 2 * currentIndex
            var childIndex1 = 2 * currentIndex + 1
            
            if childIndex0 >= heap.endIndex || childIndex1 >= heap.endIndex {
                break
            }
            if heap[currentIndex] < heap[childIndex0] {
                let temp = heap[currentIndex]
                heap[currentIndex] = heap[childIndex0]
                heap[childIndex0] = temp
                currentIndex = childIndex0
            } else if heap[currentIndex] < heap[childIndex1] {
                let temp = heap[currentIndex]
                heap[currentIndex] = heap[childIndex1]
                heap[childIndex1] = temp
                currentIndex = childIndex1
            } else {
                break
            }
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

var solution = KClosestSolution()
solution.kClosest([[68,97],[34,-84],[60,100],[2,31],[-27,-38],[-73,-74],[-55,-39],[62,91],[62,92],[-57,-67]], 5)

