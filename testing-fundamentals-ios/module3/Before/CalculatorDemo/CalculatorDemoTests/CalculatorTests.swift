//
//  CalculatorTests.swift
//  CalculatorDemoTests
//
//  Created by Jonathan Wong on 6/22/19.
//  Copyright © 2019 Fatty Waffles. All rights reserved.
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
}
