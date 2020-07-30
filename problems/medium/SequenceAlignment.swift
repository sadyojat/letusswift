import UIKit

var str = "Hello, playground"

var str1 = "AAABCCCT"
var str2 = "AA_B_CCA"

var grid = Array(repeating: Array(repeating: 0, count: str1.count+1), count: str2.count+1)

var c1 = Array(str1)
var c2 = Array(str2)


let weight = 1
for i in 1...c1.count {
    for j in 1...c2.count {
        
        
        grid[i][j] = min(min(grid[i-1][j] + weight, grid[i][j-1]+weight), grid[i-1][j-1]+weight)
    }
}

print(grid)
