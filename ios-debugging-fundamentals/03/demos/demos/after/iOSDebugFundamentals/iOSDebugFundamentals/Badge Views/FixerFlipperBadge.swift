//
//  FixerFlipperBadge.swift
//  iOSDebugFundamentals
//


import SwiftUI

struct FixerFlipperBadge: View {
    var name: String
    
    var body: some View {
        VStack {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 2.0)
                .frame(width: 150, height: 150)
            
            Text(name)
                .font(.caption)
            .accessibility(label: Text("Badge for \(name)"))
        }
    }
}

struct FixerFlipperBadge_Previews: PreviewProvider {
    static var previews: some View {
        FixerFlipperBadge(name: "Preview Testing")
    }
}
