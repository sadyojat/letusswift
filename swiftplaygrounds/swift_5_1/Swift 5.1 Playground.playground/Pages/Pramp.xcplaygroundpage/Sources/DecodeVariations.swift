import Foundation

public func decodeVariations(_ stringOfNumbers: String) -> Int  {
    var count  = 0
    var index = stringOfNumbers.startIndex
    repeat {
        var c = stringOfNumbers[index]
        print("Processing for  \(c)")
        var number =  Int(String(c)) ?? 0
        if  number == 1 && index != stringOfNumbers.endIndex {
            
            count  = count + 2
            print("1: incrementing by 2 || count \(count)")
        } else if number == 2 && index != stringOfNumbers.endIndex  {
            var nextIndex =  stringOfNumbers.index(after: index)
            var nextC = stringOfNumbers[nextIndex]
            var nextNum = Int(String(nextC)) ?? 0
            if  nextNum < 7 {
                count = count + 2
                print("2: incrementing by 2 || count \(count)")
            } else {
                
                count = count + 1
                print("2: incrementing by 1 || count \(count)")
            }
        } else {            
            count = count + 1
            print("ALL: incrementing by 1 || count \(count)")
        }
        index = stringOfNumbers.index(after: index)
    } while index < stringOfNumbers.endIndex
    return  count
}
