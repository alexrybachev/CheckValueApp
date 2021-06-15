//
//  ButtonViw.swift
//  CheckValueApp
//
//  Created by Aleksandr Rybachev on 13.06.2021.
//

import SwiftUI

struct ButtonView: View {
    @Binding var alertIsPresented: Bool
    
    let titleButton: String
    let colorButton: Color
    let currentScore: Int
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(titleButton)
                .font(.title)
                .foregroundColor(.white)
        }
        .frame(width: 260, height: 60)
        .background(colorButton)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
        )
        .alert(isPresented: $alertIsPresented) {
            Alert(
                title: Text("Your score"),
                message: Text("\(currentScore)")
            )
        }
    }
    
    init(alertIsPresented: Binding<Bool> = .constant(false),
         titleButton: String,
         colorButton: Color,
         currentScore: Int = 0,
         action: @escaping () -> Void) {
        self._alertIsPresented = alertIsPresented
        self.titleButton = titleButton
        self.colorButton = colorButton
        self.currentScore = currentScore
        self.action = action
    }
}

// MARK: - Preview
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(alertIsPresented: .constant(false),
                   titleButton: "title",
                   colorButton: .red,
                   currentScore: 10,
                   action: {})
    }
}
