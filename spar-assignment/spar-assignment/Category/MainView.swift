//
//  MainView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

private enum ViewMode {
    case list
    case grid

    func icon() -> String {
        switch self {
        case .list: return "listIcon"
        case .grid: return "gridIcon"
        }
    }
}

struct MainView: View {
    @State private var viewMode = ViewMode.grid

    var body: some View {
        Group {
            if viewMode == .grid {
                ProductsGridView(products: Product.mockProducts())
            } else {
                ProductsListView(products: Product.mockProducts())
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                viewModeButton
            }
            ToolbarItem(placement: .topBarTrailing) {
                cartViewButton
            }
        }
    }
}

private extension MainView {
    var viewModeButton: some View {
        Button {
            withAnimation(.bouncy) {
                self.viewMode = self.viewMode == .grid ? .list : .grid
            }
        } label: {
            Image(viewMode.icon())
                .frame(width: 16, height: 16)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.navigationButtonBackground)
                        .frame(width: 40, height: 40)
                )
                .padding(.leading, 16)
                .padding(.bottom, 4)
        }
    }

    var cartViewButton: some View {
        Button {
            // add to cart action
        } label: {
            Image(.cartIcon)
                .renderingMode(.template)
                .foregroundStyle(.accent)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.navigationButtonBackground)
                        .frame(width: 40, height: 40)
                )
                .padding(.trailing, 16)
                .padding(.bottom, 4)
        }
    }
}


#Preview {
    NavigationStack {
        MainView()
    }
}
