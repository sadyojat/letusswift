/*
Given an input string as AAABBCCDDE print output 3A2B2C2DE
*/



struct Tuple: Equatable, Hashable {
    var count: Int
    var char: Character

    init(_ count: Int, _ char: Character) {
        self.count = count
        self.char = char
    }

    static func == (_ lhs: Tuple, _ rhs: Tuple) -> Bool {
        return lhs.count == rhs.count && lhs.char == rhs.char
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(count)
        hasher.combine(char)
    }
}


func processString(_ str: String) -> String {
    guard str.count > 0 else {
        return ""
    }

    let characters = Array(str)
    var result = [Tuple]()
    for c in characters {
        if result.isEmpty {
            result.append(Tuple(1, c))
        } else {
            if let lastTuple = result.last {
                let character = lastTuple.char
                if c == character {
                    let newTuple = Tuple(lastTuple.count+1, lastTuple.char)
                    result.removeLast()
                    result.append(newTuple)
                } else {
                    result.append(Tuple(1, c))
                }
            }
        }
    }

    let newResult = result.map { (tuple) -> String in
        if tuple.count == 1 {
            return String(tuple.char)
        } else {
            return String(tuple.count)+String(tuple.char)
        }
    }.reduce("") { (partialResult, s) -> String in
        return partialResult+s
    }

    return newResult
}


var str = "BAAABBCCDDE"
var output = "3A2B2C2DE"

print(processString(str))
