//
//  SliderPopUp.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 02/04/22.
//
//  Mostra um slider com valores e um step pré-setados

import SwiftUI

struct SliderPopUp: View {
    
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Slider(value: $value, in: 0.4...1.0, step: 0.1)
        }.frame(width: 150, height: 50)
            .background(Color.ledBG)
            .cornerRadius(10)
            .shadow(radius: 2)
    }
}
