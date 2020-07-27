import Foundation

public func findMedian(_ x: [Double], _ y:[Double]) -> Double {
    var xArr = x, yArr = y
    
    let m = xArr.count, n = yArr.count
    
//    Formulation
//    px + py  = (m + n + 1)/ 2
//    py  = (m + n + 1)/ 2 - px
    var xStart = 0, xEnd  = m - 1
    var yStart = 0, yEnd  = n - 1
    var xLeftMax = 0.0, xRightMin = 0.0, yLeftMax = 0.0 , yRightMin = 0.0
    
    var pX = ((xStart + xEnd)/2)
    var pY = ((m + n + 1)/2 )
    
    while true {
        xLeftMax = (pX < 0) ? -.infinity : xArr[pX]
        xRightMin = ( pX+1 > m-1 ) ? .infinity: xArr[pX+1]
        yLeftMax = yArr[pY]
        yRightMin  = yArr[pY - 1]
        
        if (xLeftMax <= yRightMin && yLeftMax <= xRightMin) {
            // Success
            break
        } else if (xLeftMax <= yRightMin && yLeftMax > xRightMin) {
            // Move pX to  the right
            pX = pX + 1
            pY = ((m + n + 1)/2 ) - pX
        } else  {
            // Move pX to  the left
            pX = pX - 1
            pY = ((m + n + 1)/2 ) - pX
        }
    }
    var left  = (xLeftMax >= yLeftMax) ? xLeftMax : yLeftMax
    var right = (xRightMin <= yRightMin) ? xRightMin : yRightMin
    return (left + right)/2
}
