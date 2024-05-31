//
//  NetflixMovieCellView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 31/05/24.
//

import SwiftUI

struct NetflixMovieCellView: View {
    var width: CGFloat = 90
    var height: CGFloat = 140
    var image: String = Constant.imageUrl
    var title: String? = "Movie Title"
    var isRecentlyAdded: Bool
    var topTenRanking: Int? = nil
    
    
    var body: some View {
        HStack(alignment: .bottom, spacing: -2) {
            if let topTenRanking {
                Text("\(topTenRanking)")
                    .font(.system(size: 100, weight: .medium, design: .serif))
                    .offset(y: 20)
            }
            
            ZStack(alignment: .bottom) {
                ImageLoaderView(url: image)
                
                VStack(spacing: 0) {
                    
                    if let title, let firstWorld = title.components(separatedBy: " ").first {
                        Text(firstWorld)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .lineLimit(1)
                    }
                    
                    Text("Recently Add")
                        .padding(.horizontal, 4)
                        .padding(.vertical , 2)
                        .padding(.bottom, 2)
                        .frame(maxWidth: .infinity)
                        .background(.netflixRed)
                        .clipShape(.rect(cornerRadius: 2))
                        .lineLimit(1)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.1)
                        .padding(.horizontal, 8)
                        .opacity(isRecentlyAdded ? 1 : 0)
                    
                }
                .background(
                    LinearGradient(
                        colors: [
                            .netflixBlack.opacity(0),
                            .netflixBlack.opacity(0.4),
                            .netflixBlack.opacity(0.4),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .frame(width: width, height: height)
        }
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    ZStack {
        Color.black
        
        ScrollView {
            NetflixMovieCellView(isRecentlyAdded: false, topTenRanking: 2)
            NetflixMovieCellView(isRecentlyAdded: true, topTenRanking: 10)
            NetflixMovieCellView(isRecentlyAdded: false)
            NetflixMovieCellView(isRecentlyAdded: true)
        }
    }
}
