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
        if cartManager.products.isEmpty {
            Text("Корзина пуста")
        } else {
            List {
                ForEach(cartManager.products) { product in
                    CartRowView(product: product)
                        .swipeActions {
                            Button("Удалить из корзины") {
                                cartManager.removeFromCart(product)
                            }
                            .tint(.red)
                        }
                }
            }
        }
    }
}


#Preview {
    CartView()
        .environmentObject(CartManager())
}
