import Foundation

public class TrieNode {
    var map = [Character: TrieNode?]()
    var isEndOfWord = false
    
    subscript (c: Character) -> TrieNode? {
        guard let node = map[c] as? TrieNode else { return nil }
        return node
    }
}


// eg : string = "abcdef"


public struct Trie {
    var head: TrieNode?
    public init() {
        
    }
    
    mutating public func insert(_ str: String) {
        var  str = str
        guard str.count > 0 else {  return }
        if let  head = head {
            
        } else {
            head = TrieNode()
            let c = str.removeFirst()
            let nextNode  = TrieNode()
            head?.map[c] = nextNode
        }
    }
}




