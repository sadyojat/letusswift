struct Position: Equatable, Hashable {
    var row: Int
    var col: Int
    
    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
    
    static func == (_ lhs: Position, _ rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
    
    func hash(_ hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }
}

class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        guard let first = rooms.first else {
            return
        }
        var maxRows = rooms.count
        var maxCols = first.count
                        
        for i in 0..<maxRows {
            for j in 0..<maxCols where rooms[i][j] != 0 || rooms[i][j] != -1 {
                let start = Position(i,j)
                var visited = Set<Position>()
                search(start, start, &rooms, &visited, maxRows, maxCols)
            }
        }
    }
    
    
    func search(_ start: Position, _ currentPosition: Position, _ rooms: inout [[Int]], _ visited: inout Set<Position>, _ maxRows: Int = 0, _ maxCols: Int = 0) {
        if start != currentPosition, rooms[currentPosition.row][currentPosition.col] == 0 {
            let startValue = rooms[start.row][start.col]
            let pValue = visited.count
            if startValue > pValue {
                rooms[start.row][start.col] = pValue
            }
            return
        }
        
        let nextPositions = neighbors(rooms, currentPosition, visited, maxRows, maxCols)
        for p in nextPositions {
            visited.insert(p)
            search(start, p, &rooms, &visited, maxRows, maxCols)
            visited.remove(p)
        }
                
    }
    
    
    func neighbors(_ rooms: [[Int]], _ c: Position, _ visited: Set<Position>, _ maxRows: Int = 0, _ maxCols: Int = 0) -> [Position] {
        return [
            Position(c.row-1, c.col),
            Position(c.row+1, c.col),
            Position(c.row, c.col-1),
            Position(c.row, c.col+1)].filter {
                $0.row >= 0 && $0.row < maxRows &&
                $0.col >= 0 && $0.col < maxCols &&
                !visited.contains($0) &&
                rooms[$0.row][$0.col] != -1
            }
    }
}
