//: [Previous](@previous)

import Foundation

var str = "Algorithms"


//MARK: ==================== Random Number Generation ==================

func generateRandomList(count: Int) -> [Int] {
    var list = [Int]()
    for _ in 0..<count {
        list.append(Int(arc4random_uniform(UInt32(100))))
    }
    return list
}

func printRunId(_ string: String) {
    print("\n===================================\n")
    print("\(string)")
    print("\n===================================\n")
}


//**********************************************************
//MARK: Test Merge Sort
//**********************************************************
func testMergeSort() {
    let list = generateRandomList(count: 10)
    printRunId("Test MergeSort")
    print(list)
    print()
    let sorted = mergeSort(list);
    print("Sorted List is \(sorted)")
   
}

//**********************************************************
//MARK: Test Counting Inversions in list
//**********************************************************
func testInversions() {
    var list = [Int]()
    for _ in 0..<10 {
        list.append(Int(arc4random_uniform(UInt32(100))))
    }
    printRunId("Test Count Inversions")
    print("List is \(list)")
    print()
    let (count, sorted) = countInversions(list)
    print("Sorted list is \(sorted)")
    print("count  of  inversions \(count)")
}


//**********************************************************
//MARK: Test Linked List Creation
//**********************************************************
func testLinkedLists() {
    printRunId("Test LinkedList")
    let list = generateRandomList(count: 10)
    print("List is \(list)")
    print()
    let linkedList = LinkedList()
    for element in list {
        linkedList.push(value: element)
    }
    linkedList.printList()
    linkedList.pop()
    linkedList.printList()
}

//**********************************************************
//MARK: 3 Sum  problem
//**********************************************************

//func test3Sum() {
//    let list = [-1, 0, 1, 2, -1, -4]
//    printRunId("Test 3Sum")
//    print("List is \(list)")
//    print()
//    print("3  Sum  output --> \(three_sum(list))")
//
//}

//**********************************************************
//MARK: longest substring problem
//**********************************************************

func testLongestSubstring() {
    let string = "dvdf"
    printRunId("Test LONGEST SUBSTRING")
    print("string is \(string)")
    print()
//    print("OUTPUT --> \(lengthOfLongestSubstring(string))")
    
}

//**********************************************************
//MARK: median  of sorted arrays -- HARD
//**********************************************************

func testMedianOfSortedArrays() {
    let x: [Double] = [1, 9,  32, 45,  67]
    let y: [Double] = [2, 3,  47, 99, 100, 101]
    printRunId("Test Median of 2 Sorted Arrays")
    print("Array1 -->  \(x)")
    print("Array2 -->  \(y)")
    print()
    print("Median --> \(findMedian(x, y))")
    
}

//**********************************************************
/// MARK: Split Linked List
/// MEDIUM
//**********************************************************

func testSplitlinkedList() {
    printRunId("Test Split  Linked List")
    var randomList = generateRandomList(count: 10)
    print("Array1 -->  \(randomList)")
    var root: ListNode? = nil
    var tracker : ListNode? = nil
    
    for value in randomList {
        var node  = ListNode(value)
        if  (root == nil) {
            root = node
            tracker = node
        } else {
            tracker?.next = node
            tracker = node
        }
    }
    
    var printNode = root
    while printNode != nil {
        print("\(printNode!.val)")
        printNode = printNode?.next
    }
    
    print("Splits  are -> \(splitListToParts(root, 11))")
    
}


//**********************************************************
/// MARK: BaseBallGame
/// EASY -- STACK implementation
//**********************************************************

func testBaseBallGame() {
    printRunId("Test BaseBall Game")
    print("Sum is  are -> \(calPoints(["5","2","C","D","+"]))")
    
}

//**********************************************************
/// MARK: ZigZag
/// MEDIUM -- Pointers
//**********************************************************

func testZigZag() {
    printRunId("Test ZigZag")
    let str = "PAYPALISHIRING"
    print("Output --> \(convertZigZag(str, 5))")
    
}




//**********************************************************
// MARK: Test Calls
//**********************************************************
//testMergeSort()
//testInversions()
//testLinkedLists()
//test3Sum()
//testLongestSubstring()
//testMedianOfSortedArrays()
//testSplitlinkedList()
//testBaseBallGame()
//testZigZag()

//var a: Int  = Int((Double(14)/Double(8)).rounded(.up))

twoSum([2,3,4,5,7], target: 9)


//: [Next](@next)
