//
//  ProductActionsView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductActionsView: View {
    @State var isFavorite: Bool = false

    var body: some View {
        VStack {
            Button { } label: {
                Image(.infoIcon)
            }
            .frame(width: 32, height: 32)
            Button {
                isFavorite.toggle()
            } label: {
                Image(isFavorite ? .heartIconFill : .heartIcon)
            }
            .frame(width: 32, height: 32)
        }
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(.white.opacity(0.8))
        )
    }
}

#Preview {
    ZStack {
        Color.primary
        ProductActionsView()
    }
}
