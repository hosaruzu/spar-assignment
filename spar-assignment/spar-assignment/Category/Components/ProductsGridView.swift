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
            LazyVGrid(columns: [GridItem(), GridItem()], content: {
                ForEach(products) { product in
                    VerticalProductCardView(product: product)
                        .padding()
                }
            })
        }
    }
}

#Preview {
    ProductsGridView(products: Product.mockProducts())
}
