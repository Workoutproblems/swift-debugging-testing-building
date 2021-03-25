//
//  CalculatorAddTests.swift
//  CalculatorDemoTests
//
//  Created by Johnny Soto on 3/24/21.
//

import XCTest
@testable import CalculatorDemo

class CalculatorAddTests: XCTestCase {
    
    var calculator: Calculator!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calculator = nil
    }

    func testAdd() {
        let result = calculator.add(1, 2)
        XCTAssertEqual(result, 3, "Expected 3, but got \(result)")
        XCTAssertLessThan(result, 10)
    }

}
