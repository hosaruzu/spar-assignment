//
//  ProductNameView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductNameView: View {
    // MARK: - Properties

    private let name: String
    private let country: String?

    // MARK: - Init

    init(
        name: String,
        country: String?
    ) {
        self.name = name
        self.country = country
    }

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            nameView
            countryView
        }
        .font(.system(size: 12))
    }
}

// MARK: - Subviews

private extension ProductNameView {
    var nameView: some View {
        Text(name)
            .minimumScaleFactor(0.01)
    }

    var countryView: some View {
        Text(country ?? "")
            .foregroundStyle(.secondary)
    }
}

#Preview {
    ProductNameView(name: "Some name", country: "Russia")
}
