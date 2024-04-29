//
//  PlaylistHeaderCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/04/24.
//

import SwiftUI
import SwiftfulUI

struct PlaylistHeaderCell: View {
    
    var height: CGFloat = 300
    var title = "Title here Title here"
    var subtitle = "Subtitle here Subtitle here"
    var image = Constant.imageUrl
    let shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(url: image)
            }
            .overlay (
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                }
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .background(
                        LinearGradient(colors: [shadowColor.opacity(0), shadowColor], startPoint: .top, endPoint: .bottom)
                    ), 
                alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
    }
}
