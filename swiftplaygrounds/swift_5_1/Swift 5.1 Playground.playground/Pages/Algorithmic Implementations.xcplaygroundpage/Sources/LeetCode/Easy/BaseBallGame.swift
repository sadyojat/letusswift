import Foundation


// ["5","2","C","D","+"]
public func calPoints(_ ops: [String]) -> Int {
    var stack = [Int]()
    var sum =  0
    for string in  ops {
        switch string {
        case "C":
            print("Invalidate the  previous valid  round value")
            // Invalidate the  previous valid  round value
            if let previousValue = stack.last {
                print("Previous Sum --> \(sum) || Previous Value --> \(previousValue)")
                sum = sum - previousValue
                stack.removeLast()
                print("final sum --> \(sum)")
                
            }
            
        case "D":
            print("double of last valid round")
            // double of last valid round
            if let previousValue = stack.last {
                print("Previous Sum --> \(sum) || Previous Value --> \(previousValue)")
                sum = sum + 2 * previousValue
                print("final sum --> \(sum)")
            }
            
        case "+":
            print("sum of  the last 2 valid rounds")
            // sum of  the last 2 valid rounds
            if var last =  stack.last {
                
                let penul = stack[stack.count-2]
                print("Previous Sum --> \(sum) || Previous Value --> \(last)")
                sum = sum  +  last + penul
                print("final sum --> \(sum)")
            }
            
        default: // Integer, add it as-is
            let intValue = Int(string) ?? 0
            stack.append(intValue)
            sum = sum + intValue
            print(stack)
        }
    }
    
    return sum
}
