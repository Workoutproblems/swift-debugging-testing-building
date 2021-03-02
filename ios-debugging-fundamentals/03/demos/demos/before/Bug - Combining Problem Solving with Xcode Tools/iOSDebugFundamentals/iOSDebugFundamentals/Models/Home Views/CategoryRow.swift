//
//  CategoryRow.swift
//  iOSDebugFundamentals
//


import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [FixerUpper]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { fixerUpper in
                        NavigationLink(destination: FixerUpperDetail(fixerUpper: fixerUpper)) {
                            CategoryItem(fixerUpper: fixerUpper)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var fixerUpper: FixerUpper
    
    var body: some View {
        VStack(alignment: .leading) {
            fixerUpper.image
                .renderingMode(.original)
            .resizable()
            .frame(width: 155, height: 155)
            .cornerRadius(5)
            
            Text(fixerUpper.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: fixerUpperData[0].category.rawValue, items: Array(fixerUpperData.prefix(4)))
    }
}
