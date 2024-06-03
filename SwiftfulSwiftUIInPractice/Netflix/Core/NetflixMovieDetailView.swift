//
//  NetflixMovieDetailView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 03/06/24.
//

import SwiftUI

struct NetflixMovieDetailView: View {
    
    @Environment(\.router) var router
    @State var products: [Product] = []
    
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack {
                NetflixDetailHeaderView(onXmarkPressed:  {
                    router.dismissScreen()
                })
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        detailProductSection
                        buttonSection
                        productGridSection
                        
                    }
                }
                .padding(8)
            }
            
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    func getData() async {
        
        do {
            products = try await DatabaseHelper().getProduct()
            print(products.count)
            
        } catch {
            print("error \(error)")
        }
    }
    
}


//var
extension NetflixMovieDetailView {
    var detailProductSection: some View {
        NetflixDetailsProductView()
    }
    
    var buttonSection: some View {
        HStack() {
            MyListButton()
            
            RateButton() { itemSeletected in
                print(itemSeletected.title)
            }
            
            ShareButton()
            
        }
    }
    
    
    var productGridSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("More Like This")
                .font(.headline)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                ForEach(products) { product in
                    NetflixMovieCellView(
                        image: product.firstImage,
                        title: product.title,
                        isRecentlyAdded: product.recentlyAdded,
                        topTenRanking: nil
                    )
                }
            }
        }
    }
}

#Preview {
    NetflixMovieDetailView()
}
