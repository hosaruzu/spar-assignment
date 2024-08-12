//
//  ValuePickerView.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct ValuePickerView: View {
    @Binding var currentValue: Int
    @Binding var isButtonPressed: Bool

    var body: some View {
        Picker("What is your favorite color?", selection: $currentValue) {
            Text("Шт").tag(0)
            Text("Кг").tag(1)
        }
        .pickerStyle(.segmented)
        .opacity(isButtonPressed ? 1 : 0)
    }
}

#Preview {
    ValuePickerView(currentValue: .constant(0), isButtonPressed: .constant(true))
}
