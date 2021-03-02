//
//  Home.swift
//  iOSDebugFundamentals
//


import SwiftUI

struct Home: View {
    var categories: [String: [FixerUpper]] {
        Dictionary(grouping: fixerUpperData, by: { $0.category.rawValue })
    }
    
    
    var featured: [FixerUpper] {
        fixerUpperData.filter {
            $0.isFeatured
        }
    }
    
    @State var showingProfile = false
    
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
        Button(action: {
            self.showingProfile.toggle()
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .foregroundColor(.secondary)
            .accessibility(label: Text("User Profile"))
            .padding()
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                PageView(featuredFixerUppers.map { FeatureCard(fixerUpper: $0) })
                    .aspectRatio(3/2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: FixerUpperList()) {
                    Text("Browse All Fixer Uppers")
                }
            }
            .navigationBarTitle("Featured Flippers")
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(self.userData)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        .environmentObject(UserData())
    }
}
