//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, Associated Objects"

extension UIViewController {
    private struct AssociatedKeys {
        static var DescriptiveName =  "nsh_descriptivename"
    }
    
    var descriptiveName: String? {
        get {
            return  objc_getAssociatedObject(self, &AssociatedKeys.DescriptiveName) as? String
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.DescriptiveName,
                    newValue,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
            
        }
    }
}

var vc = UIViewController()
vc.descriptiveName = "Shalom"
print("\(vc.descriptiveName!)")
//: [Next](@next)
