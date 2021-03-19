//
//  Gist.swift
//  RESThub
//
//  Created by Johnny Soto on 3/18/21.
//  Copyright © 2021 Harrison. All rights reserved.
//

import Foundation

// Codale: decoding logic
struct Gist: Encodable {
    var id: String?
    // doesn't match
    var isPublic: Bool
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, isPublic = "public"
    }
    

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        //description poss being mssing
        try container.encode(isPublic, forKey: .isPublic)
        // special case: doesnt req id property, alway need to decode, but not encode
        try container.encode(description, forKey: .description)
        // split up endoing and decoding logic
        try container.encodeIfPresent(id, forKey: .id)
    }
}

extension Gist: Decodable {
    // best of both worlds
    init(from decoder: Decoder) throws {
        //key decoding container type
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.isPublic = try container.decode(Bool.self, forKey: .isPublic)
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? "Description is nil"
    }
}
