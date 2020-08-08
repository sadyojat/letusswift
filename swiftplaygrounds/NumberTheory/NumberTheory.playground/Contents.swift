import UIKit

var str = "NumberTheory!"

func mod_exponent(_ x: Int, _ y: Int) -> Int {
    var x = x, y = y
    var result = 1
    
    while y > 0 {
        if ((y&1) > 0) {
            result = result * x
        }
        
        y = y >> 1
        x = x * x
    }
    
    return result
}



func mod_inverse(_ a: Int, _ m: Int) -> Int {
    var a = a, m = m
    var result = Int.min
    a = a%m
    for x in 1 ..< m {
        if (a*x)%m == 1 {
            result = x
            break
        }
    }
    return result
}


mod_inverse(10, 17)
mod_exponent(2, 3)
