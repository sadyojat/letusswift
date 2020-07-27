//public func lengthOfLongestSubstring(_ str: String) -> Int {
//    var  str = str
//    var archive = [[Character: Character]]()
//    var headIndex  =  str.startIndex
//    var endIndex =  str.startIndex
//    
//    var hashMap = [Character: Character]()
//    while endIndex < str.endIndex  {
//        let c = str[endIndex]
//        if !hashMap[c] {
//            hashMap[c] = c
//            endIndex = str.index(after: endIndex)
//        } else {
//            archive.append(hashMap)
//            hashMap = [Character: Character]()
//            headIndex = str.index(after: headIndex)
//            endIndex  = headIndex
//        }
//    }
//    archive.append(set)
//    
//    print("set --> \(archive)")
//    var count = 0
//    for  element in archive {
//        count = element.count > count  ?  element.count : count
//    }
//    return count
//}
//
