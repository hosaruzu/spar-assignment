//
//  ProductsGridView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductsGridView: View {
    // MARK: - Properties

    @State private var products: [Product]
    @EnvironmentObject var cartManager: CartManager

    private let columns = [
        GridItem(.fixed(168), spacing: 5),
        GridItem(.fixed(168), spacing: 5)
    ]

    // MARK: - Init

    init(products: [Product]) {
        self.products = products
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            separatorView
            twoColumnGrid
        }
    }
}

// MARK: - Subviews

private extension ProductsGridView {
    var separatorView: some View {
        Rectangle()
            .fill(.separator)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }

    var twoColumnGrid: some View {
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(products) { product in
                VerticalProductCardView(product: product)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ProductsGridView(products: Product.mockProducts())
        .environmentObject(CartManager())
}
