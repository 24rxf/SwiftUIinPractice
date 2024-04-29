//
//  SpotifyPlaylistView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/04/24.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var product: Product = .mock
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        title: product.title,
                        subtitle: product.description,
                        image: product.firstImage
                    )
                    
                    PlaylistDescriptionCell()
                        .padding(.horizontal, 16)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    SpotifyPlaylistView()
}
