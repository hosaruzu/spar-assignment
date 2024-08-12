//
//  RatingView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack(alignment: .bottom, spacing: 4) {
            Image(.starIcon)
            Text("4.1")
                .font(.system(size: 12))
        }
    }
}

#Preview {
    RatingView()
}
