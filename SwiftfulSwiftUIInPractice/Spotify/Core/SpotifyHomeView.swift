//
//  SpotifyHomeView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI

struct SpotifyHomeView: View {
    
    @State var currentUser: User? = nil
    @State var selectedCategory: Category? = nil
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section {
                        ScrollView {
                            VStack {
                                ForEach(0..<12) { _ in
                                        Rectangle()
                                        .foregroundStyle(.red)
                                        .frame(width: 220, height: 220)
                                }
                            }
                        }
                    } header: {
                        header
                    }
                    
                }
            }
            .clipped()
        }
        .task {
            do {
                currentUser = try await DatabaseHelper().getUser().last
            } catch {
                
            }
        }
    }
    
    
    var header: some View {
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
}

#Preview {
    SpotifyHomeView()
}
