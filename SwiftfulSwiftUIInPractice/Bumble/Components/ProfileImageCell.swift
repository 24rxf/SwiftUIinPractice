//
//  ProfileImageCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 13/05/24.
//

import SwiftUI

struct ProfileImageCell: View {
    @State var hasNewMessage = Bool.random()
    @State var precentageRemaning = Double.random(in: 0...1)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray ,lineWidth: 2)
            Circle()
                .trim(from: 0, to: precentageRemaning)
                .stroke(.bumbleYellow ,lineWidth: 2)
               
            ImageLoaderView(url: Constant.imageUrl)
                .clipShape(Circle())
                .padding(4)
        }
        .overlay(alignment: .bottomTrailing) {
            if hasNewMessage {
                Circle()
                    .fill(.bumbleYellow)
                    .frame(width: 24, height: 24)
                    .offset(x: 2, y: 2)
            }
        }
        .frame(width: 75, height: 75)
        
    }
}

#Preview {
    VStack {
        ProfileImageCell()
        ProfileImageCell(precentageRemaning: 0.5)
        ProfileImageCell( hasNewMessage: false, precentageRemaning: 0.5)
        ProfileImageCell(precentageRemaning: 0.8)
    }
}
