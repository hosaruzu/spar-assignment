//
//  ProductActionsView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductActionsView: View {
    // MARK: - Properties

    @State private var isFavorite: Bool = false

    // MARK: - Init

    init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }

    // MARK: - Body

    var body: some View {
        VStack {
            infoButton
            favoriteButton
        }
        .background(backgroundView)
    }
}

// MARK: - Subviews

private extension ProductActionsView {
    var infoButton: some View {
        Button { } label: {
            Image(.infoIcon)
        }
        .frame(width: 32, height: 32)
    }

    var favoriteButton: some View {
        Button {
            isFavorite.toggle()
        } label: {
            Image(isFavorite ? .heartIconFill : .heartIcon)
        }
        .frame(width: 32, height: 32)
    }

    var backgroundView: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(.white.opacity(0.8))
    }
}

#Preview {
    ZStack {
        Color.primary
        ProductActionsView(isFavorite: true)
    }
}
