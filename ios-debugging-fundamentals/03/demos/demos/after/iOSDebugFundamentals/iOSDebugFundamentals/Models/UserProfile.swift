//
//  UserProfile.swift
//  iOSDebugFundamentals
//

import Foundation

struct UserProfile {
    var username: String
    var locationServicesEnabled: Bool
    var flipperFlareSymbol: FlareSymbol
    
    static let `default` = Self(username: "andrewcbancroft", locationServicesEnabled: true, seasonalPhoto: .derelictHouse)
    
    init(username: String, locationServicesEnabled: Bool = true, seasonalPhoto: FlareSymbol = .derelictHouse) {
        self.username = username
        self.locationServicesEnabled = locationServicesEnabled
        self.flipperFlareSymbol = seasonalPhoto
    }
    
    enum FlareSymbol: String, CaseIterable {
        case derelictHouse = "🏚"
        case clamp = "🗜"
        case toolbox = "🧰"
        case hammerWrench = "🛠"
    }
}
