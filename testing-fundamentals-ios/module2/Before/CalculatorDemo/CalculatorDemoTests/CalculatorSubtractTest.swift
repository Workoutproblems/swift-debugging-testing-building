//
//  CalculatorSubtractTest.swift
//  CalculatorDemoTests
//
//  Created by Johnny Soto on 3/24/21.
//

import XCTest
@testable import CalculatorDemo

class CalculatorSubtractTest: XCTestCase {

    var calculator: Calculator!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        calculator = nil
    }

    func testSubtract() {
        let result = calculator.subtract(7, 3)
        XCTAssertEqual(result, 4, "testSubtract error")
    }

}
