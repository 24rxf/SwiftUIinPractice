//
//  InterestGridView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 13/05/24.
//

import SwiftUI
import SwiftfulUI


struct UserInterest: Identifiable {
    var id: String = UUID().uuidString
    var iconName: String?
    var emoji: String?
    var title: String
}

struct InterestGridView: View {
    var interests: [UserInterest] = User.mock.basics
    
    var body: some View {
        ZStack {
            NonLazyVGrid(columns: 2, alignment: .leading, spacing: 8, items: interests) { interest in
                if let interest = interest {
                    InterestView(icon: interest.iconName, emoji: interest.emoji, title: interest.title)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    VStack {
        InterestGridView()
        InterestGridView(interests: User.mock.interests)
    }
}
