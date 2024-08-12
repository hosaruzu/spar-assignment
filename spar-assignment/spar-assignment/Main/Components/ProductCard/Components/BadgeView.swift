//
//  BadgeView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct BadgeView: View {
    // MARK: - Properties

    private let title: String
    private let colorName: String

    // MARK: - Init

    init(
        title: String,
        colorName: String
    ) {
        self.title = title
        self.colorName = colorName
    }

    // MARK: - Body

    var body: some View {
        Text(title)
            .font(.system(size: 10))
            .foregroundStyle(.white)
            .padding(.vertical, 4)
            .padding(.leading, 12)
            .padding(.trailing, 6)
            .background(Color(colorName))
            .clipShape(
                .rect(
                    topLeadingRadius: 8,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 8,
                    topTrailingRadius: 8
                )
            )
    }
}

// MARK: - Preview

#Preview {
    BadgeView(title: "Sale", colorName: "BadgeRed")
}
