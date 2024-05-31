//
//  SongRowCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 30/04/24.
//

import SwiftUI

struct SongRowCell: View {
    
    var image: String = Constant.imageUrl
    var title: String = "Title here"
    var subtitle: String = "Subtitle here"
    var onEllipsisPressed: (() -> ())? = nil
    
    var body: some View {
        HStack {
            ImageLoaderView(url: image)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.spotifyWhite)
                
                Text(subtitle)
                    .font(.callout)
                    .foregroundStyle(.spotifyLightGray)
            }
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Image(systemName: "ellipsis")
                .font(.subheadline)
                .foregroundStyle(.spotifyWhite)
                .padding(16)
                .onTapGesture {
                    onEllipsisPressed?()
                }
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()

        VStack {
            SongRowCell()
            SongRowCell()
            SongRowCell()
        }
    }
}
