//
//  Product.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    let imageName: String
    let rating: Double
    let testimonialsCount: Int
    let name: String
    let country: String?
    let price: ProductPrice
    let badge: ProductBadge?
    let saleAmount: Int?
    var isFavorite: Bool = false
}

struct ProductBadge {
    let type: ProductBadgeType
    let color: ProductBadgeColor
}

enum ProductBadgeType: String {
    case new = "Новинки"
    case sale = "Удар по ценам"
    case sparCard = "Цена по карте"
}

enum ProductBadgeColor: String {
    case blue = "BadgeBlue"
    case green = "BadgeGreen"
    case red = "BadgeRed"
}

struct ProductPrice {
    let initial: Double
    let salePrice: Double
}

extension Product {
    static func mockProduct() -> Product {
        Product(
            id: 1,
            imageName: "ProductMock5",
            rating: 4.1,
            testimonialsCount: 19,
            name: "Дорадо Охлажденная Непотрошеная 300-400г",
            country: "Франция 🇫🇷",
            price: ProductPrice(initial: 199.59, salePrice: 399.59),
            badge: ProductBadge(type: .sparCard, color: .green),
            saleAmount: 25)
    }
    static func mockProducts() -> [Product] {
        return [
            Product(
                id: 1,
                imageName: "ProductMock1",
                rating: 4.1,
                testimonialsCount: 19,
                name: "сыр Ламбер 500/0 230г",
                country: nil,
                price: ProductPrice(initial: 199.99, salePrice: 99.99),
                badge: nil,
                saleAmount: nil,
                isFavorite: true),
            Product(
                id: 2,
                imageName: "ProductMock2",
                rating: 4.1,
                testimonialsCount: 10,
                name: "Дорадо Охлажденная Непотрошеная 300-400г",
                country: "Франция 🇫🇷",
                price: ProductPrice(initial: 250.00, salePrice: 99.99),
                badge: ProductBadge(type: .sparCard, color: .green),
                saleAmount: nil),
            Product(
                id: 3,
                imageName: "ProductMock3",
                rating: 4.1,
                testimonialsCount: 10,
                name: "Салат Овощной с Крабовыми Палочками",
                country: nil,
                price: ProductPrice(initial: 1300.00, salePrice: 1290.00),
                badge: ProductBadge(type: .new, color: .blue),
                saleAmount: 25),
            Product(
                id: 4,
                imageName: "ProductMock4",
                rating: 4.1,
                testimonialsCount: 19,
                name: "Салат Овощной с Крабовыми Палочками",
                country: nil,
                price: ProductPrice(initial: 199.99, salePrice: 99.99),
                badge: ProductBadge(type: .sale, color: .red),
                saleAmount: nil),
            Product(
                id: 5,
                imageName: "ProductMock2",
                rating: 4.1,
                testimonialsCount: 19,
                name: "Дорадо Охлажденная Непотрошеная 300-400г",
                country: "Франция 🇫🇷",
                price: ProductPrice(initial: 250.00, salePrice: 99.99),
                badge: ProductBadge(type: .sparCard, color: .green),
                saleAmount: nil)
        ]
    }
}
