//
//  CartManager.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import Foundation

final class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []

    func addToCart(_ product: Product) {
        products.append(product)
    }

    func removeFromCart(_ product: Product) {
        products = products.filter { $0.id != product.id }
    }
}
