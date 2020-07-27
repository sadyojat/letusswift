import Foundation


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

public func splitListToParts(_ root: ListNode?, _ k: Int) -> [[Int?]] {
    print("root --> \(root?.val)")
    var count: Double  = 0.0
    guard var root = root else {
        fatalError("Root is NIL")        
    }
    var tracker = root
    
    print("tracker -> \(tracker)")
    // Calculate the  count of elements in the  list
    
    repeat {
        count = count + 1
        if  let next = tracker.next {
            tracker = next
        } else {
            break
        }
    } while true
    
    print("Count -->  \(count)")
    var result = [[Int?]]()
    var  element = [Int?]()
    
    
    if (Double(k) > count) {
        var t = root
        for i in 0..<k {
            
            if let newT = t.next {
                element.append(t.val)
                t = newT
            } else {
                
            }
            
        }
    }
    
    
    
    
    
    var value: Double = count/Double(k)
    var floorValue = value.rounded(.down)
    var ceilValue = value.rounded(.up)

    
    print("floorValue -->  \(floorValue) || ceilValue --> \(ceilValue)")
    
    var splitCount = floorValue
    var isFloorValue = (splitCount == floorValue)
    tracker = root
    
    while splitCount > 0 {
        element.append(tracker.val)
        if let next = tracker.next {
            tracker = next
        } else {
            result.append(element)
            break
        }
        splitCount = splitCount - 1
        if splitCount == 0 {
            result.append(element)
            element  = [Int?]()
            splitCount = isFloorValue ? ceilValue : floorValue
            isFloorValue = (splitCount == floorValue)
        }
    }
    return result
}
