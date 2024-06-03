//
//  NetflixDetailHeaderView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 03/06/24.
//

import SwiftUI
import SwiftfulUI

struct NetflixDetailHeaderView: View {
    
    var image = Constant.imageUrl
    var progress: Double = 0.4
    var onAirPlayPressed: (() -> ())? = nil
    var onXmarkPressed: (() -> ())? = nil
    
    var body: some View {
        ZStack {
            
            ImageLoaderView(url: image)
            
            
            HStack {
                Circle()
                    .fill(.netflixBlack)
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image(systemName: "airplayvideo")
                            .offset(y: 1)
                    }
                    .onTapGesture {
                        onAirPlayPressed?()
                    }
                Circle()
                    .fill(.netflixBlack)
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image(systemName: "xmark")
                            .offset(y: 1)
                    }
                    .onTapGesture {
                        onXmarkPressed?()
                    }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topTrailing)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(8)
            
            
            CustomProgressBar(
                selection: progress,
                range: 0...1,
                backgroundColor: .netflixLightGray,
                foregroundColor: .netflixRed,
                cornerRadius: 0,
                height: 4
            )
            .padding(.bottom, 4)
            .animation(.linear, value: progress)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
        }
        .aspectRatio(2, contentMode: .fit)
        .foregroundStyle(.netflixWhite)
    }
}

#Preview {
    NetflixDetailHeaderView()
}
