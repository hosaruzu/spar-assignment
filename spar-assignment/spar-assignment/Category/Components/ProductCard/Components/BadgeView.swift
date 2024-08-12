//
//  BadgeView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct BadgeView: View {
    var title: String
    var colorName: String

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

#Preview {
    BadgeView(title: "Sale", colorName: "BadgeRed")
}
