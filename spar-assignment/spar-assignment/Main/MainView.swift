//
//  MainView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

private enum ViewType {
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
    // MARK: - Properties

    @StateObject var cartManager = CartManager()
    @StateObject var viewModel = MainViewModel()
    @State private var viewMode = ViewType.grid

    // MARK: - Body

    var body: some View {
        Group {
            if viewMode == .grid {
                ProductsGridView(products: viewModel.products)
                    .environmentObject(cartManager)
            } else {
                ProductsListView(products: viewModel.products)
                    .environmentObject(cartManager)
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

// MARK: - Subviews

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
        NavigationLink(destination: CartView().environmentObject(cartManager)) {
            ZStack {
                Image(.cartIcon)
                    .renderingMode(.template)
                    .foregroundStyle(.accent)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.navigationButtonBackground)
                            .frame(width: 40, height: 40)
                    )
                    .overlay(
                        Text("\(cartManager.products.count)")
                            .font(.system(size: 12))
                            .foregroundStyle(cartManager.products.isEmpty ? .clear : .white)
                            .frame(width: 20, height: 20)
                            .background(cartManager.products.isEmpty ? .clear : .badgeRed)
                            .clipShape(Circle())
                            .offset(x: 12, y: -10)
                    )
            }
            .padding(.trailing, 16)
            .padding(.bottom, 4)
        }
    }
}


#Preview {
    NavigationStack {
        MainView()
            .environmentObject(CartManager())
    }
}
