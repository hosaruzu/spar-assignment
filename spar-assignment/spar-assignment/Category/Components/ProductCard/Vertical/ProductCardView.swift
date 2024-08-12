//
//  ProductCardView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import SwiftUI

struct ProductCardView: View {
    let product: Product

    @State var isButtonPressed = false
    @State var isPlusButtonDisabled = false
    @State private var currentValue = 1

    init(product: Product) {
        self.product = product
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.secondaryLabel], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.label], for: .selected)
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                productImageView
                imageOverlayContentView
            }
            .frame(width: 168, height: 148)

            bottomContentView
        }
        .background(.white)
        .clipShape(
            .rect(
                topLeadingRadius: 16,
                bottomLeadingRadius: 20,
                bottomTrailingRadius: 20,
                topTrailingRadius: 16
            )
        )
        .frame(width: 168, height: 278)
        .shadow(color: .shadow.opacity(0.2), radius: 8)
    }
}

private extension ProductCardView {
    var productImageView: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 168)
    }

    var imageOverlayContentView: some View {
        VStack {
            HStack(alignment: .top) {
                if let badge = product.badge {
                    BadgeView(title: badge.type.rawValue, colorName: badge.color.rawValue)
                }
                Spacer()
                ProductActionsView()
            }
            Spacer()
            HStack {
                RatingView()
                Spacer()
                if let saleAmount = product.saleAmount {
                    SaleAmountView(saleAmount: saleAmount)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 4)
        }
    }

    var bottomContentView: some View {
        VStack(alignment: .leading, spacing: 0) {
            ProductNameView(name: product.name, country: product.country)
            ValuePickerView(currentValue: $currentValue, isButtonPressed: $isButtonPressed)

            HStack {
                ProductPricesView(
                    initialPrice: product.price.initial,
                    salePrice: product.price.salePrice,
                    isButtonPressed: $isButtonPressed)
                Spacer(minLength: 0)
                CartButton(isButtonPressed: $isButtonPressed, isPlusButtonDisabled: $isPlusButtonDisabled)
            }
            .frame(height: 36)
        }
        .padding(.horizontal, 8)
        .padding(.bottom, 8)
    }
}

#Preview {
    ProductCardView(product: Product.mockProduct())
}
