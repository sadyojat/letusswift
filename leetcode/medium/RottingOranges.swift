class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        var grid = grid
        var rottenQueue = Set<Tuple>()
        var freshOranges = 0
        var minuteCount = 0
        
        // Identify the list of rotten oranges & count of freshOranges
        for row in 0..<grid.count {
            for column in 0..<grid[row].count {
                if grid[row][column] == 2 {
                    rottenQueue.insert(Tuple(row, column))
                } else if grid[row][column] == 1 {
                     freshOranges = freshOranges + 1
                 }
            }
        }
            
        
        // Start Processing
        while !rottenQueue.isEmpty {
            let first = rottenQueue.removeFirst()
            var neighbors = [(Int, Int)]()
            let rowNeighbors = first.row == 0 ? 
            	[(first.row + 1, first.column)] : (first.row == grid.count - 1) ?
                [(first.row - 1, first.column)] : 
                [(first.row-1, first.column), (first.row+1, first.column)]
            let columnNeighbors = first.column == 0 ? 
            	[(first.row, first.column + 1)] : (first.column == grid[0].count - 1) ?
                [(first.row, first.column - 1)] : 
                [(first.row, first.column-1), (first.row, first.column+1)]
            neighbors.append(contentsOf: rowNeighbors)
            neighbors.append(contentsOf: columnNeighbors)
            var increment = false
            for neighbor in neighbors where neighbor.0 >= 0 && 
            	neighbor.0 < grid.count &&
                neighbor.1 >= 0 && neighbor.1 < grid[0].count && 
                grid[neighbor.0][neighbor.1] == 1 {
                grid[neighbor.0][neighbor.1] = 2
                rottenQueue.insert(Tuple(neighbor.0, neighbor.1))
                freshOranges = freshOranges - 1
                increment = true
            }
            minuteCount = increment ? minuteCount + 1 : minuteCount
        }
        return freshOranges == 0 ? minuteCount : -1
    }
}

struct Tuple: Hashable {
    var row: Int = 0
    var column: Int = 0
    
    init(_ row: Int, _ column: Int) {
        self.row = row
        self.column = column
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(column)
    }
}
    
    


var s = Solution()
s.orangesRotting([[2,0,1,2,1,2]])



