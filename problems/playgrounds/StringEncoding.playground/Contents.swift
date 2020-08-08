import Foundation

var str = "(1+(4+5+2)-3)+(6+8)"
var output = 23



func calculate(_ str: String) -> Int {
    var stack = [Character]()
    
    var characters = Array(str)
    
    for c in characters {
        if c == ")" {
            // pop until (
        } else {
            stack.append(c)
        }
    }
    
    return Int.min
}

func process(_ characters: [Character]) -> Int {
    var start = 0
    var result = 0
    while start <= characters.count {
        let c = characters[start]
        if c == "+" {
            result += Int(String(c)) ?? 0
        }
    }
}
