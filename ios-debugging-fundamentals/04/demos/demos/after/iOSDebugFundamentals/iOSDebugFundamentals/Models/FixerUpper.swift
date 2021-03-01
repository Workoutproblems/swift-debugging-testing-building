//
//  FixerUpper.swift
//  iOSDebugFundamentals
//

import SwiftUI
import CoreLocation

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

    var featureImage: Image? {
        guard isFeatured else { return nil}
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(verbatim: name))
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case neighborhood = "Neighborhood"
        case rural = "Rural"
        case waterfront = "Waterfront"
    }
}

extension FixerUpper {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
