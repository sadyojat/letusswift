//: [Previous](@previous)

import UIKit

var str = "Hello, OBJC Runtime"


/// MARK: Print the classname as a string
// Return type is an unsafe pointer (C feature), hence the use of String(cString:)
String(cString: class_getName(UIViewController.self))

// Print reference type name
String(describing: UIViewController.self)

enum SampleEnum {
    case first, second
}
// Print value type name
String(describing: SampleEnum.self)


/// MARK : Get a SUPERCLASS of a class
// Since the return value is of type  AnyClass? use the describing option
String(describing: class_getSuperclass(UIViewController.self))


/// MARK: Check if a class is a metaclass
class_isMetaClass(UIViewController.self)


/// MARK Runtime functions for capturing instance and class functions of a class

class SampleObjCRuntime: NSObject {
        
    @objc func instanceFunc() {}
    @objc class func classFunc(_ value: Int) -> Int  {return 0 }
}


// Instance methods need to show the class name while creating a selector
let instanceSelector = #selector(SampleObjCRuntime.instanceFunc as (SampleObjCRuntime) -> () -> ())
String(describing: class_getInstanceMethod(SampleObjCRuntime.self, instanceSelector))

// Class methods do not need a class name in the selector
let classFuncSelector = #selector(SampleObjCRuntime.classFunc(_:) as (Int)  -> Int)
method_getName(class_getClassMethod(SampleObjCRuntime.self, classFuncSelector)!)
method_getImplementation(class_getClassMethod(SampleObjCRuntime.self, classFuncSelector)!)
String(cString:method_getTypeEncoding(class_getClassMethod(SampleObjCRuntime.self, classFuncSelector)!)!)




//: [Next](@next)
