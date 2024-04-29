//
//  PlaylistDescriptionCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/04/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var username: String = "Rizal"
    var subheadline: String = "Some headline here"
    var onAddToPlayPressed: (() -> ())? = nil
    var onDownloadPressed: (() -> ())? = nil
    var onSharePressed: (() -> ())? = nil
    var onEllipsisPressed: (() -> ())? = nil
    var onShufflePressed: (() -> ())? = nil
    var onPlayPressed: (() -> ())? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
                .foregroundStyle(.spotifyLightGrey)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            buttonRow
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGrey)
    }
    
    var madeForYouSection: some View {
        HStack {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text(username)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    var buttonRow: some View {
        HStack(spacing: 0) {
            
            HStack(alignment: .center) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 22))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.down.circle")
                    .font(.system(size: 22))
                    .onTapGesture {
                        
                    }
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 22))
                    .onTapGesture {
                        
                    }
                Image(systemName: "ellipsis")
                    .font(.system(size: 22))
                    .onTapGesture {
                        
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .onTapGesture {
                        
                    }
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 24))
                    .onTapGesture {
                        
                    }
            }
            .foregroundStyle(.spotifyGreen)
            
        }
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()
        
        PlaylistDescriptionCell()
    }
}
