//
//  SpotifyHomeView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @Environment(\.router) var router
    
    @State var currentUser: User? = nil
    @State var selectedCategory: Category? = nil
    @State var products: [Product] = []
    @State var rowProducts: [RowProduct] = []
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        recentsSection
                            .padding(.horizontal, 16)
                        
                        if let firstProduct = products.first {
                            newReleaseSection(firstProduct)
                                .padding(.horizontal, 16)
                        }
                        
                        brandSection
                        
                    } header: {
                        headerSection
                            .padding(.leading, 16)
                    }
                }
            }
            .clipped()
        }
        .task {
            await getData()
        }
    }
    
    func getData() async {
        guard products.isEmpty else { return }
        do {
            currentUser = try await DatabaseHelper().getUser().last
            products = try await DatabaseHelper().getProduct()
            products = Array(products.prefix(8))
            
            let brands = products.map { $0.brand }
            for brand in brands {
                rowProducts.append(RowProduct(title: brand, products: products))
            }
        } catch {
            
        }
    }
    
    
    private  var headerSection: some View {
        HStack(spacing: 0) {
            Rectangle()
                .overlay{
                    if let currentUser = currentUser {
                        ImageLoaderView(url: currentUser.image)
                            .clipShape(.circle)
                    }
                }
                .frame(width: 35, height: 35)
                .clipShape(Circle())
                .asButton {
                    router.dismissScreen()
                }
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCellView(title: category.rawValue, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 16)
                .background(.black)
            }
        }
        .padding(.vertical, 24)
        .background(.black)
    }
    
    
    private var recentsSection: some View {
        VStack {
            NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
                if let product = product {
                    SpotifyRecentCellIView(title: product.title, imageUrl: product.firstImage)
                        .asButton {
                            goToPlaylist(product: product)
                        }
                }
            }
        }
    }
    
    
    private func newReleaseSection(_ firstProduct: Product) -> some View {
        SpotifyNewReleaseCellView(
            imageName: firstProduct.firstImage,
            headline: firstProduct.brand,
            subheadline: firstProduct.category,
            title: firstProduct.title,
            subtitle: firstProduct.description
        )
        .asButton {
            goToPlaylist(product: firstProduct)
        }
    }
    
    private var brandSection: some View {
        VStack {
            ForEach(rowProducts) { brand in
                VStack(spacing: 8) {
                    Text(brand.title)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.spotifyWhite)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                    
                    ScrollView(.horizontal) {
                        HStack(alignment: .top, spacing: 16) {
                            ForEach(brand.products) { brandProduct in
                                ImageTitleRowCell(
                                    image: brandProduct.firstImage,
                                    title: brandProduct.title
                                ).asButton(.press) {
                                    goToPlaylist(product: brandProduct)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func goToPlaylist(product: Product) {
        router.showScreen(.push) { _ in
            SpotifyPlaylistView(product: product)
        }
    }
}

#Preview {
    SpotifyHomeView()
}
