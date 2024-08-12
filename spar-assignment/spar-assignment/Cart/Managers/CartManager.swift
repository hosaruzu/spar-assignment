//
//  CartManager.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import Foundation

final class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = [Product(
        id: 1,
        imageName: "ProductMock1",
        rating: 4.1,
        testimonialsCount: 19,
        name: "сыр Ламбер 500/0 230г",
        country: nil,
        price: ProductPrice(initial: 199.99, salePrice: 99.99),
        badge: nil,
        saleAmount: nil,
        isFavorite: true)]

    func addToCart(_ product: Product) {
        products.append(product)
    }

    func removeFromCart(_ product: Product) {
        products = products.filter { $0.id != product.id }
    }
}
