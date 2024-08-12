//
//  CartRowView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct CartRowView: View {
    // MARK: - Properties
    private let product: Product

    // MARK: - Init

    init(product: Product) {
        self.product = product
    }

    // MARK: - Body

    var body: some View {
        HStack {
            imageView
            VStack(alignment: .leading) {
                ProductNameView(name: product.name, country: nil)
                priceView
            }
        }
    }
}

// MARK: - Subviews

private extension CartRowView {
    var imageView: some View {
        Image(product.imageName)
            .resizable()
            .frame(width: 80, height: 80)
    }

    var priceView: some View {
        HStack(spacing: 2) {
            HStack(alignment: .top, spacing: 2) {
                Text(product.price.salePrice, format: .number.rounded(rule: .down, increment: 1.0))
                    .font(.system(size: 20, weight: .bold))
                if "\(product.price.salePrice)".suffix(1) != "0" {
                    Text("\(product.price.salePrice)".suffix(2))
                        .font(.system(size: 16, weight: .bold))
                        .padding(.top, 1)
                }
            }
            Image(.perAmountIcon)
        }
    }
}
