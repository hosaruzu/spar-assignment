//
//  ProductPricesView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductPricesView: View {

    // MARK: - Properties

    private let initialPrice: Double
    private let salePrice: Double

    @Binding var isButtonPressed: Bool

    // MARK: - Init

    init(
        initialPrice: Double,
        salePrice: Double,
        isButtonPressed: Binding<Bool>
    ) {
        self.initialPrice = initialPrice
        self.salePrice = salePrice
        self._isButtonPressed = isButtonPressed
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            priceWithSaleView
            initialPriceView
        }
        .opacity(isButtonPressed ? 0 : 1)
        .frame(width: isButtonPressed ? 0 : nil)
    }
}

// MARK: - Subviews

private extension ProductPricesView {
    var priceWithSaleView: some View {
        HStack(spacing: 2) {
            HStack(alignment: .top, spacing: 2) {
                Text(salePrice, format: .number.rounded(rule: .down, increment: 1.0))
                    .font(.system(size: 20, weight: .bold))
                if "\(salePrice)".suffix(1) != "0" {
                    Text("\(salePrice)".suffix(2))
                        .font(.system(size: 16, weight: .bold))
                        .padding(.top, 1)
                }
            }
            Image(.perAmountIcon)
        }
    }

    var initialPriceView: some View {
        Text(initialPrice, format: .number.rounded(increment: 0.01))
            .font(.system(size: 12))
            .foregroundStyle(.secondary)
            .strikethrough()
    }
}

#Preview {
    ProductPricesView(initialPrice: 199.99, salePrice: 199.00, isButtonPressed: .constant(false))
}
