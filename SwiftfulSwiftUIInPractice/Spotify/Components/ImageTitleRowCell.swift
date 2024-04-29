//
//  ImageTitleRowCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 29/04/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    let imageSize: CGFloat = 100
    let image: String
    let title: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(url: image)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(.callout)
                .foregroundStyle(.spotifyLightGrey)
                .lineLimit(2)
            
        }
        .frame(width: imageSize)
    }
}
//
//#Preview {
//    ImageTitleRowCell()
//}
