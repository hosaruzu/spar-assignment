//
//  CartButton.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct CartButton: View {
    // MARK: - Properties

    @EnvironmentObject var cartManager: CartManager
    @Binding var isButtonPressed: Bool
    @Binding var isPlusButtonDisabled: Bool
    @State private var amount = 0.1
    @State private var calculatedPrice = 5.9

    // MARK: - Body

    var body: some View {
        ZStack {
            backgroundView
            if isButtonPressed {
                buttonActive
            } else {
                Image(.cartIcon)
            }
        }
        .onTapGesture {
            withAnimation {
                isButtonPressed = true
            }
        }
    }
}
// MARK: - Subviews

private extension CartButton {
    var backgroundView: some View {
        RoundedRectangle(cornerRadius: 40)
            .fill(.accent)
            .frame(maxWidth: isButtonPressed ? .infinity : 48, maxHeight: 36)
    }

    var buttonActive: some View {
        HStack {
            minusButon
            Spacer()
            amountView
            Spacer()
            plusButton
        }
        .foregroundStyle(.white)
        .bold()
        .padding(.horizontal)
    }

    var minusButon: some View {
        Button {
            if amount > 0.1 {
                amount -= 0.1
                calculatedPrice /= 2
                isPlusButtonDisabled = false
            } else if amount <= 0.1 {
                withAnimation {
                    isButtonPressed = false
                }
            }
        } label: {
            Image(systemName: "minus")
        }
    }

    var amountView: some View {
        VStack {
            HStack(spacing: 1) {
                Text(amount, format: .number.rounded(increment: 0.1))
                Text("кг")
            }
            HStack(spacing: 1) {
                Text("~")
                Text(calculatedPrice, format: .number.rounded(increment: 0.01))
                Text("₽")
            }
            .font(.system(size: 12, weight: .regular))
            .minimumScaleFactor(0.02)
        }
    }

    var plusButton: some View {
        Button {
            if amount < 2.0 {
                amount += 0.1
                calculatedPrice *= 2
            } else {
                isPlusButtonDisabled = true
            }
        } label: {
            Image(systemName: "plus")
        }
        .disabled(isPlusButtonDisabled)
    }
}

// MARK: - Preview

#Preview {
    Group {
        CartButton(isButtonPressed: .constant(false), isPlusButtonDisabled: .constant(false))
            .environmentObject(CartManager())
        CartButton(isButtonPressed: .constant(true), isPlusButtonDisabled: .constant(false))
            .environmentObject(CartManager())
    }
}
