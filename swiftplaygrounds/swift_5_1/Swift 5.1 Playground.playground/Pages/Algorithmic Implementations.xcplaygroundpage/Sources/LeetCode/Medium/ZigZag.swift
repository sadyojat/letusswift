import Foundation

public func convertZigZag(_ s: String, _ numRows: Int) -> String {
    
//    output[n] array
//    output[0] = PAHN
//    output[1] = APLSIIG
//    output[2] = YIR
////    PAYPALISHIRING || n = 3
////
////    PAY | P  | ALI | S | HIR | I | NG
////
////    PAHN APLS II G YIR
//
//
//    //    PAYPALISHIRING || n = 4
//
//    PAYP | AL | ISHI | RI | NG
//
//    PIN
//    ALSIG
//    YAHR
//    PI
    
//    PAYPA || LIS || HIRIN || G
    
    let verticalScan = numRows          // represents the number  of  elements in the verical column
    let slopeScan = (verticalScan > 2) ? verticalScan - 2 : 0  // Indicates the number of elements in the slope
    let stringCount = s.count
    let numberOfSegments = Int((Double(stringCount)  / Double(verticalScan + slopeScan)).rounded(.up)) // Calculates  the number  of vertical Scans required
    print("verticalScan --> \(verticalScan) || slopeScan --> \(slopeScan) || stringCount \(stringCount) || number --> \(stringCount  / (verticalScan + slopeScan)) || \(numberOfSegments)")
    
    var  i = 0
    var result = ""
    while  i < verticalScan {
        if  (i == 0 || i == verticalScan - 1) {
            var count = 0
            while count  < stringCount {
                result = result +
            }
        } else {
            // i == 1 --> AS I
        }
    }
    return s
                       
}
