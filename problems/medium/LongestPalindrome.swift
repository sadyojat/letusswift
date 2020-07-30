class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var characters = Array(s)        
        var maxLength = 0
        var maxString = ""
        var initialResult: (Int, String) = (0,"")
        
        for i in 0..<characters.count {
            let tuple1 = process(i, i, characters)  
            let tuple2 = process(i, i+1, characters)    
            var newString1 = ""
            var newString2 = ""
            var t1Length = 0
            var t2Length = 0
            if !(tuple1.0 == Int.min || tuple1.1 == Int.min) {
                t1Length = tuple1.1 - tuple1.0
            }
            
            if !(tuple2.0 == Int.min || tuple2.1 == Int.min) {
                t2Length = tuple2.1 - tuple2.0
            }
            if t2Length > t1Length {
                if maxLength < t2Length {
                    maxLength = t2Length
                    maxString = String(characters[tuple2.0...tuple2.1])
                }
            } else {
                if maxLength <= t1Length {
                    maxLength = t1Length
                    maxString = String(characters[tuple1.0...tuple1.1])
                }
            }
        }
        
        return maxString
        
    }
    
    func process(_ l: Int, _ r: Int, _ characters: [Character]) -> (Int, Int) {
        guard l >= 0 , r < characters.count else {
            return (Int.min, Int.min)
        }
        var flag = false
        var left = l 
        var right = r
        repeat {
                if characters[left] == characters[right] {
                    left = left - 1
                    right = right + 1
                    flag = true
                } else {
                    break
                }                
            } while( left>=0 && right<characters.count )
            
            if flag {
                left = left + 1
                right = right - 1
                return (left, right)   
            }                        
            return (Int.min, Int.min)
    }
}