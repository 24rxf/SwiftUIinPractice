//
//  FilterView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import SwiftUI

struct FilterView: View {
    let filter: [String]
    @Binding var selectedOption: String
    
    @Namespace var namespace
    
    var body: some View {
        HStack(alignment: .top) {
            ForEach(filter, id: \.self) { option in
                VStack(spacing: 8) {
                    Text(option)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if selectedOption == option {
                        RoundedRectangle(cornerRadius: 2)
                            .frame(height: 1.5)
                            .padding(.horizontal)
                            .matchedGeometryEffect(id: "option", in: namespace)
                    }
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(.smooth) {
                        selectedOption = option
                    }
                }
                
            }
        }
    }
}

#Preview {
    FilterView(filter: ["Everyone", "Trending"], selectedOption: .constant("Everyone"))
}
