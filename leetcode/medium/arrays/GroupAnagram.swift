/*
Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {

        guard strs.count > 0 else {
            return []
        }
        var anagramMap = [Set<Character>: [String]]()

        for string in strs {
            let key = Set(Array(string))
            if var strings = anagramMap[key] {
                strings.append(string)
                anagramMap[key] = strings
            } else {
                anagramMap[key] = [string]
            }
        }
        return anagramMap.map{$0.value}

    }
}
