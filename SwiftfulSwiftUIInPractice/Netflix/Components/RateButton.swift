//
//  RateButton.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 03/06/24.
//

import SwiftUI


enum RateOption: String, CaseIterable {
    
    case dislike, like, love
    
    
    var title: String {
        switch self {
        case .dislike:
            "Not for me"
        case .like:
            "I like this"
        case .love:
            "Love this!"
        }
    }
    
    var image: String {
        switch self {
        case .dislike:
            "hand.thumbsdown"
        case .like:
            "hand.thumbsup"
        case .love:
            "heart"
        }
    }
}

struct RateButton: View {
    
   @State var showPopover = false
    var onRatingSelected: ((RateOption) -> ())? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "hand.thumbsup")
            .font(.title)
            
            
            Text("My List")
                .font(.caption)
                .foregroundStyle(.netflixLightGray)
        }
        .foregroundStyle(.netflixWhite)
        .padding(8)
        .onTapGesture {
            withAnimation(.bouncy) {
                showPopover.toggle()
            }
        }
        .popover(isPresented: $showPopover) {
            HStack(spacing: 12) {
                ForEach(RateOption.allCases, id: \.self) { rateOption in
                    rateButon(rateOption)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .presentationCompactAdaptation(.popover)
        }
       
    }
    
    func rateButon(_ rateOption: RateOption) -> some View {
        VStack(spacing: 8) {
            Image(systemName: rateOption.image)
                .font(.title2)
            Text(rateOption.title)
                .font(.caption)
        }
        .foregroundStyle(.netflixWhite)
        .padding(4)
        .background(.black.opacity(0.01))
        .onTapGesture {
            showPopover = false
            onRatingSelected?(rateOption)
        }
    }
}

#Preview {
    RateButton()
}
