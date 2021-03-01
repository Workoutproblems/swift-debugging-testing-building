//
//  ProfileEditor.swift
//  iOSDebugFundamentals
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: UserProfile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                
                Divider()
                
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.locationServicesEnabled) {
                Text("Enable Location Services")
            }
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Flipper Symbol").bold()
                
                Picker("Flipper Symbol", selection: $profile.flipperFlareSymbol) {
                    ForEach(UserProfile.FlareSymbol.allCases, id: \.self) { season in
                        Text(season.rawValue).tag(season)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
