//
//  CalculatorTests.swift
//  CalculatorDemoTests
//
//  Created by Johnny Soto on 3/23/21.
//

import XCTest
@testable import CalculatorDemo

class CalculatorTests: XCTestCase {

    var calculator: Calculator!
    
    override func setUp() {
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
    }
    
    func testAdd() {
        let result = calculator.add(1, 2)
        XCTAssertEqual(result, 3, "Expected 3, but got \(result)")
        XCTAssertLessThan(result, 10)
    }
    
    func testSubtract() {
        let result = calculator.subtract(7, 3)
        XCTAssertEqual(result, 4, "testSubtract error")
    }

}
