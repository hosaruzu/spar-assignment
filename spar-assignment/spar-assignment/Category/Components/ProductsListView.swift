//
//  CategoryView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import SwiftUI

struct ProductsListView: View {
    
    @State var products: [Product]

    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.separator)
                .frame(maxWidth: .infinity)
                .frame(height: 1)
            LazyVGrid(columns: [GridItem()], content: {
                ForEach(products) { product in
                    HorizontalProductCardView(product: product)
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        ProductsListView(products: Product.mockProducts())
    }
}
