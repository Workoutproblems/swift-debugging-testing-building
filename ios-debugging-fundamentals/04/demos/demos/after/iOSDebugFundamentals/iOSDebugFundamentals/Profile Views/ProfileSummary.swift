//
//  ProfileSummary.swift
//  iOSDebugFundamentals
//

import SwiftUI

struct ProfileSummary: View {    
    var profile: UserProfile
    
    static let goalFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
            .bold()
                .font(.title)
            
            Text("Location Services: \(self.profile.locationServicesEnabled ? "On" : "Off")")
            
            Text("Flipper Flare: \(self.profile.flipperFlareSymbol.rawValue)")
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        FixerFlipperBadge(name: "Fixer Upper")
                        
                        FixerFlipperBadge(name: "Flipper")
                            .hueRotation(.init(degrees: 270))
                        
                        FixerFlipperBadge(name: "Makeover Master")
                            .hueRotation(.init(degrees: 135))
                    }
                }
            
            }
            .frame(height: 200)
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: UserProfile.default)
    }
}
