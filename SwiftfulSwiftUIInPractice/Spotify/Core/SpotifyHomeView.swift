//
//  SpotifyHomeView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI
import SwiftfulUI

struct SpotifyHomeView: View {
    
    @State var currentUser: User? = nil
    @State var selectedCategory: Category? = nil
    @State var products: [Product] = []
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        recentsSection
                        
                        if let firstProduct = products.first {
                            newReleaseSection(firstProduct)
                        }
                        
                    } header: {
                        headerSection
                    }
                    
                }
            }
            .clipped()
        }
        .task {
            do {
                currentUser = try await DatabaseHelper().getUser().last
                products = try await DatabaseHelper().getProduct()
                products = Array(products.prefix(8))
            } catch {
                
            }
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
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCellView(title: category.rawValue, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .background(.black)
                .padding(.horizontal, 16)
                
            }
        }
        .padding(.vertical, 24)
        .background(.black)
        .padding(.leading, 8)
    }
    
    
    private var recentsSection: some View {
        VStack {
            NonLazyVGrid(columns: 2, alignment: .center, spacing: 10, items: products) { product in
                if let product = product {
                    SpotifyRecentCellIView(title: product.title, imageUrl: product.firstImage)
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
    }
}

#Preview {
    SpotifyHomeView()
}
