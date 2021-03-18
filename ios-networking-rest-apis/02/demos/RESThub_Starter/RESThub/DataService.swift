//
//  DataService.swift
//  RESThub
//
//  Created by Johnny Soto on 3/18/21.
//  Copyright © 2021 Harrison. All rights reserved.
//

import Foundation

class DataService {
    static let shared = DataService()
    
    // adding root endpoint
    fileprivate let baseURLString = "https://api.github.com"
    
    // ne wfunc for get request logic
    func fetchGists() {
        // create url obj
        let baseURL = URL(string: baseURLString)
        print(baseURL!)
    }
}
