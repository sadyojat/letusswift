struct Palindrome {
    var string: String = ""
    var start: Int = Int.min
    var end: Int = Int.min
    
    var exists: Bool {
        return !(start != Int.min || end != Int.min) && string.count > 0
    }
    
    init(_ string: String, _ start: Int, _ end: Int) {
        self.string = string
        self.start = start
        self.end = end
    }
}



class Solution {
    func shortestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let characters = Array(s)
        if let palindrome = longestPalindrome(s) {
            // check if it either at start or at end
           if palindrome.start == 0 || palindrome.end < s.count - 1 {
               let portion = String(characters[palindrome.end+1..<s.count])
               let flip = String(portion.reversed())
               return flip+palindrome.string+portion
           } else if  palindrome.start > 0  && palindrome.end == s.count - 1 {
               let portion = String(characters[0..<palindrome.start])
               let flip = String(portion.reversed())
               return portion+palindrome.string+flip
           } else  {
               return palindrome.string
           }
        } else {
            // mirror the string
            let flipPortion = String(characters[1..<characters.count]).reversed()
            return flipPortion+s
        }
    }
    
    
    func longestPalindrome(_ s: String) -> Palindrome? {
        guard s.count > 0 else {
            return nil
        }
        
        let characters = Array(s)
        var maxString = Tuple()
        for i in 0..<characters.count {
            let t1 = process(i, i, characters)
            let t2 = process(i, i+1, characters)
            let max = t1 > t2 ? t1 : t2
            maxString = maxString > max ? maxString : max
        }
        
        if maxString.length > 0 {
            return Palindrome(String(characters[maxString.left...maxString.right]), maxString.left, maxString.right )
        } else {
            return nil
        }
    }
    
    func process(_ l: Int, _ r: Int, _ characters: [Character]) -> Tuple {
        guard l >= 0 && r < characters.count else {
            return Tuple(Int.min, Int.min)
        }
        
        var left = l
        var right = r
        
        while left >= 0 && right < characters.count {
            if characters[left] == characters[right] {
                left = left - 1
                right = right + 1
            } else {
                break
            }
        }
        return Tuple(left + 1, right - 1)
    }
}

struct Tuple: Equatable, Hashable {
    var left: Int = Int.min
    var right: Int = Int.min
    var length: Int {
        return right - left
    }
    
    init() {
        self.left = Int.min
        self.right = Int.min
    }
    
    init(_ left: Int, _ right: Int) {
        self.left = left
        self.right = right
    }
    
    static func == (lhs: Tuple, rhs: Tuple) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right
    }
    
    static func > (lhs: Tuple, rhs: Tuple) -> Bool {
        return lhs.length > rhs.length
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(left)
        hasher.combine(right)
        hasher.combine(length)
    }
}
