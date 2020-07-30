/*
	DYNAMIC PROGRAMMING
	PRISON AFTER N DAYS 
*/



class Solution {


    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        guard N <= 1000000000 else {
            return []
        }        
        var result = Array(repeating: Array(repeating: 0, count: cells.count), count: 2)
        var collisionSet = Set<Int>()
        result[0] = cells
        collisionSet.insert(result[0].hashValue)
		var counter = 0
		while counter < N {
            result[1] = Array(repeating: 0, count: cells.count)
			result[1][0] = 0
            for j in 1..<cells.endIndex-1 { // column
                result[1][j] = ((result[0][j-1] == 0 && result[0][j+1] == 0)
                                || (result[0][j-1] == 1 && result[0][j+1] == 1)) ? 1 : 0
            }
            result[1][cells.endIndex - 1] = 0 
            
            // COLLISION HANDLING  
            if collisionSet.contains(result[1].hashValue) {
                return result[0]                
            } else {
                collisionSet.insert(result[1].hashValue)
            }
			result[0] = result[1]			
			counter += 1            
		}   

        return result[1]
    }
    
    
    
}



