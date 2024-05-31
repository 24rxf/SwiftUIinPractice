//
//  NetflixHomeView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/05/24.
//

import SwiftUI

struct NetflixHomeView: View {
    
    @State var headerSize: CGSize = .zero
    @State var products: [Product] = []
    @State var rowProducts: [RowProduct] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 8) {
                    
                    Spacer(minLength: headerSize.height)
                    
                    if let product = products.first {
                        
                        NetflixHeroCellView(
                            image: product.firstImage,
                            categories: [product.category, product.brand ?? "" ]
                        )
                        .padding(24)
                        
                    }
                    
                    LazyVStack(spacing: 16){
                        ForEach(Array(rowProducts.enumerated()), id: \.offset) { (indexRow, row) in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(row.title)
                                    .font(.headline)
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(Array(row.products.enumerated()), id: \.offset) { (indexProduct, product) in
                                            NetflixMovieCellView(
                                                image: product.firstImage,
                                                title: product.title,
                                                isRecentlyAdded: product.recentlyAdded,
                                                topTenRanking: indexRow == 1 ? indexProduct + 1 : nil
                                            )
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                }
                                
                                .scrollIndicators(.hidden)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            
            VStack {
                header
                    .padding(.horizontal, 16)
                NetflixFilterBarView()
            }
            .background(Color.netflixBlack)
            .readingFrame { frame in
                headerSize = frame.size
            }
            
            
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
    }
    
    var header: some View {
        HStack {
            Text("For you")
                .font(.title)
            
            Spacer()
            HStack {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture {
                        
                    }
            }
        }
        
        .font(.title2)
    }
    
    func getData() async {
        
        do {
            //            currentUser = try await DatabaseHelper().getUser().last
            products = try await DatabaseHelper().getProduct()
            print(products.count)
            
            let brands = products.map { $0.brand ?? "" }
            for brand in brands {
                rowProducts.append(RowProduct(title: brand, products: products))
            }
        } catch {
            print("error \(error)")
        }
    }
}

#Preview {
    NetflixHomeView()
}
