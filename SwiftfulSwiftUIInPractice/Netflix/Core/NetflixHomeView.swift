//
//  NetflixHomeView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/05/24.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting


struct NetflixHomeView: View {
    
    @Environment(\.router) var router
    
    @State var headerSize: CGSize = .zero
    @State var products: [Product] = []
    @State var rowProducts: [RowProduct] = []
    
    @State var scrollViewOffset: CGFloat = .zero
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()

            backgroundGradientLayer
            
            scrollViewLayer
            
            fullHeaderWithLayer
        }
        .foregroundStyle(.netflixWhite) 
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    
    var backgroundGradientLayer: some View {
        
        ZStack {
            LinearGradient(
                colors: [.netflixGray.opacity(0), .netflixGray],
                startPoint: .top,
                endPoint: .bottom
            )
            LinearGradient(
                colors: [.netflixRed.opacity(0.5), .netflixRed.opacity(0)],
                startPoint: .top,
                endPoint: .bottom
            )
        }
        .ignoresSafeArea()
        .frame(height: max(10, 300 + (scrollViewOffset * 0.75)))
        .opacity(scrollViewOffset < -250 ? 0 : 1)
        .animation(.easeInOut, value: scrollViewOffset)
    }
    
    var header: some View {
        HStack {
            Text("For you")
                .font(.title)
                .onTapGesture {
                    router.dismissScreen()
                }
            
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
    
    var fullHeaderWithLayer: some View {
        VStack {
            header
                .padding(.horizontal, 16)
            if scrollViewOffset > -20 {
                NetflixFilterBarView()
            }
            
        }
        .padding(.bottom, 8)
        .background {
            ZStack {
                if scrollViewOffset < -70 {
                    Rectangle()
                        .fill(Color.clear)
                        .background(.ultraThinMaterial)
                        .brightness(-0.2)
                        .ignoresSafeArea()
                }
            }
        }
        .readingFrame { frame in
            if headerSize == .zero {
                headerSize = frame.size
            }
        }
    }
    
    
    var scrollViewLayer: some View {
        ScrollViewWithOnScrollChanged {
            VStack(spacing: 8) {
                
               Rectangle()
                    .fill(.clear)
                    .frame(height: headerSize.height != .zero ? headerSize.height - 200 : headerSize.height)
                
                if let product = products.first {
                    
                    NetflixHeroCellView(
                        image: product.firstImage,
                        categories: [product.category, product.brand ?? "" ]
                    ).onTapGesture {
                        router.showScreen(.sheet) { _ in
                            NetflixMovieDetailView()
                        }
                    }
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
                                        ).onTapGesture {
                                            router.showScreen(.sheet) { _ in
                                                NetflixMovieDetailView()
                                            }
                                        }
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
        } onScrollChanged: { offset in
            scrollViewOffset = offset.y
        }
        
        
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
    RouterView { _ in
        NetflixHomeView()
    }
}
