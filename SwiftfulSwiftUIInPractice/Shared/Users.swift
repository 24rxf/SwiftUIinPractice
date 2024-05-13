//
//  Users.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import Foundation

struct Users: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    
    var basics: [UserInterest] {
        [
            UserInterest(iconName: "ruler", title: "\(height)"),
            UserInterest(iconName: "graduationcap", title: "Education"),
            UserInterest(iconName: "wineglass", title: "Socialy"),
            UserInterest(iconName: "moon.stars.fill", title: "Libra"),
        ]
    }
    
    var interests: [UserInterest] {
        [
            UserInterest(emoji: "🏃", title: "Running"),
            UserInterest(emoji: "🖥️", title: "Computer"),
            UserInterest(emoji: "🎶", title: "Music"),
            UserInterest(emoji: "♎", title: "Libra")
        ]
    }
    
    static var mock = User(
        id: 1,
        firstName: "Rizal",
        lastName: "fahrud",
        maidenName: "",
        age: 22,
        email: "rizal@gmail.com",
        phone: "0821",
        username: "rizal",
        password: "",
        birthDate: "",
        image: Constant.imageUrl,
        bloodGroup: "",
        height: 170,
        weight: 70
    )
}

