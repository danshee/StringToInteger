//
//  StringToIntegerFrameworkTests.swift
//  StringToIntegerFrameworkTests
//
//  Created by Daniel Pietsch on 6/4/23.
//

import XCTest
@testable import StringToIntegerFramework

final class StringToIntegerFrameworkTests: XCTestCase {
    // System under test.
    private var string: String!
    private var expected: Int?
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
}

//MARK: Test my implementation StringToIntegerFramework.myConvert().
extension StringToIntegerFrameworkTests {
    func testMyConvertGivenStringIs0ThenItConvertsTo0() {
        verifyThatStringIs0ThenItConvertsTo0(using: StringToIntegerFramework.myConvert)
    }
    
    func testMyConvertGivenStringIsNegative0ThenItConvertsTo0() {
        verifyThatStringIsNegative0ThenItConvertsTo0(using: StringToIntegerFramework.myConvert)
    }
    
    func testMyConvertGivenStringIsPositive0ThenItConvertsTo0() {
        verifyThatStringIsPositive0ThenItConvertsTo0(using: StringToIntegerFramework.myConvert)
    }
    
    func testMyConvertGivenStringIs1234ThenItConvertsTo1234() {
        verifyThatStringIs1234ThenItConvertsTo1234(using: StringToIntegerFramework.myConvert)
    }
    
    func testMyConvertGivenStringIsNegative1234ThenItConvertsTo1234() {
        verifyThatStringIsNegative1234ThenItConvertsTo1234(using: StringToIntegerFramework.myConvert)
    }
    
    func testMyConvertGivenStringIsPositive1234ThenItConvertsTo1234() {
        verifyThatStringIsPositive1234ThenItConvertsTo1234(using: StringToIntegerFramework.myConvert)
    }

    func testMyConvertGivenStringIsEmptyThenItFailsByReturningNil() {
        verifyThatStringIsEmptyThenItFailsByReturningNil(using: StringToIntegerFramework.myConvert)
    }

    func testMyConvertGivenStringIsALoneMinusThenItFailsByReturningNil() {
        verifyThatStringIsALoneMinusThenItFailsByReturningNil(using: StringToIntegerFramework.myConvert)
    }

    func testMyConvertGivenStringIsALonePlusThenItFailsByReturningNil() {
        verifyThatStringIsALonePlusThenItFailsByReturningNil(using: StringToIntegerFramework.myConvert)
    }
    
    func testMyConvertGivenStringContainsInvalidCharacterThenItFailsByReturningNil() {
        verifyThatStringContainsInvalidCharacterThenItFailsByReturningNil(using: StringToIntegerFramework.myConvert)
    }
}

//MARK: Test tutorial's implementation StringToIntegerFramework.convert().
//NOTE: Many of these tests fail.
extension StringToIntegerFrameworkTests {
    func testTutorialConvertGivenStringIs0ThenItConvertsTo0() {
        verifyThatStringIs0ThenItConvertsTo0(using: StringToIntegerFramework.tutorialConvert)
    }
    
    func testTutorialConvertGivenStringIsNegative0ThenItConvertsTo0() {
        //NOTE: This test fails because `tutorialConvert` doesn't handle negative signed integer strings.
        verifyThatStringIsNegative0ThenItConvertsTo0(using: StringToIntegerFramework.tutorialConvert)
    }
    
    func testTutorialConvertGivenStringIsPositive0ThenItConvertsTo0() {
        //NOTE: This test fails because `tutorialConvert` doesn't handle positive signed integer strings.
        verifyThatStringIsPositive0ThenItConvertsTo0(using: StringToIntegerFramework.tutorialConvert)
    }
    
    func testTutorialConvertGivenStringIs1234ThenItConvertsTo1234() {
        verifyThatStringIs1234ThenItConvertsTo1234(using: StringToIntegerFramework.tutorialConvert)
    }
    
    func testTutorialConvertGivenStringIsNegative1234ThenItConvertsTo1234() {
        //NOTE: This test fails because `tutorialConvert` doesn't handle negative signed integer strings.
        verifyThatStringIsNegative1234ThenItConvertsTo1234(using: StringToIntegerFramework.tutorialConvert)
    }
    
    func testTutorialConvertGivenStringIsPositive1234ThenItConvertsTo1234() {
        //NOTE: This test fails because `tutorialConvert` doesn't handle positive signed integer strings.
        verifyThatStringIsPositive1234ThenItConvertsTo1234(using: StringToIntegerFramework.tutorialConvert)
    }

    func testTutorialConvertGivenStringIsEmptyThenItFailsByReturningNil() {
        //NOTE: This test fails because `tutorialConvert` doesn't handle empty strings.
        verifyThatStringIsEmptyThenItFailsByReturningNil(using: StringToIntegerFramework.tutorialConvert)
    }

    func testTutorialConvertGivenStringIsALoneMinusThenItFailsByReturningNil() {
        verifyThatStringIsALoneMinusThenItFailsByReturningNil(using: StringToIntegerFramework.tutorialConvert)
    }

    func testTutorialConvertGivenStringIsALonePlusThenItFailsByReturningNil() {
        verifyThatStringIsALonePlusThenItFailsByReturningNil(using: StringToIntegerFramework.tutorialConvert)
    }
    
    func testTutorialConvertGivenStringContainsInvalidCharacterThenItFailsByReturningNil() {
        verifyThatStringContainsInvalidCharacterThenItFailsByReturningNil(using: StringToIntegerFramework.tutorialConvert)
    }
}

//MARK: Givens.
extension StringToIntegerFrameworkTests {
    private func givenString(is string: String) {
        self.string = string
    }
}

//MARK: Whens.
extension StringToIntegerFrameworkTests {
    private func whenStringConversionIsAttempted(using sut: (String) -> Int?) {
        self.expected = sut(self.string)
    }
}

//MARK: Thens.
extension StringToIntegerFrameworkTests {
    private func thenInteger(is actual: Int) {
        XCTAssertEqual(self.expected, actual)
    }
    
    private func thenConversionFailsByReturningNil() {
        XCTAssertNil(self.expected)
    }
}

//MARK: Verify functions generatize individual tests.
extension StringToIntegerFrameworkTests {
    func verifyThatStringIs0ThenItConvertsTo0(using sut: (String) -> Int?) {
        givenString(is: "0")
        whenStringConversionIsAttempted(using: sut)
        thenInteger(is: 0)
    }
    
    func verifyThatStringIsNegative0ThenItConvertsTo0(using sut: (String) -> Int?) {
        givenString(is: "-0")
        whenStringConversionIsAttempted(using: sut)
        thenInteger(is: 0)
    }
    
    func verifyThatStringIsPositive0ThenItConvertsTo0(using sut: (String) -> Int?) {
        givenString(is: "+0")
        whenStringConversionIsAttempted(using: sut)
        thenInteger(is: 0)
    }
    
    func verifyThatStringIs1234ThenItConvertsTo1234(using sut: (String) -> Int?) {
        givenString(is: "1234")
        whenStringConversionIsAttempted(using: sut)
        thenInteger(is: 1234)
    }
    
    func verifyThatStringIsNegative1234ThenItConvertsTo1234(using sut: (String) -> Int?) {
        givenString(is: "-1234")
        whenStringConversionIsAttempted(using: sut)
        thenInteger(is: -1234)
    }
    
    func verifyThatStringIsPositive1234ThenItConvertsTo1234(using sut: (String) -> Int?) {
        givenString(is: "+1234")
        whenStringConversionIsAttempted(using: sut)
        thenInteger(is: 1234)
    }

    func verifyThatStringIsEmptyThenItFailsByReturningNil(using sut: (String) -> Int?) {
        givenString(is: "")
        whenStringConversionIsAttempted(using: sut)
        thenConversionFailsByReturningNil()
    }

    func verifyThatStringIsALoneMinusThenItFailsByReturningNil(using sut: (String) -> Int?) {
        givenString(is: "-")
        whenStringConversionIsAttempted(using: sut)
        thenConversionFailsByReturningNil()
    }

    func verifyThatStringIsALonePlusThenItFailsByReturningNil(using sut: (String) -> Int?) {
        givenString(is: "+")
        whenStringConversionIsAttempted(using: sut)
        thenConversionFailsByReturningNil()
    }
    
    func verifyThatStringContainsInvalidCharacterThenItFailsByReturningNil(using sut: (String) -> Int?) {
        givenString(is: "12x34")
        whenStringConversionIsAttempted(using: sut)
        thenConversionFailsByReturningNil()
    }
}