//
//  ProductsGridView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductsGridView: View {
    @State var products: [Product]

    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.separator)
                .frame(maxWidth: .infinity)
                .frame(height: 1)
            LazyVGrid(columns: [GridItem(.fixed(168), spacing: 5), GridItem(.fixed(168), spacing: 5)], spacing: 8) {
                ForEach(products) { product in
                    VerticalProductCardView(product: product)
                }
            }
        }
    }
}

#Preview {
    ProductsGridView(products: Product.mockProducts())
}
