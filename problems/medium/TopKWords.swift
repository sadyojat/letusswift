class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        guard words.count > 0 else {
            return []
        }
        
        // var map = [String: Int]()
        // for word in words {
        //     if let value = map[word] {
        //         map[word] = value + 1
        //     } else {
        //         map[word] = 1
        //     }
        // }
        
        let sorted = Array(words.reduce([String: Int]()){ (partial, word) -> [String: Int] in 
                            var partial = partial
                           if let value = partial[word] {
                                partial[word] = value + 1
                            } else {
                                partial[word] = 1
                            }
                          return partial
                         }).sorted{ (t1, t2) -> Bool in
                                      if t1.value == t2.value {
                                          return t1.key.lexicographicallyPrecedes(t2.key)
                                      } else {
                                          return t1.value > t2.value
                                      }
                                      }.map{$0.key}
        
        
        // let sorted = Array(map).sorted{ (t1, t2) -> Bool in
        //                               if t1.value == t2.value {
        //                                   return t1.key.lexicographicallyPrecedes(t2.key)
        //                               } else {
        //                                   return t1.value > t2.value
        //                               }
        //                               }.map{$0.key}
        if sorted.count >= k {
            return Array(sorted[0..<k])
        } else {
            return []
        }
        
    }
}