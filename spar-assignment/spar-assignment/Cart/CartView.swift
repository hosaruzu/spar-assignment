//
//  CartView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        Text("\(cartManager.products.count) items in cart")
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
