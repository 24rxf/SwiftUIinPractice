//
//  ImageLoaderView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoaderView: View {
    
    var url: String
    
    var body: some View {
        Rectangle()
            .overlay {
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.progress)
                    .aspectRatio(contentMode: .fill)
                
            }
            .clipped()
    }
}

//#Preview {
//    ImageLoaderView(Constant.url)
//        .padding(.all, 60)
//}
