//
//  NetflixFilterCellView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 30/05/24.
//

import SwiftUI

struct NetflixFilterCellView: View {
    
    var title = "Title"
    
    var isDropDown = false
    
    var isSelected = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            if isDropDown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background {
             
                if isSelected {
                    Capsule(style: .circular)
                        .fill(.netflixGray)
                    
                } else {
                    Capsule(style: .circular)
                        .stroke(lineWidth: 1)
                }
                   
           
        }
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.netflixBlack
        VStack {
            NetflixFilterCellView()
            NetflixFilterCellView(isDropDown: true)
            NetflixFilterCellView(isSelected: true)
        }
    }
}
