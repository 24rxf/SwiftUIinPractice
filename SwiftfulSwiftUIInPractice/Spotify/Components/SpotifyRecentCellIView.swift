//
//  SpotifyRecentCellIView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI

struct SpotifyRecentCellIView: View {
    
    var title: String
    var imageUrl: String
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(url: imageUrl)
                .frame(width: 50, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColor(isSelected: false)
        .clipShape(.rect(cornerRadius: 6))
    }
}

#Preview {
    ZStack {
        Color.black
        
        HStack {
            VStack {
                SpotifyRecentCellIView(
                    title: "Testing cell Testing cell ", imageUrl: Constant.imageUrl)
                SpotifyRecentCellIView(
                    title: "Testing cell Testing cell ", imageUrl: Constant.imageUrl)
                SpotifyRecentCellIView(
                    title: "Testing cell Testing cell ", imageUrl: Constant.imageUrl)
            }
            VStack {
                SpotifyRecentCellIView(
                    title: "Testing cell Testing cell ", imageUrl: Constant.imageUrl)
                SpotifyRecentCellIView(
                    title: "Testing cell Testing cell ", imageUrl: Constant.imageUrl)
                SpotifyRecentCellIView(
                    title: "Testing cell Testing cell ", imageUrl: Constant.imageUrl)
            }
        }
    }
}
