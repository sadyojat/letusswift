import UIKit

var str = ")("


var list = Array(str)
var chosen = Array(repeating: false, count: list.count)
var permutation = [Character]()
var validPermutations = Set<String>()


func search() {
    if permutation.count == list.count {
        // process permutation
        let s = String(permutation)
        if !validPermutations.contains(s) && isBalanced(s) {
            validPermutations.insert(s)
            print(s)
        }
//        print(permutation)
    } else {
        for (i,c) in list.enumerated() where chosen[i] == false {
            chosen[i] = true
            permutation.append(c)
            search()
            chosen[i] = false
            permutation.removeLast()
        }
    }
}

func isBalanced(_ string: String) -> Bool {
    var stack = [Character]()
    for c in string where !(c.isLetter || c.isNumber || c.isWholeNumber ) {
        if c == ")" {
            if let last = stack.last, last == "(" {
                stack.removeLast()
            } else {
                return false
            }
        } else {
            stack.append(c)
        }
    }
    
    return stack.count == 0
}

search()
