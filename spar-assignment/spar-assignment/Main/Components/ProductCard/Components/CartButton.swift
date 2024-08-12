//
//  CartButton.swift
//  spar-assignment
//
//  Created by Artem Tebenkov on 12.08.2024.
//

import SwiftUI

struct CartButton: View {
    @Binding var isButtonPressed: Bool
    @Binding var isPlusButtonDisabled: Bool
    @State var amount = 0.1
    @State var calculatedPrice = 5.9

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(.accent)
                .frame(maxWidth: isButtonPressed ? .infinity : 48, maxHeight: 36)
            if isButtonPressed {
                HStack {
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
                    Spacer()
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
                    Spacer()
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
                .foregroundStyle(.white)
                .bold()
                .padding(.horizontal)
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

#Preview {
    Group {
        CartButton(isButtonPressed: .constant(false), isPlusButtonDisabled: .constant(false))
        CartButton(isButtonPressed: .constant(true), isPlusButtonDisabled: .constant(false))
    }
}
