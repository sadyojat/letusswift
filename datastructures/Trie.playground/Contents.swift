import Foundation

var str = "Hello, Trie"


class TrieNode: Hashable, Equatable {
    var character: Character?
    var isEndOfWord: Bool = false
    var next = [Character: TrieNode]()
    
    init() {}
    
    init(_ c: Character) {
        self.character = c
    }
    
    static func == (_ lhs: TrieNode, _ rhs: TrieNode) -> Bool {
        return lhs.character == rhs.character
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(character)
    }
}


struct Trie {
    private var root = TrieNode()
    
    func addWord(_ word: String) {
        var pivot = root
        for c in word {
            let node = TrieNode(c)
            if let nextNode = pivot.next[c] {
                pivot = nextNode
            } else {
                pivot.next[c] = node
                pivot = node
            }
        }
        pivot.isEndOfWord = true
    }

    func construct(_ words: [String]) {
        for word in words {
            addWord(word)
        }
    }


    func match(_ word: String) -> Bool {
        guard !root.next.isEmpty, word.count > 0 else {
            return false
        }
        
        var p = root
        var flag = true
        for c in word {
            if let nextNode = p.next[c] {
                p = nextNode
            } else {
                flag = false
                break
            }
        }
        return flag
    }
}




//let t = Trie()
//t.construct(["Geeks", "Are", "For", "Geeks"])
//t.match("Geeks")
//t.match("Gee")
//t.match("Alok")
//t.match("For")

let boggle = [
    ["G", "I", "Z"],
    ["U", "E", "K"],
    ["Q", "S", "E"]
]

let words = ["GEEKS", "FOR", "QUIZ", "GO"]

let t = Trie()
t.construct(words)

struct Boggle {
    var boggle: [[String]]
    var visited = [Position]()
    
    init(_ b: [[String]]) {
        self.boggle = b
    }
    
    func scan() -> [String] {
        
        return []
    }
    
    func dfs(_ p: Position) {
        
    }
    
    func neighbors(_ p: Position) -> [Position] {
        return [
            Position(p.row, p.col-1),
            Position(p.row, p.col+1),
            Position(p.row-1, p.col),
            Position(p.row+1, p.col),
            Position(p.row-1, p.col-1),
            Position(p.row+1, p.col+1),
            Position(p.row+1, p.col-1),
            Position(p.row-1, p.col+1)
        ].filter { (p) -> Bool in
            return (p.row >= 0 && p.row < boggle.count && p.col >= 0 && p.col < boggle[0].count)
        }
    }
}

struct Position: Hashable, Equatable {
    var row: Int
    var col: Int
    
    init(_ row: Int, _ col: Int) {
        self.row = row
        self.col = col
    }
    
    static func == (_ lhs: Position, _ rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(col)
    }
}

