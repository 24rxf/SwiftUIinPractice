//
//  CardView.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 12/05/24.
//

import SwiftUI
import SwiftfulUI

struct CardView: View {
    
    var user: User = .mock
    var onSendAndComplimentPressed: (() -> ())?
    var onSuperLikePressed: (() -> ())?
    var onXmarkCheckPressed: (() -> ())?
    var onCheckmarkPressed:  (() -> ())?
    var onHideAndReportPressed:  (() -> ())?
    
    @State var frameCardView: CGSize = .zero
    
    var body: some View {
        ScrollView {
            headerCell
            
            
            aboutMeSection
                .padding(
                    24
                )
            
            myInterestSection
                .padding(
                    24
                )
            
            ForEach(
                Constant.imagesUrl,
                id: \.self
            ) { img in
                ImageLoaderView(
                    url: img
                )
                .frame(
                    height: frameCardView.height
                )
            }
            
            locationSection
                .padding(
                    24
                )
            
            footerSection
                .padding(
                    .vertical,
                    40
                )
            
        }
        .background(
            .bumbleBackgroundYellow
        )
        .clipShape(
            .rect(
                cornerRadius: 32
            )
        )
        .readingFrame { frame in
            frameCardView = frame.size
        }
        
        .overlay(alignment: .bottomTrailing,
                 content: {
            superLikeButton
        }
        )
        
    }
}

extension CardView {
    
    var superLikeButton: some View {
        Image(
            systemName: "hexagon.fill"
        )
        .padding()
        .foregroundStyle(
            .bumbleYellow
        )
        .font(
            .system(
                size: 60
            )
        )
        .overlay {
            Image(
                systemName: "star.fill"
            )
            .foregroundStyle(
                .bumbleBlack
            )
            .font(
                .system(
                    size: 20,
                    weight: .medium
                )
            )
        }
        .onTapGesture {
            onSuperLikePressed?()
        }
    }
    
    var headerCell: some View {
        LazyVStack(
            spacing: 0
        ) {
            ZStack(
                alignment: .bottomLeading
            ) {
                ImageLoaderView(
                    url: Constant.imageUrl
                )
                .frame(
                    height: frameCardView.height
                )
                
                VStack(
                    alignment: .leading,
                    spacing: 8
                ) {
                    Text(
                        "\(user.firstName), \(user.age)"
                    )
                    .font(
                        .largeTitle
                    )
                    .fontWeight(
                        .semibold
                    )
                    
                    HStack(
                        spacing: 4
                    ) {
                        Image(
                            systemName: "suitcase"
                        )
                        Text(
                            "Job here"
                        )
                    }
                    
                    HStack(
                        spacing: 4
                    ) {
                        Image(
                            systemName: "graduationcap"
                        )
                        Text(
                            "Grad here"
                        )
                    }
                    
                    HeartView()
                        .onTapGesture {
                            
                        }
                }
                .font(
                    .callout
                )
                .fontWeight(
                    .medium
                )
                .foregroundStyle(
                    .bumbleWhite
                )
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding()
                .background(
                    LinearGradient(
                        colors: [
                            .bumbleBlack.opacity(
                                0
                            ),
                            .bumbleBlack.opacity(
                                0.6
                            ),
                            .bumbleBlack.opacity(
                                0.6
                            )
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
    }
    
    
    var aboutMeSection: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            sectionTitle(
                "About Me"
            )
            
            Text(
                "Lorem ipsum color dot amet Lorem ipsum color dot amet Lorem ipsum"
            )
            .font(
                .body
            )
            .fontWeight(
                .semibold
            )
            .foregroundStyle(
                .bumbleGray
            )
            
            HStack {
                HeartView()
                Text(
                    "Send a compliment"
                )
            }
            .padding(
                [
                    .horizontal,
                    .trailing
                ],
                8
            )
            .background(
                .bumbleYellow
            )
            .clipShape(
                .rect(
                    cornerRadius: 32
                )
            )
            .onTapGesture {
                onSendAndComplimentPressed?()
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
    
    
    var myInterestSection: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                sectionTitle(
                    "My Basics"
                )
                InterestGridView(
                    interests: user.basics
                )
            }
            VStack(
                alignment: .leading,
                spacing: 8
            ) {
                sectionTitle(
                    "My Interest"
                )
                InterestGridView(
                    interests: user.interests
                )
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
    
    
    var locationSection: some View {
        VStack(
            alignment: .leading,
            spacing: 12
        ) {
            HStack(
                spacing: 8
            ) {
                Image(
                    systemName: "mappin.and.ellipse.circle.fill"
                )
                Text(
                    "Rizal's Location"
                )
            }
            .foregroundStyle(
                .bumbleGray
            )
            .font(
                .body
            )
            .fontWeight(
                .medium
            )
            
            Text(
                "110 milles away"
            )
            .font(
                .headline
            )
            .foregroundStyle(
                .bumbleBlack
            )
            
            InterestView(
                icon: nil,
                emoji: "🇮🇩",
                title: "Live in Bnadung, INA"
            )
            .padding(
                8
            )
            .background(
                .bumbleLightYellow
            )
            .clipShape(
                .rect(
                    cornerRadius: 32
                )
            )
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
    
    
    var footerSection: some View {
        VStack(
            alignment: .center
        ) {
            HStack {
                Circle()
                    .fill(
                        .bumbleYellow
                    )
                    .frame(
                        width: 60
                    )
                    .overlay {
                        Image(
                            systemName: "xmark"
                        )
                        .font(
                            .title
                        )
                        .fontWeight(
                            .semibold
                        )
                    }
                    .onTapGesture {
                        onXmarkCheckPressed?()
                    }
                
                Spacer()
                Circle()
                    .fill(
                        .bumbleYellow
                    )
                    .frame(
                        width: 60
                    )
                    .overlay {
                        Image(
                            systemName: "checkmark"
                        )
                        .font(
                            .title
                        )
                        .fontWeight(
                            .semibold
                        )
                    }
                    .onTapGesture {
                       
                        onCheckmarkPressed?()
                    }
                
            }
            .padding(
                24
            )
            
            
            Button(
                "Hide and report"
            ) {
                onHideAndReportPressed?()
            }
            .font(
                .headline
            )
            .foregroundStyle(
                .bumbleGray
            )
            
        }
    }
}

extension CardView {
    func sectionTitle(
        _ title: String
    ) -> some View {
        Text(
            title
        )
        .font(
            .body
        )
        .foregroundStyle(
            .bumbleGray
        )
    }
}

#Preview {
    CardView()
        .padding(
            .horizontal,
            16
        )
        .padding(
            .vertical,
            40
        )
}
