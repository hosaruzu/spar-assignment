//
//  ProductNameView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ProductNameView: View {
    var name: String
    var country: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(name)
                .minimumScaleFactor(0.01)
            if let country {
                Text(country)
                    .foregroundStyle(.secondary)
            } else {
                Text("")
                    .opacity(0)
            }
        }
        .font(.system(size: 12))
    }
}

#Preview {
    ProductNameView(name: "Some name", country: "Russia")
}
