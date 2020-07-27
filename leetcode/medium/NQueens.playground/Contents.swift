import UIKit

var str = "Hello, playground"


let total = 4

var visitedRows = Set<Int>()
var visitedColumns = Set<Int>()

for i in 0..<4 where !visitedRows.contains(i) {
    visitedRows.insert(i)
    
    for j in 0..<4 where !visitedColumns.contains(j) {
        
    }
}
    
