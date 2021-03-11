//
//  FixerUpperDetail.swift
//  iOSDebugFundamentals
//

import SwiftUI

struct FixerUpperDetail: View {
    @EnvironmentObject var userData: UserData
    var fixerUpper: FixerUpper
    
    var fixerUpperIndex: Int {
        userData.fixerUppers.firstIndex(where: { $0.id == fixerUpper.id })!
    }
    
    var body: some View {
        VStack {
            ZStack {
                MapView(coordinate: fixerUpper.locationCoordinate)
                    .frame(height: 300)
                    .edgesIgnoringSafeArea(.top)
                CircleImage(image: fixerUpper.image)
            }
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(fixerUpper.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.fixerUppers[self.fixerUpperIndex].isFavorite.toggle()
                    }) {
                        if self.userData.fixerUppers[self.fixerUpperIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                HStack {
                    Text(fixerUpper.askingPrice)
                    Spacer()
                    Text("\(fixerUpper.city), \(fixerUpper.state)")
                }
            }
            .padding()
            
            Spacer()
        }
        .navigationBarTitle(Text(fixerUpper.name), displayMode: .inline)
    }
}

struct FixerUpperDetail_Previews: PreviewProvider {
    static var previews: some View {
        FixerUpperDetail(fixerUpper: fixerUpperData[2])
        .environmentObject(UserData())
    }
}
