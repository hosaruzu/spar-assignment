//
//  HorizontalProductCardView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct HorizontalProductCardView: View {
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
        VStack {
            HStack(alignment: .top, spacing: 16) {
                rightCardView
                leftCardView
            }
            .padding()
            rowSeparator
        }
    }
}

private extension HorizontalProductCardView {
    var productImageView: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
    }

    var rightCardView: some View {
        ZStack(alignment: .topLeading) {
            productImageView
            if let badge = product.badge {
                BadgeView(title: badge.type.rawValue, colorName: badge.color.rawValue)
            }
            if let saleAmount = product.saleAmount {
                SaleAmountView(saleAmount: saleAmount)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.trailing, 8)
            }
        }
        .frame(width: 144, height: 144)
    }

    var leftCardView: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                RatingView(
                    rating: product.rating,
                    testimonials: product.testimonialsCount,
                    showTestimonials: true)
                ProductNameView(name: product.name, country: product.country)
                    .frame(maxWidth: 167, alignment: .leading)
                Spacer()
                ValuePickerView(currentValue: $currentValue, isButtonPressed: $isButtonPressed)
                Spacer()
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
            ProductActionsView(isFavorite: product.isFavorite)
        }
        .frame(height: 144)
    }

    var rowSeparator: some View {
        Rectangle()
            .fill(.separator)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
    }
}


#Preview {
    Group {
        HorizontalProductCardView(product: Product.mockProducts()[0])
        HorizontalProductCardView(product: Product.mockProducts()[1])
    }
}
