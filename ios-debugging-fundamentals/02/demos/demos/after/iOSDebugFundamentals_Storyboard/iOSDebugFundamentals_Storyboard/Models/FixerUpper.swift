//
//  FixerUpper.swift
//  iOSDebugFundamentals
//

import CoreLocation
import UIKit

struct FixerUpper: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var city: String
    var state: String
    var askingPrice: String
    var category: Category
    var isFeatured: Bool
    var isFavorite: Bool

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case neighborhood = "Neighborhood"
        case rural = "Rural"
        case waterfront = "Waterfront"
    }
}

extension FixerUpper {
    var image: UIImage {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
