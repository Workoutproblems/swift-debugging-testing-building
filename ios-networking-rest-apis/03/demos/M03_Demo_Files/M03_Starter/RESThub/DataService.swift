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
    fileprivate let baseURLString = "https://api.github.com"
    
    func fetchGist() {
        // var baseURL = URL(string: baseURLString)
        // baseURL?.appendPathComponent("/somePath")
        // let compusedURL = URL(string: "some/Path", relativeTo: baseURL)
        
        var componentURL = URLComponents()
        
        //scheme and host props
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        
        //print(baseURL!)
        //print(compusedURL?.absoluteString ?? "Relative URL failed.")
        // print(componentURL.url!)
        
        guard let validURL = componentURL.url else {
            print("URL creation failed...")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            //print response code
            if let httpResponse = response as? HTTPURLResponse {
                print("API status: \(httpResponse.statusCode)")
            }
            // showing data being returned, no errors
            guard let validData = data, error == nil else {
                //forced unwrap the error with !
                print("API error: \(error!.localizedDescription)")
                return
            }
        }.resume()
    }
}
