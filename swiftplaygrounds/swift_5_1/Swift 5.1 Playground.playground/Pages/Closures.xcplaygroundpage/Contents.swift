import UIKit

var str = "Closures playground"

var names =  ["Walt", "Kiran", "Cema", "Hari"]


// Long Winded way

func backward(s1: String, s2: String) -> Bool {
    return s1 > s2
}

//var sortedNames = names.sorted(by: backward)

// -- Inline Notation
//var sortedNames = names.sorted { (s1, s2) -> Bool in
//    return s1 > s2
//}

// -- Inline, implicit parameter and returns
//var sortedNames = names.sorted { s1, s2 in s1 > s2 }

// -- Using Shorthand  Notation --
//var sortedNames = names.sorted {$0 > $1}

// -- Operator Method
var sortedNames = names.sorted(by: >)
sortedNames

