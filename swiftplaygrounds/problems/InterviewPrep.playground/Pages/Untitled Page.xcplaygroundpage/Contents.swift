import UIKit

var str = "Hello, playground"

func generateRandomList(count: Int) -> [Int] {
    var list = [Int]()
    for _ in 0..<count {
        list.append(Int(arc4random_uniform(UInt32(100))))
    }
    return list
}


func countUniques<T:Comparable> (_ array: [T]) -> Int  {
    let sorted = array.sorted()
    let initial:(T?, Int) = (.none, 0)
    
    let reduced = sorted.reduce(initial) {
        ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
    }
    return reduced.1
}


extension Array where Element:  Comparable {
    func countUniques() -> Int {
        var sorted = self.sorted()
        let initial:(Element?, Int) = (.none, 0)
        
        var reduced = sorted.reduce(initial) { ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)}
        return reduced.1
    }
    
    func countDuplicates() -> Int {
        var sorted = self.sorted()
        let initial:(Element?, Int) = (.none, 0)
        
        var reduced = sorted.reduce(initial) {
            ($1, $0.0 == $1 ? $0.1 + 1 : $0.1)
        }
        return reduced.1
    }
}



//let list = generateRandomList(count: 10)
let list = [0, 12, 0, 12, 4, 3, 4, 3, 5 ,6, 6]

countUniques(list)
list.countUniques()
list.countDuplicates()

struct EmptyStruct {
    
}


