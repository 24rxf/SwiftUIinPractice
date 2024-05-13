//
//  HeartView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 12/05/24.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.bumbleYellow)
                .frame(width: 40)
            
            Image(systemName: "bubble.fill")
                .foregroundStyle(.bumbleBlack)
                .font(.system(size: 22))
                .offset(y: 2)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(.bumbleYellow)
                .font(.system(size: 11))
        }
    }
}

#Preview {
    HeartView()
}
