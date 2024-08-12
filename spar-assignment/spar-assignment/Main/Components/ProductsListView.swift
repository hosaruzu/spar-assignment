//
//  CategoryView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import SwiftUI

struct ProductsListView: View {

    // MARK: - Properties

    @State private var products: [Product]
    @EnvironmentObject var cartManager: CartManager

    // MARK: - Init

    init(products: [Product]) {
        self.products = products
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            separatorView
            gridList
        }
    }
}

// MARK: - Subviews

private extension ProductsListView {
    var separatorView: some View {
        Rectangle()
            .fill(.separator)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }

    var gridList: some View {
        LazyVGrid(columns: [GridItem()]) {
            ForEach(products) { product in
                HorizontalProductCardView(product: product)
                    .environmentObject(cartManager)
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        ProductsListView(products: Product.mockProducts())
            .environmentObject(CartManager())
    }
}
