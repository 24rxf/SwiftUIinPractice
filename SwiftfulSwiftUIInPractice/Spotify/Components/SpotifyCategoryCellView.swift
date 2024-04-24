//
//  SpotifyCategoryCellView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI

struct SpotifyCategoryCellView: View {
    
    var title: String = ""
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Text(title.capitalized)
                .frame(minWidth: 35)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .themeColor(isSelected: isSelected)
                .clipShape(.rect(cornerRadius: 16))
            
        }
    }
}

extension View {
    func themeColor(isSelected: Bool) -> some View {
        return self
            .background(isSelected ? .spotifyGreen : .spotifyDarkGray)
            .foregroundStyle(isSelected ? .spotifyBlack :  .spotifyWhite)
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            SpotifyCategoryCellView(title: "The")
            SpotifyCategoryCellView(title: "The 2",isSelected: true)
            SpotifyCategoryCellView(title: "The 3")
        }
    }
}
