//
//  ChatView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 13/05/24.
//

import SwiftUI

struct ChatView: View {
    
    @State var users: [User] = []
    
    var body: some View {
        ZStack {
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 0) {
                headerSection
                    .padding(16)
                
                VStack(alignment: .leading, spacing: 8) {
                    Group {
                        Text("Match Queue")
                            .foregroundStyle(.bumbleBlack)
                        +
                        Text(" (\(users.count))")
                            .foregroundStyle(.bumbleGray)
                    }
                    .padding(.horizontal, 16)
                    
                    matchQueueSection
                    
                    HStack {
                        Group {
                            Text("Chats")
                                .foregroundStyle(.bumbleBlack)
                            +
                            Text(" (Recent)")
                                .foregroundStyle(.bumbleGray)
                        }
                        Spacer()
                        
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.title2)
                    }
                    .padding(.horizontal, 16)
                    
                    chatsRecentSection
                    
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    
    func getData() async {
        guard users.isEmpty else { return }
        do {
            users = try await DatabaseHelper().getUser()
        } catch {
            
        }
    }
    
    var headerSection: some View {
        HStack(spacing: 0) {
            Image(systemName: "line.horizontal.3")
            Spacer()
            Image(systemName: "magnifyingglass")
        }
        .foregroundStyle(.bumbleBlack)
        .font(.title)
        .fontWeight(.medium)
    }
    
    var matchQueueSection: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(users) { user in
                    ProfileImageCell(
                        hasNewMessage: Bool.random(),
                        precentageRemaning: Double.random(in: 0...1)
                    )
                }
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 100)
    }
    
    var chatsRecentSection: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(users) { user in
                    ChatPreviewCell(
                        user: user,
                        isYourMove: Bool.random()
                        
                    )
                }
            }
            .padding(.all, 16)
        }
    }
}

#Preview {
    ChatView()
}
