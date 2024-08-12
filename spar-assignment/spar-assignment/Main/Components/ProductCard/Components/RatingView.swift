//
//  RatingView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct RatingView: View {

    var rating: Double
    var testimonials: Int
    var showTestimonials: Bool

    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            Image(.starIcon)
            Text(rating, format: .number.rounded(increment: 0.1))
            if showTestimonials {
                Rectangle()
                    .frame(width: 1, height: 16)
                    .foregroundStyle(.secondary)
                Text("\(testimonials) отзывов")
                    .foregroundStyle(.secondary)
            }
        }
        .font(.system(size: 12))
    }
}

#Preview {
    RatingView(rating: 4.1, testimonials: 19, showTestimonials: true)
}
