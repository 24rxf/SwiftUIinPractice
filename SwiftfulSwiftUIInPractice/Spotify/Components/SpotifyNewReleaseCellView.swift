//
//  SpotifyNewReleaseCellView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 24/04/24.
//

import SwiftUI

struct SpotifyNewReleaseCellView: View {
    
    let imageName: String
    let headline: String
    let subheadline: String
    let title: String
    let subtitle: String
    var onAddToPlaylistPressed: (() -> ())? = nil
    var onAddToPlayPressed: (() -> ())? = nil
    
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                ImageLoaderView(url: Constant.imageUrl)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(headline)
                        .foregroundStyle(.spotifyLightGrey)
                        .font(.callout)
                    
                    Text(subtitle)
                        .lineLimit(2)
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(.spotifyWhite)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            HStack(alignment: .top, spacing: 0) {
                ImageLoaderView(url: Constant.imageUrl)
                    .frame(width: 140, height: 140)
                
                
                VStack(alignment: .leading) {
                    Text(title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.spotifyWhite)
                    Text(subtitle)
                        .foregroundStyle(.spotifyLightGrey)
                    Spacer()
                    
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title3)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            
                        Spacer()
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                            .onTapGesture {
                                onAddToPlayPressed?()
                            }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: 140)
            .themeColor(isSelected: false)
            .clipShape(.rect(cornerRadius: 8))
        }
    }
}
//
//#Preview {
//    ZStack {
//        Color.black
//        
//        SpotifyNewReleaseCellView()
//    }
//}
