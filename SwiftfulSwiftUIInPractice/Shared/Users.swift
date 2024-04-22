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
}
