//
//  Token.swift
//  BudgetTrackeriOS
//
//  Created by Jonathan Wong on 4/15/19.
//  Copyright © 2019 fatty waffles. All rights reserved.
//

import Foundation

final class Token: Codable {
  
  var id: UUID?
  var token: String
  var managerID: Int
  
  init(token: String, managerID: Int) {
    self.token = token
    self.managerID = managerID
  }
}
