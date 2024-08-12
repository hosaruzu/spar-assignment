//
//  CategoryView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 11.08.2024.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        ProductCardView(product: Product.mockProduct())
    }
}

#Preview {
    CategoryView()
}
