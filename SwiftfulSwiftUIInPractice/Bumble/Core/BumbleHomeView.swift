//
//  BumbleHomeView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 11/05/24.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    
    @Environment(\.router) var router
    
    let filter = ["Everyone", "Trending"]
    @State var selectedOption: String = "Everyone"
    
    
    @State var users: [User] = []
    @State var selectedIndex: Int = 0
    @State var cardOfsets: [Int:Bool] = [:]
    @State var currentSwipeoffset: CGFloat = .zero
    
    var body: some View {
        ZStack {
            
            Color.bumbleWhite.ignoresSafeArea()
            
            VStack(spacing: 12) {
                header
                
                FilterView(filter: filter, selectedOption:  $selectedOption)
                
                ZStack {
                    if !users.isEmpty {
                        ForEach(Array(users.enumerated()), id: \.offset) { (index, user) in
                            
                            let isPrevious = (selectedIndex - 1) == index
                            let isCurrent = selectedIndex == index
                            let isNext = (selectedIndex + 1)  == index
                            
                            if isPrevious || isCurrent || isNext {
                                let offsetValue = cardOfsets[user.id]
                                
                                userProfileCell(user: user, index: index)
                                    .zIndex(Double(users.count - 1))
                                    .offset(x: offsetValue == nil ? 0 : offsetValue == true ? 900 : -900)
                            }
                        }
                    }
                    
                    overlaySwipingIndicator
                    .zIndex(9999999)
                    .animation(.smooth, value: currentSwipeoffset)
                   
                }
                Spacer()
            }
            .padding(8)
        }
        .toolbar(.hidden, for: .navigationBar)
        .task {
            await getData()
        }
    }
    
    func userDidSelect(index: Int, isLike: Bool) {
        let user = users[index]
        cardOfsets[user.id] = isLike
        
        
        selectedIndex += 1
    }
    
    
    func getData() async {
        guard users.isEmpty else { return }
        do {
            users = try await DatabaseHelper().getUser()
        } catch {
            
        }
    }
    
    var header: some View {
        ZStack() {
            HStack(spacing: 0) {
                Image(systemName: "line.horizontal.3")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        
                    }
                
                Image(systemName: "arrow.uturn.left")
                    .padding(8)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        router.dismissScreen()
                    }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Bumble")
                .font(.title)
                .foregroundStyle(.bumbleYellow)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Image(systemName: "slider.horizontal.3")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    router.showScreen(.push) { _ in
                            ChatView()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .foregroundStyle(.bumbleBlack)
    }
    
    
    func userProfileCell(user: User, index: Int) -> some View {
        CardView(
            user: user,
            onXmarkCheckPressed: {
                userDidSelect(index: index, isLike: false)
            },
            onCheckmarkPressed: {
                userDidSelect(index: index, isLike: true)
            }
        )
            .withDragGesture(
                .horizontal,
                minimumDistance: 10,
                resets: true,
                rotationMultiplier: 1.05,
                onChanged: { dragOffset in
                    print("Changed")
                    currentSwipeoffset = dragOffset.width
                },
                onEnded: { dragOffset in
                    if dragOffset.width < -50 {
                        userDidSelect(index: index, isLike: false)
                    } else if dragOffset.width > 50 {
                        userDidSelect(index: index, isLike: true)
                    }
                }
            )
    }
    
    var overlaySwipingIndicator: some View {
        ZStack {
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "xmark")
                }
                .frame(width: 60)
                .scaleEffect(abs(currentSwipeoffset) > 100 ? 1.5: 1.0)
                .offset(x: min(-currentSwipeoffset, 150))
                .offset(x: -100)
                .frame(maxWidth: .infinity, alignment: .leading)
            Circle()
                .fill(.bumbleGray.opacity(0.4))
                .overlay {
                    Image(systemName: "checkmark")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 60)
                .scaleEffect(abs(currentSwipeoffset) > 100 ? 1.5: 1.0)
                .offset(x: max(-currentSwipeoffset, -150))
                .offset(x: 100)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
       
    }
}

#Preview {
    BumbleHomeView()
}
