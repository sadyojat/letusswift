import Foundation



public func findItinerary(_ tickets: [[String]]) -> [String] {
    guard tickets.count > 0 else {
        return []
    }

    var available = [[String]: Int]()
    for path in tickets {
        appendPath(&available, path)
    }

    var processed = [[String]: Int]()
    var result = ["JFK"]
    helper(tickets, &result, &processed, &available, "JFK")
    return result
}
    
fileprivate func helper(_ tickets: [[String]], _ result: inout [String], _ processed: inout [[String]: Int], _ available: inout [[String]: Int], _ start: String){
    guard tickets.count > processed.count else {
        return
    }
        
    let paths = tickets.filter { (airports) -> Bool in
        return airports[0] == start
    }.sorted { (a, b) -> Bool in
        return a[1].lexicographicallyPrecedes(b[1])
    }
    
    if paths.isEmpty {
        let last = result.removeLast()
        let penultimate = result.last ?? ""
        removePath(&processed, [penultimate, last])
        if let count = available[[penultimate, last]] {
            available[[penultimate, last]] = count + 1
        } else {
            available[[penultimate, last]] = 1
        }
        return
    }
    
    for path in paths  {
        if let count = available[path] {
            appendPath(&processed, path)
            removePath(&available, path)
            let start = path[1]
            result.append(start)
            helper(tickets, &result, &processed, &available, start)
        }
    }
}


fileprivate func appendPath(_ dict: inout [[String]: Int], _ path: [String]) {
    if let count = dict[path] {
        dict[path] = count + 1
    } else {
        dict[path] = 1
    }
}

fileprivate func removePath(_ dict: inout [[String]: Int], _ path: [String] ) {
    if let count = dict[path] {
        if count > 1 {
            dict[path] = count - 1
        } else {
            dict.removeValue(forKey: path)
        }
    }
}
