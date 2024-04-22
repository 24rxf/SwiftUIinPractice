//
//  DatabaseHelper.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import Foundation


class DatabaseHelper {
    
    func getProduct() async throws -> [Product] {
        guard let url = URL(string: "https://dummyjson.com/products") else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try  JSONDecoder().decode(Products.self, from: data)
        
        return products.products
    }
    
    
    func getUser() async throws -> [User] {
        guard let url = URL(string: "https://dummyjson.com/users") else { throw URLError(.badURL) }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let users = try  JSONDecoder().decode(Users.self, from: data)
        
        return users.users
    }
    
}
