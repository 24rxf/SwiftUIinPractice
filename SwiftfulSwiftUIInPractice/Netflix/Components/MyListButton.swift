//
//  MyListButton.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 03/06/24.
//

import SwiftUI

struct MyListButton: View {
    
    @State var isMyList = false
    
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                Image(systemName: "xmark")
                    .opacity(isMyList ? 1 : 0)
                    .rotationEffect(isMyList ? .degrees(180) : .zero)
                
                Image(systemName: "plus")
                    .opacity(isMyList ? 0 : 1)
                    .rotationEffect(isMyList ?.degrees(-180) :   .zero  )
            }
            .font(.title)
            
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .onTapGesture {
            withAnimation(.bouncy) {
                isMyList.toggle()
            }
        }
    }
}

#Preview {
    MyListButton()
}
