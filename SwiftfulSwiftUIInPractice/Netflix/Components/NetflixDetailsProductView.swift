//
//  NetflixDetailsProductView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 03/06/24.
//

import SwiftUI

struct NetflixDetailsProductView: View {
    var title: String = "Title here"
    var isNew: Bool = true
    var yearRelease: String? = "2021"
    var seasonCount: Int? = 2
    var hasClosedCaptions: Bool = true
    var isTopTen: Int? = 10
    var description:  String?  = "Desc here"
    var castText: String?  = "Cast: Ningning, Karina, Winter, Gisele"
    var onPlayPressed: (() -> ())? = nil
    var onDownloadPressed: (() -> ())? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
            HStack {
                if isNew {
                    Text("New")
                        .foregroundStyle(.green)
                }
                Group {
                    if let yearRelease {
                        Text(yearRelease)
                    }
                    
                    if let seasonCount {
                        Text("\(seasonCount) Seasons")
                    }
                    
                    if  hasClosedCaptions {
                        Image(systemName: "captions.bubble")
                    }
                }
                .foregroundStyle(.netflixLightGray)
            }
            
            if let isTopTen {
                HStack {
                   topTenIcon
                    
                    Text("#\(isTopTen) in TV Shows Today")
                        .font(.headline)
                }
            }
            
            VStack(spacing: 8) {
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
                    onDownloadPressed?()
                }
            }
            .font(.callout)
            .fontWeight(.medium)
            
            Group {
                if let description {
                    Text(description)
                }
                
                if let castText {
                    Text(castText)
                        .foregroundStyle(.netflixLightGray)
                }
            }
            .font(.callout)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(.netflixWhite)
    }
    
    var topTenIcon: some View {
        Rectangle()
            .fill(.red)
            .frame(width: 28, height: 28)
            .overlay {
                VStack(spacing: -4) {
                    Text("TOP")
                        .fontWeight(.bold)
                        .font(.system(size: 8))
                    Text("10")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                }
                .offset(y: 1)
        }
    }
}

#Preview {
    ZStack {
        Color.netflixBlack.ignoresSafeArea()
        
        VStack(spacing: 40) {
            NetflixDetailsProductView()
            NetflixDetailsProductView(
                isNew: false ,
                yearRelease: nil, 
                seasonCount: nil,
                hasClosedCaptions: false,
                isTopTen:  nil,
                description: nil,
                castText: nil
            )
        }
    }
}
