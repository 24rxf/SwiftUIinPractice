//
//  SpotifyPlaylistView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/04/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyPlaylistView: View {
    
    
    @Environment(\.router) var router
    
    var product: Product = .mock
    @State var products: [Product] = []
    @State var showHeader = false
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    PlaylistHeaderCell(
                        title: product.title,
                        subtitle: product.description,
                        image: product.firstImage
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                    
                    PlaylistDescriptionCell()
                        .padding(.horizontal, 16)
                    
                    
                    ForEach(products) { product in
                        SongRowCell(
                            image: product.firstImage,
                            title: product.title,
                            subtitle: product.brand
                        )
                        .asButton {
                            router.showScreen(.push) { _ in
                                SpotifyPlaylistView(product: product)
                            }
                        }
                    }.padding(.leading, 16)
                }
                
            }
            .scrollIndicators(.hidden)
            
            navigationBarSection
        }
        .navigationBarBackButtonHidden(true)
        .task {
            do {
                self.products = try await DatabaseHelper().getProduct()
            } catch {
                
            }
        }
    }
    
    var navigationBarSection: some View {
        ZStack {
            Text("Header")
                .font(.headline)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? Color.spotifyBlack.opacity(0.001) : Color.spotifyLightGrey.opacity(0.7))
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .leading)
                .asButton {
                    router.dismissScreen()
                }
        }
        .foregroundStyle(.spotifyWhite)
        .padding(16)
        .background(showHeader ? Color.spotifyBlack : Color.clear)
        .frame(maxHeight: .infinity, alignment: .top)
        .animation(.smooth(duration: 0.15), value: showHeader)
    }
}

#Preview {
    SpotifyPlaylistView()
}
