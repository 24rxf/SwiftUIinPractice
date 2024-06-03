//
//  NetflixFilterBarView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 30/05/24.
//

import SwiftUI

struct NetflixFilterBarView: View {
    
    let filter = ["Comedy", "Horror", "Action", "Korean"]
    @State var selectedFilter: String? = nil
    var body: some View {
        
        HStack(spacing: 0){
            if selectedFilter != nil {
                Image(systemName: "xmark")
                    .padding(.all, 8)
                    .background {
                        Circle()
                            .stroke(lineWidth: 1)
                    }
                    .asButton {
                        withAnimation(.bouncy) {
                            selectedFilter = nil
                        }
                    }
                    .padding(.leading, 8)
            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                    if selectedFilter != nil {
                        NetflixFilterCellView(title: selectedFilter ?? "", isDropDown: Bool.random(), isSelected: true)
                            .onTapGesture {
                                withAnimation(.bouncy) {
                                    selectedFilter = nil
                                }
                            }
                        
                    } else {
                        ForEach(filter, id: \.self) { filter in
                            
                            NetflixFilterCellView(title: filter, isDropDown: Bool.random(), isSelected: false)
                                .onTapGesture {
                                    withAnimation(.bouncy) {
                                        selectedFilter = filter
                                    }
                                }
                        }
                    }
                    
                }.padding(8)
            }
        }
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.black
        
        NetflixFilterBarView()
    }
}
