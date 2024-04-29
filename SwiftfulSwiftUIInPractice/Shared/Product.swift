//
//  Product.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import Foundation

struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    
    var firstImage: String {
        images.first ?? Constant.imageUrl
    }
    
    static var mock = Product(
        id: 1234,
        title: "Apple iPhone",
        description: "Apple iPhone desc apple iPhone desc apple iPhone desc",
        price: 500,
        discountPercentage: 0,
        rating: 5,
        stock: 2,
        brand: "Apple",
        category: "HP",
        thumbnail: Constant.imageUrl,
        images: [Constant.imageUrl, Constant.imageUrl, Constant.imageUrl, Constant.imageUrl, Constant.imageUrl]
    )
}


struct RowProduct: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}

