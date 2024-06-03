//
//  ShareButton.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 03/06/24.
//

import SwiftUI

struct ShareButton: View {
    
    var urlString = "https://www.swiftful-thinking.com"
    
    var body: some View {
        if let url = URL(string: urlString) {
            ShareLink(item: url) {
                VStack(spacing: 8) {
                    Image(systemName: "paperplane")
                    .font(.title)
                    
                    
                    Text("Share")
                        .font(.caption)
                        .foregroundStyle(.netflixLightGray)
                }
                .foregroundStyle(.netflixWhite)
                .padding(8)
            }
        }
    }
}

#Preview {
    ShareButton()
}
