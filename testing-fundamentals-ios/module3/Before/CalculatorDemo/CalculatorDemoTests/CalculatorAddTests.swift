//
//  CalculatorAddTests.swift
//  CalculatorDemoTests
//
//  Created by Jonathan Wong on 6/24/19.
//  Copyright © 2019 Fatty Waffles. All rights reserved.
//

import XCTest
@testable import CalculatorDemo

class CalculatorAddTests: XCTestCase {
  
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
}
