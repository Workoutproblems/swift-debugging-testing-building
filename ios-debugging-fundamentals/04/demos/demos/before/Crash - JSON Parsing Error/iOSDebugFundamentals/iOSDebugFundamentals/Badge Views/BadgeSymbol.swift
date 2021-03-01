//
//  BadgeSymbol.swift
//  iOSDebugFundamentals
//


import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.5
                let spacing = width * 0.030
                let middle = width / 2.0
                let topWidth = 0.226 * width
                let topHeight = 0.488 * height
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle - topWidth, y: topHeight - spacing),
                    CGPoint(x: middle, y: topHeight / 2 - spacing),
                    CGPoint(x: middle + topWidth, y: topHeight - spacing)
                    
                ])
                
                path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
                path.addLines([
                    CGPoint(x: middle - topWidth + spacing * 2, y: topHeight),
                    CGPoint(x: middle - topWidth + spacing * 2, y: height),
                    CGPoint(x: middle + topWidth - spacing * 2, y: height),
                    CGPoint(x: middle + topWidth - spacing * 2, y: topHeight)
                ])
            }
            .fill(Self.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol()
    }
}
