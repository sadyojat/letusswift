import Foundation

class Solution {
    var visited = [String: Int]()
    var heap = [String]()
    
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let words = paragraph.split{ !$0.isLetter }
        let bannedSet = Set(banned)
        var map = [String: Int]()
        for word in words where !bannedSet.contains(String(word).lowercased()) {
            let key = String(word).lowercased()
            if let count = map[key] {
                map[key] = count + 1
            } else {
                map[key] = 1
            }
        }
        
        var sorted = Array(map).sorted{ $0.value < $1.value}.map{$0.key}
        print(sorted)
        return sorted.removeLast()    }
}

