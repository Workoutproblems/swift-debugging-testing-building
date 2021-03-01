//
//  UserData.swift
//  iOSDebugFundamentals
//

import Combine
//import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var fixerUppers = fixerUpperData
    @Published var profile = UserProfile.default
}
