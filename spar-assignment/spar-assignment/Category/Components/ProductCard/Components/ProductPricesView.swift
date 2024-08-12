//
//  ProductPricesView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductPricesView: View {
    var initialPrice: Double
    var salePrice: Double

    @Binding var isButtonPressed: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                HStack(alignment: .top, spacing: 0) {
                    Text(salePrice, format: .number.rounded(rule: .down, increment: 1.0))
                        .font(.system(size: 20, weight: .bold))
                    Text("\(salePrice)".suffix(2))
                        .font(.system(size: 16, weight: .bold))
                        .padding(.top, 1)
                }
                Image(.perAmountIcon)
            }
            Text(initialPrice, format: .number.rounded(increment: 0.01))
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
                .strikethrough()
        }
        .opacity(isButtonPressed ? 0 : 1)
        .frame(width: isButtonPressed ? 0 : nil)
    }
}

#Preview {
    ProductPricesView(initialPrice: 199.99, salePrice: 199.99, isButtonPressed: .constant(false))
}
