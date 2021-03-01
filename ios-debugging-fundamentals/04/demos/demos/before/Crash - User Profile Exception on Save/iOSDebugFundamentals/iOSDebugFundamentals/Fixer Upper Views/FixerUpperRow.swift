//
//  FixerUpperRow.swift
//  iOSDebugFundamentals
//

import SwiftUI

struct FixerUpperRow: View {
    var fixerUpper: FixerUpper
    
    var body: some View {
        HStack {
            fixerUpper.image
                .resizable()
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(fixerUpper.name)
                Text(fixerUpper.askingPrice)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if shouldShowStar(fixerUpper) {
                Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                    .imageScale(.medium)
            } else {
                EmptyView()
            }
        }
    }
    
    func shouldShowStar(_ fixerUpper: FixerUpper) -> Bool {
        return fixerUpper.isFavorite
    }
}

struct FixerUpperRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FixerUpperRow(fixerUpper: fixerUpperData[0])
            FixerUpperRow(fixerUpper: fixerUpperData[1])
            FixerUpperRow(fixerUpper: fixerUpperData[2])
            FixerUpperRow(fixerUpper: fixerUpperData[3])
            FixerUpperRow(fixerUpper: fixerUpperData[4])
        }
        .previewLayout(.sizeThatFits)
    }
}
