//
//  ApiClientTests.swift
//  BudgetTrackeriOSTests
//
//  Created by Jonathan Wong on 7/20/19.
//  Copyright © 2019 fatty waffles. All rights reserved.
//

import XCTest
@testable import BudgetTrackeriOS

class ApiClientTests: XCTestCase {

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  func testFetchManagers() {
    let expect = expectation(description: "fetch managers")
    let apiClient = ApiClient(session: URLSession.shared, resourcePath: "managers")
    apiClient.fetchResources { (result: Result<[Manager], ApiError>) in
      expect.fulfill()
      switch result {
      case .success(let managers):
        XCTAssertNotNil(managers)
        XCTAssertEqual(managers.count, 4)
      case .failure:
        XCTFail()
      }
    }
    
    waitForExpectations(timeout: 2.0, handler: nil)
  }
  
  func testNetworkError() {
    let expect = expectation(description: "fetch managers fails")
    let apiClient = ApiClient(session: URLSession.shared, resourcePath: "managers")
    apiClient.fetchResources { (result: Result<[Manager], ApiError>) in
      expect.fulfill()
      switch result {
      case .success:
        XCTFail()
      case .failure(let error):
        XCTAssertNotNil(error)
      }
    }
    
    waitForExpectations(timeout: 2.0, handler: nil)
  }
}
