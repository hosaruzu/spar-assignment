//
//  MainViewModel.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var products = Product.mockProducts()
}
