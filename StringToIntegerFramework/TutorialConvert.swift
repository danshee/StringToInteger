//
//  Convert.swift
//  StringToInteger
//
//  Created by Daniel Pietsch on 6/4/23.
//

import Foundation

/// I DID NOT WRITE THIS!!!
///
/// This implementation is copied by hand from the video entitled "Loops and Hash Maps
/// Job Preparation Interview Question" at https://youtu.be/2QRZqMM7ef0.
/// - Parameter string: text to parse into integer
/// - Returns: integer parsed from text or nil upone failure
public func tutorialConvert(string: String) -> Int? {
    var total = 0
    
    let valueMap = [
        "0" as Character : 0,
        "1" : 1,
        "2" : 2,
        "3" : 3,
        "4" : 4,
        "5" : 5,
        "6" : 6,
        "7" : 7,
        "8" : 8,
        "9" : 9
    ]
    
    for (i, c) in string.enumerated() {
        let exponent = string.count - i - 1
        if let value = valueMap[c] {
            let num = Decimal(value) * pow(10, exponent)
            total += NSDecimalNumber(decimal: num).intValue
        } else {
            return nil
        }
    }
    
    return total
}
