//
//  ValuePickerView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ValuePickerView: View {
    // MARK: - Properties

    @Binding var currentValue: Int
    @Binding var isButtonPressed: Bool

    // MARK: - Init

    init(currentValue: Binding<Int>, isButtonPressed: Binding<Bool>) {
        self._currentValue = currentValue
        self._isButtonPressed = isButtonPressed
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.secondaryLabel], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.label], for: .selected)
    }

    // MARK: - Body

    var body: some View {
        Picker("", selection: $currentValue) {
            Text("Шт").tag(0)
            Text("Кг").tag(1)
        }
        .pickerStyle(.segmented)
        .opacity(isButtonPressed ? 1 : 0)
    }
}

// MARK: - Preview

#Preview {
    ValuePickerView(currentValue: .constant(0), isButtonPressed: .constant(true))
}
