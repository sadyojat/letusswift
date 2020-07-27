struct Shape: Equatable, Hashable {
    var points: [(Int,Int)]
    
    init(_ points: [(Int, Int)]) {
        self.points = points
    }
    
    public static func calculateSlope(_ point1: (Int,Int), _ point2: (Int, Int)) -> Int {
        return abs(point2.0 - point1.0) > 0 ? abs((point2.1 - point1.1) / (point2.0 - point1.0)) : Int.max
    }
    
    public static func == (lhs: Shape, rhs: Shape) -> Bool {
        if lhs.points.count == rhs.points.count {
            let s1 = lhs.points[0]
            let s2 = rhs.points[0]
            for i in 0..<lhs.points.count {
                if calculateSlope(lhs.points[i], s1) != calculateSlope(rhs.points[i], s2) {
                    return false
                }
            }            
            return true
        } else {
            return false
        }
        
    }
    
    public func hash(into hasher: inout Hasher) {
    
    }
    
}

class Solution {
    
    var visited = Set<[Int]>()
    var grid = [[Int]]()
    var maxRows = 0
    var maxColumns = 0
    var islandGroup = [[(Int,Int)]]()
    var islands = [(Int, Int)]()
    func numDistinctIslands(_ grid: [[Int]]) -> Int {
        
        guard grid.count > 0 else {
            return 0
        }
                
        maxRows = grid.count
        maxColumns = grid[0].count
        
        for i in 0..<maxRows {
            for j in 0..<maxColumns where grid[i][j] == 1 {
                if !visited.contains([i, j]) {
                    islands = [(Int, Int)]()
                    dfs(i,j, grid)
                    if islands.count > 0 {
                        // print("Insert islands \(islands)")
                        islandGroup.append(islands.sorted{$0.0 < $1.0})
                    }
                }
            }
        }
        let shapes = islandGroup.map{Shape($0)}
        // print("shapes \(shapes)")
        var uniqueShapes = Set<Shape>()
        for shape in shapes {
            uniqueShapes.insert(shape)
        }
        // print("uniqueShapes \(uniqueShapes)")
        return uniqueShapes.count
    }

    
    func dfs(_ i: Int, _ j: Int, _ grid: [[Int]]) {
        
        visited.insert([i,j])
        // print("inserting \([i,j]) in islands")
        islands.append((i,j))
        let n = neighbors(i,j,grid)
        for aNeighbor in n where !(aNeighbor.0 < 0 || aNeighbor.0 >= maxRows || aNeighbor.1 < 0 || aNeighbor.1 >= maxColumns)
        && !visited.contains([aNeighbor.0, aNeighbor.1])
        && grid[aNeighbor.0][aNeighbor.1] == 1 {
            dfs(aNeighbor.0, aNeighbor.1, grid)
        }
    }
    
    func neighbors(_ i: Int, _ j: Int, _ grid: [[Int]]) -> [(Int,Int)] {
        return [(i-1, j), (i+1, j), (i, j-1), (i, j+1)]
    }
}



