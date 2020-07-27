import UIKit

var str = "Hello, Algorithms"

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
//MARK: Test Partition
//**********************************************************
func testPartition() {
    let list = generateRandomList(count: 5)
    printRunId("Test Partition")
    print(list)
    print()    
    print("Partitioned List is \(partition(list))")
   
}


//**********************************************************
//MARK: Test QuickSort
//**********************************************************
func testQuickSort() {
    let list = generateRandomList(count: 10)
    printRunId("Test QuickSort")
    print(list)
    print()
    print("Sorted List is \(quickSort(list))")
   
}


//**********************************************************
//MARK: Test Space Optimized Partition
//**********************************************************
func testSpaceOptimizedPartition() {
    var list = generateRandomList(count: 15)
    printRunId("Test Space Optimized Partition")
    print(list)
    print()
    spaceOptimizedPartition(&list,  0, list.count-1)
    print(list)
   
}


//**********************************************************
//MARK: Test Space Optimized QuickSort
//**********************************************************
func testSpaceOptimizedQuickSort() {
    var list = generateRandomList(count: 5)
    printRunId("Test Space Optimized QuickSort")
    print(list)
    print()
    spaceOptimizedQuickSort(&list,  0, list.count-1)
    print(list)
   
}


//**********************************************************
//MARK: Test Execution Scripts
//**********************************************************

//testMergeSort()
//testPartition()
//testQuickSort()
//testSpaceOptimizedPartition()
testSpaceOptimizedQuickSort()
