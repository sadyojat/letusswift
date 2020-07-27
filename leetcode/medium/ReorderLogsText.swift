import Foundation

/*
 You have an array of logs.  Each log is a space delimited string of words.

 For each log, the first word in each log is an alphanumeric identifier.  Then, either:

 Each word after the identifier will consist only of lowercase letters, or;
 Each word after the identifier will consist only of digits.
 We will call these two varieties of logs letter-logs and digit-logs.  It is guaranteed that each log has at least one word after its identifier.

 Reorder the logs so that all of the letter-logs come before any digit-log.  The letter-logs are ordered lexicographically ignoring identifier, with the identifier used in case of ties.  The digit-logs should be put in their original order.

 Return the final order of the logs.

  

 Example 1:

 Input: logs = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"]
 Output: ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]
  

 Constraints:

 0 <= logs.length <= 100
 3 <= logs[i].length <= 100
 logs[i] is guaranteed to have an identifier, and a word after the identifier.
 */

enum LogType {
    case digit
    case letter
}

struct Log {
    var id: String = ""
    var values: String = ""
    var type: LogType = .letter
    var originalString: String
    
    init(_ string: String) {
        self.originalString = string
        if let index = string.firstIndex(of: " ") {
            self.id = String(string.prefix(upTo: index))
            self.values = String(string.suffix(from: index))            
            self.type = Double(self.values.components(separatedBy: " ")[1]) == nil ? .letter : .digit
        }
    }
}

class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        let newLogs = logs.map{Log($0)}
        let digitLogs = newLogs.filter { $0.type == .digit }.map {$0.originalString}
        let letterLogs = newLogs.filter { $0.type == .letter }.sorted { 
            (log1, log2) -> Bool in
                                         
            if log1.values == log2.values {
                return log1.id.lexicographicallyPrecedes(log2.id)
            } else {
                return log1.values.lexicographicallyPrecedes(log2.values)
            }
        }.map{$0.originalString}
        return letterLogs  + digitLogs
        
    }
}