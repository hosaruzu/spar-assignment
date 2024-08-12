//
//  SaleAmountView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct SaleAmountView: View {
    var saleAmount: Int

    var body: some View {
        Text(saleAmount, format: .percent)
            .foregroundStyle(.saleRed)
            .font(.system(size: 16, weight: .bold))
    }
}

#Preview {
    SaleAmountView(saleAmount: 25)
}
