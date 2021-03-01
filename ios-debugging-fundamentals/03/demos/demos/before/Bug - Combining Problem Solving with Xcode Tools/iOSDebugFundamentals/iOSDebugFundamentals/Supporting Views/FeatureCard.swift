//
//  FeatureCard.swift
//  iOSDebugFundamentals
//

import SwiftUI

struct FeatureCard: View {
    var fixerUpper: FixerUpper
    
    var body: some View {
        fixerUpper.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(TextOverlay(fixerUpper: fixerUpper))
    }
}

struct TextOverlay: View {
    var fixerUpper: FixerUpper
    
    var gradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(
                colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text(fixerUpper.name)
                    .font(.title)
                    .bold()
                Text(fixerUpper.askingPrice)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(fixerUpper: featuredFixerUppers[0])
    }
}
