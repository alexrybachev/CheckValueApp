//
//  SliderUIKit.swift
//  CheckValueApp
//
//  Created by Aleksandr Rybachev on 13.06.2021.
//

import SwiftUI

struct SliderUIKit: UIViewRepresentable {
    
    @Binding var currentValue: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.tintColor = .darkGray
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueDidChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension SliderUIKit {
    class Coordinator: NSObject {
        
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func valueDidChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}

// MARK: - Preview
struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKit(currentValue: .constant(30), alpha: 5, color: .red)
    }
}
