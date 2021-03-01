//
//  FixerUpperList.swift
//  iOSDebugFundamentals
//

import SwiftUI

struct FixerUpperList: View {
    @EnvironmentObject var userData: UserData
    
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            
            ForEach(userData.fixerUppers) { fixerUpper in
                if !self.userData.showFavoritesOnly || fixerUpper.isFavorite {
                    NavigationLink(destination: FixerUpperDetail(fixerUpper: fixerUpper)) {
                        FixerUpperRow(fixerUpper: fixerUpper)
                    }
                }
            }
            .navigationBarTitle("Fixer Uppers")
        }
    }
}

struct FixerUpperList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11", "iPhone SE"], id: \.self) { deviceName in
            NavigationView {
                FixerUpperList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                .environmentObject(UserData())
            }
        }
    }
}
