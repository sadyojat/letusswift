//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


func taskMaker(source: [String], challengeId: Int) -> [String] {

    return source.compactMap { (str: String) -> String? in        
        if !str.contains("//DB") {
            return str
        } else if str.contains("//DB \(challengeId)//") {
            let splitString = "//DB \(challengeId)//"
            return str.replacingOccurrences(of: splitString, with: "")
        } else {
            return nil
        }
    }
}


//: [Next](@next)
