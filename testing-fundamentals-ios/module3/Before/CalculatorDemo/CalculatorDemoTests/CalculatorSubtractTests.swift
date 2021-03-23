//
//  CalculatorSubtractTests.swift
//  CalculatorDemoTests
//
//  Created by Jonathan Wong on 6/24/19.
//  Copyright © 2019 Fatty Waffles. All rights reserved.
//

import XCTest
@testable import CalculatorDemo

class CalculatorSubtractTests: XCTestCase {

  var calculator: Calculator!
  
  override func setUp() {
    calculator = Calculator()
  }
  
  override func tearDown() {
    calculator = nil
  }

  func testSubtract() {
    let result = calculator.subtract(10, 7)
    XCTAssertEqual(result, 3, "Expected 3, but got \(result)")
  }

}
