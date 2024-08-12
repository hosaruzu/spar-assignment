//
//  ProductCardView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import SwiftUI

struct VerticalProductCardView: View {
    let product: Product

    @EnvironmentObject var cartManager: CartManager
    @State private var isButtonPressed = false
    @State private var isPlusButtonDisabled = false
    @State private var currentValue = 1

    init(product: Product) {
        self.product = product
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topLeading) {
                productImageView
                imageOverlayContentView
            }
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
        .onChange(of: isButtonPressed) { _, newValue in
            print(newValue)
            handleCart(product, condition: newValue)
        }
        .onAppear {
            isButtonPressed = !isProductUnique()
        }
        .frame(width: 168, height: 278)
        .shadow(color: .shadow.opacity(0.2), radius: 8)
    }
}

private extension VerticalProductCardView {
    var productImageView: some View {
        Image(product.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 168, height: 148)
    }

    var imageOverlayContentView: some View {
        VStack {
            HStack(alignment: .top) {
                if let badge = product.badge {
                    BadgeView(title: badge.type.rawValue, colorName: badge.color.rawValue)
                }
                Spacer()
                ProductActionsView(isFavorite: product.isFavorite)
            }
            Spacer()
            HStack {
                RatingView(rating: product.rating, testimonials: product.testimonialsCount, showTestimonials: false)
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
                .padding(.bottom, 5)
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

private extension VerticalProductCardView {
    func handleCart(_ product: Product, condition: Bool) {
        if condition && isProductUnique() {
            cartManager.addToCart(product)
        }
        if !condition {
            cartManager.removeFromCart(product)
        }
    }

    func isProductUnique() -> Bool {
        !cartManager.products.contains { $0.id == product.id }
    }
}

#Preview {
    HStack {
        VerticalProductCardView(product: Product.mockProducts()[0])
            .environmentObject(CartManager())
    }
}
