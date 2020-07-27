import UIKit

var str = "Range"


let r1 = Range(1...10)
let r2 = Range(9...20)
let r3 = Range(20...25)
let r4 = Range(19...24)
let r5 = Range(4...6)

func intersects(_ r1: Range<Int>, _ r2: Range<Int>) -> Bool {
    if r1.upperBound < r2.lowerBound || r2.upperBound < r1.lowerBound {
        return false
    } else {
        return true
    }
}

intersects(r1, r3)

