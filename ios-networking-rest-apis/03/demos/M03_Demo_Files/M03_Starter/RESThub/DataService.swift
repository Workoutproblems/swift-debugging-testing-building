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
    
    // @escaping, executes after func returns
    func fetchGist(completion: @escaping (Result<Any, Error>) -> Void) {
        
        var componentURL = URLComponents()
        //scheme and host props
        componentURL.scheme = "https"
        componentURL.host = "api.github.com"
        componentURL.path = "/gists/public"
        
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
                completion(.failure(error!))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                completion(.success(json))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
        }.resume()
    }
}
