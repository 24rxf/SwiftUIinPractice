//
//  ChatPreviewCell.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 13/05/24.
//

import SwiftUI

struct ChatPreviewCell: View {
    
    var user: User = .mock
    
    var isYourMove = true
    
    var lastMessage: String? = "Learn how to build reusable components and complex user interfaces. Create beautiful animations and user experiences."
    
    var body: some View {
        HStack {
            ProfileImageCell()
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 0) {
                    Text(user.firstName)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if isYourMove {
                        Text("YOUR MOVE")
                            .font(.caption2)
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 4)
                            .background(.bumbleYellow)
                            .clipShape(.rect(cornerRadius: 32))
                    }
                    
                }
                if let lastMessage {
                    Text(lastMessage)
                        .font(.subheadline)
                        .foregroundStyle(.bumbleGray)
                        .padding(.trailing, 16)
                }
            }
            .lineLimit(1)
        }
    }
}

#Preview {
    ChatPreviewCell()
        .padding()
}
