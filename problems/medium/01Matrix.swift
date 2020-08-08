/*

https://leetcode.com/problems/01-matrix/

Given a matrix consists of 0 and 1, find the distance of the nearest 0 for each cell.

The distance between two adjacent cells is 1.



Example 1:

Input:
[[0,0,0],
 [0,1,0],
 [0,0,0]]

Output:
[[0,0,0],
 [0,1,0],
 [0,0,0]]
Example 2:

Input:
[[0,0,0],
 [0,1,0],
 [1,1,1]]

Output:
[[0,0,0],
 [0,1,0],
 [1,2,1]]


Note:

The number of elements of the given matrix will not exceed 10,000.
There are at least one 0 in the given matrix.
The cells are adjacent in only four directions: up, down, left and right.
*/


struct Position: Equatable, Hashable {
    var x: Int
    var y: Int
    var depth: Int = Int.min


    init(_ x: Int, _ y: Int, _ depth: Int = 0) {
        self.x = x
        self.y = y
        self.depth = depth
    }

    static func == (_ lhs: Position, _ rhs:Position) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}


class Solution {
    func updateMatrix(_ matrix: [[Int]]) -> [[Int]] {
        guard let first = matrix.first else {
            return []
        }
        let maxRows = matrix.count
        let maxCols = first.count
        var result = Array(repeating: Array(repeating:0, count: maxCols), count:maxRows)

        for i in 0..<maxRows {
            for j in 0..<maxCols {
                bfs(Position(i,j), matrix, &result, 0, maxRows, maxCols)
            }
        }
        return result
    }


    func bfs(_ start: Position, _ matrix: [[Int]], _ result: inout [[Int]], _ depth: Int, _ maxRows: Int, _ maxCols: Int) {
        var start = start
        start.depth = 0
        var queue = [Position]()
        queue.append(start)

        while !queue.isEmpty {
            let p = queue.removeFirst()

            if matrix[p.x][p.y] == 0 {
                result[start.x][start.y] = p.depth
                return
            } else {
                let n = neighbors(p, maxRows, maxCols)
                queue.append(contentsOf: n)
            }
        }
    }

    func neighbors(_ position: Position, _ maxRows: Int, _ maxCols: Int) -> [Position] {
        let depth = position.depth
        return [
            Position(position.x, position.y+1, depth+1),
            Position(position.x, position.y-1, depth+1),
            Position(position.x+1, position.y, depth+1),
            Position(position.x-1, position.y, depth+1)
        ].filter {
            $0.x >= 0 && $0.x < maxRows && $0.y >= 0 && $0.y < maxCols
        }
    }
}
