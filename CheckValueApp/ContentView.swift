//
//  ContentView.swift
//  CheckValueApp
//
//  Created by Aleksandr Rybachev on 13.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 0.0
    @State private var alertIsPresented = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            HStack {
                Text("Подвиньте слайдер, как можно ближе к")
                Text("\(targetValue)")
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
            }
            
            HStack {
                Text("0")
                
                SliderUIKit(
                    currentValue: $currentValue,
                    alpha: computeScore(),
                    color: .red
                )
                
                Text("100")
            }
            
            ButtonView(
                alertIsPresented: $alertIsPresented,
                titleButton: "Проверь меня!",
                colorButton: .gray,
                currentScore: computeScore()) {
                alertIsPresented = true
            }
            
            ButtonView(
                titleButton: "Начать заново",
                colorButton: Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))) {
                targetValue = Int.random(in: 1...100)
            }
        }
        .padding()
    }
}

extension ContentView {
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
