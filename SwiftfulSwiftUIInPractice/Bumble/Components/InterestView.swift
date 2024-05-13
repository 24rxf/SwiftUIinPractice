//
//  InterstView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 13/05/24.
//

import SwiftUI

struct InterestView: View {
    let icon: String?
    let emoji: String?
    let title: String
    var body: some View {
        HStack {
            if let icon = icon {
                Image(systemName: icon)
            } else if let emoji = emoji {
                Text(emoji)
            }
            
            Text(title)
        }
        .font(.callout)
        .fontWeight(.medium)
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .foregroundStyle(.bumbleBlack)
        .background(.bumbleLightYellow)
        .clipShape(.rect(cornerRadius: 32))
    }
}

#Preview {
    InterestView(icon: nil, emoji: "X", title: "Somethings")
}
