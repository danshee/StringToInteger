//
//  MyConvert.swift
//  StringToInteger
//
//  Created by Daniel Pietsch on 6/4/23.
//

import Foundation

/// My version of a function to parse text into an integer.
///
/// Text must be the in form: [+|-]?[0-9]+
///
/// I.e. Optional sign prefix followed by a whole number.
///
/// Positve value:
///     1234 = 1*10^3 + 2*10^2 + 3*10^1 + 4*10^0
///          = (((1*10 + 2) * 10 + 3) * 10) + 4
///     Operation = '+'
///
/// Negatve value:
///     -1234 = -1*10^3 - 2*10^2 - 3*10^1 - 4*10^0
///           = -(((1*10 - 2) * 10 - 3) * 10) - 4
///     Operation = '-'
///
/// Algorithm:
/// 1. Extract number (aka "mantissa") portion of string input as a substring.
/// 2. Determine operation to be used (i.e. '+' or '-') to accumulate result based upon sign prefix (defaults to '+').
/// 3. For each character in the mantissa:
///     a. Multiply the current result by 10.
///     b. Convert character to whole number and apply operator to current result.
///
/// - Parameter string: text to parse into integer
/// - Returns: integer parsed from text or nil upon failure
public func myConvert(string: String) -> Int? {
    // 1. Extract number (aka "mantissa") portion of string input as a substring.
    let mantissa: Substring = {
        switch string.first {
        case "-", "+":
            return string.dropFirst()
        default:
            return Substring(string)
        }
    }()
    
    // Fail if mantissa is empty.
    guard !mantissa.isEmpty else {
        return nil
    }
    
    // 2. Determine operation to be used (i.e. '+' or '-') to accumulate result based upon sign prefix (defaults to '+').
    let op: ((Int, Int) -> Int) = {
        switch string.first {
        case "-":
            return { $0 - $1 }
        default:
            return { $0 + $1 }
        }
    }()
    
    func characterToInt(character: Character) -> Int? {
        guard let ascii = character.asciiValue else {
            return nil
        }

        guard let zero = Character("0").asciiValue, let nine = Character("9").asciiValue else {
            return nil
        }
        
        guard (zero <= ascii) && (ascii <= nine) else {
            return nil
        }
        
        return Int(ascii - zero)
    }
    
    // 3. For each character in the mantissa:
    return mantissa.reduce(0) { accumulator, character in
        // Fail if character cannot be converted to whole number.
        guard let accumulator = accumulator, let valueFromCharacter = characterToInt(character: character) else {
            return nil
        }
        
        // 3a. Multiply the current result by 10.
        // 3b. Convert character to whole number and apply operator to current result.
        return op(10 * accumulator, valueFromCharacter)
    }
}
