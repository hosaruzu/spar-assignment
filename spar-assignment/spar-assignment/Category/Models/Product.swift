//
//  Product.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    let rating: Double
    let name: String
    let country: String?
    let price: ProductPrice
    let badge: ProductBadge
    let saleAmount: Int?
}

enum ProductBadge {
    case none
    case new
    case sale
    case sparCard
}

struct ProductPrice {
    let initial: Double
    let salePrice: Double
}

extension Product {
    func mockProduct() -> Product {
        Product(
            imageName: "ProductMock1",
            rating: 4.1,
            name: "сыр Ламбер 500/0 230г",
            country: nil,
            price: ProductPrice(initial: 199.99, salePrice: 99.99),
            badge: .none,
            saleAmount: nil)
    }
    func mockProducts() -> [Product] {
        return [
            Product(
                imageName: "ProductMock1",
                rating: 4.1,
                name: "сыр Ламбер 500/0 230г",
                country: nil,
                price: ProductPrice(initial: 199.99, salePrice: 99.99),
                badge: .none,
                saleAmount: nil),
            Product(
                imageName: "ProductMock2",
                rating: 4.1,
                name: "Дорадо Охлажденная Непотрошеная 300-400г",
                country: "Франция",
                price: ProductPrice(initial: 250.00, salePrice: 99.99),
                badge: .new,
                saleAmount: nil),
            Product(
                imageName: "ProductMock3",
                rating: 4.1,
                name: "Ролл Маленькая Япония 216г",
                country: nil,
                price: ProductPrice(initial: 1300.00, salePrice: 1290.00),
                badge: .sale,
                saleAmount: 25),
            Product(
                imageName: "ProductMock4",
                rating: 4.1,
                name: "Салат Овощной с Крабовыми Палочками",
                country: nil,
                price: ProductPrice(initial: 199.99, salePrice: 99.99),
                badge: .sparCard,
                saleAmount: nil)
        ]
    }
}
