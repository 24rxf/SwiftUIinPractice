//
//  NetflixHeroCellView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 31/05/24.
//

import SwiftUI

struct NetflixHeroCellView: View {
    
    var isNetflixFilm = true
    
    var image = Constant.imageUrl
    var categories = ["Comdey", "Romantic", "Rauncly"]
    
    var onPlayPressed: (() -> ())?
    var onMyListPressed: (() -> ())?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(url: image)
            
            VStack(spacing: 16) {
                
                VStack(spacing: 0) {
                    if isNetflixFilm {
                        HStack {
                            Text("N")
                                .foregroundStyle(.netflixRed)
                                .font(.largeTitle)
                                .fontWeight(.black)
                            
                            Text("FILM")
                                .kerning(3)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.netflixLightGray)
                        }
                    }
                    Text("Players")
                        .font(.system(size: 30, weight: .medium, design: .serif))
                }
                
                HStack(spacing: 8) {
                    ForEach(categories, id: \.self) { category in
                        Text(category)
                            .font(.callout)
                        
                        if category != categories.last {
                            Circle()
                                .frame(width: 4)
                        }
                    }
                }
                
                HStack(spacing: 16) {
                    HStack {
                        Image(systemName: "play.fill")
                        Text("Play")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(.netflixWhite)
                    .foregroundStyle(.netflixGray)
                    .clipShape(.rect(cornerRadius: 4))
                    .asButton {
                        onPlayPressed?()
                    }
                    
                    HStack {
                        Image(systemName: "plus")
                        Text("My List")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(.netflixGray)
                    .foregroundStyle(.netflixWhite)
                    .clipShape(.rect(cornerRadius: 4))
                    .asButton {
                        onMyListPressed?()
                    }
                }
            }
            .padding(24)
            .background(
                LinearGradient(
                    colors: [
                        .netflixBlack.opacity(0.0),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                        .netflixBlack.opacity(0.4),
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
        }
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 8))
        .aspectRatio(0.8, contentMode: .fit)
      
    }
}

#Preview {
    NetflixHeroCellView()
        .padding()
}
