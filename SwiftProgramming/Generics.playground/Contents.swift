import Foundation


// MARK: PROTOCOL DECLARATION
protocol Container {
    associatedtype Item: Equatable
    var items: [Item] {get set}
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(_ i: Int) -> Item {get}
    static func isEqual <C1: Container, C2:Container> (_ lhs: C1, _ rhs: C2) -> Bool where C1.Item == C2.Item
}


protocol PrefixSuffixContainer: Container {
    associatedtype Prefix: PrefixSuffixContainer where Prefix.Item == Item
    associatedtype Suffix: PrefixSuffixContainer where Suffix.Item == Item
    
    func prefix(_ size: Int) -> Prefix
    func suffix(_ size: Int) -> Suffix
}


// MARK: Stack DECLARATION
public struct Stack<T: Equatable>: Container {
    static func isEqual<C1, C2>(_ lhs: C1, _ rhs: C2) -> Bool where C1 : Container, C2 : Container, C1.Item == C2.Item {
        guard lhs.count == rhs.count else {
            return false
        }
        
        for i in 0..<lhs.count where lhs[i] != rhs[i] {
            return false
        }
        
        return true
    }
    
    var count: Int {
        return items.count
    }
    
    mutating func append(_ item: T) {
        items.append(item)
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
    
    var items = [T]()
    
    typealias Item = T
    
    mutating func push(_ item: Item) {
        append(item)
    }
    
    mutating func pop() -> Item? {
        return items.last == nil ? nil : items.removeLast()
    }
}

extension Stack: PrefixSuffixContainer {
    func prefix(_ size: Int) -> Stack {
        var result = Stack()
        for index in 0..<(count - size) {
            result.append(self[index])
        }
        return result
    }
    
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count - size)..<count {
            result.append(self[index])
        }
        return result
    }
}




var s1 = Stack<Int>()
s1.push(10)
s1.push(20)
s1.push(30)

var s2 = Stack<String>()
s2.push("10")
s2.push("20")
s2.push("30")

//s1 == s2 --> This throws a compile error

var s3 = Stack<Int>()
s3.push(10)
s3.push(20)
s3.push(30)


Stack.isEqual(s1, s2)
