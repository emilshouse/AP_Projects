import Foundation

var width: Float = 1.5
var height: Float = 2.3

let bucket: Float = 1.5  //1 bucket of paint for 1.5sqm

var bucketsOfPaint: Float {
    get {
        return ceilf((width * height) / bucket) //ceilf rounds up the float.
    }
    set {
        let paintableArea = newValue * bucket
        print("You can paint \(paintableArea) sqm.")
    }
}

print(bucketsOfPaint)

bucketsOfPaint = 8
