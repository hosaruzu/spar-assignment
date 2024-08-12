//
//  RatingView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct RatingView: View {
    // MARK: - Properties

    private let rating: Double
    private let testimonials: Int
    private let showTestimonials: Bool

    // MARK: - Init

    init(
        rating: Double,
        testimonials: Int,
        showTestimonials: Bool
    ) {
        self.rating = rating
        self.testimonials = testimonials
        self.showTestimonials = showTestimonials
    }

    // MARK: - Body

    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            starRating
            if showTestimonials {
                testimonialsView
            }
        }
        .font(.system(size: 12))
    }
}

// MARK: - Subviews

private extension RatingView {
    var starRating: some View {
        HStack {
            Image(.starIcon)
            Text(rating, format: .number.rounded(increment: 0.1))
        }
    }

    var testimonialsView: some View {
        HStack(spacing: 5) {
            Rectangle()
                .frame(width: 1, height: 16)
                .foregroundStyle(.secondary)
            Text("\(testimonials) отзывов")
                .foregroundStyle(.secondary)
        }
    }
}

// MARK: - Preview

#Preview {
    RatingView(rating: 4.1, testimonials: 19, showTestimonials: true)
}
