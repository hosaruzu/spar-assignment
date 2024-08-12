//
//  SaleAmountView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct SaleAmountView: View {
    // MARK: - Properties

    private let saleAmount: Int

    // MARK: - Init

    init(saleAmount: Int) {
        self.saleAmount = saleAmount
    }

    // MARK: - Body

    var body: some View {
        Text(saleAmount, format: .percent)
            .foregroundStyle(.saleRed)
            .font(.system(size: 16, weight: .bold))
    }
}

// MARK: - Preview

#Preview {
    SaleAmountView(saleAmount: 25)
}
