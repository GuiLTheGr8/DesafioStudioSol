//
//  LEDDisplayNum.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 30/03/22.
//
//  Mostra um algarismo em um painel de LED, com uma cor customizada.

import SwiftUI

struct LEDDisplayNum: View {
    
    private var top: Bool = true
    private var topLeft: Bool = true
    private var topRight: Bool = true
    private var middle: Bool = true
    private var bottomLeft: Bool = true
    private var bottomRight: Bool = true
    private var bottom: Bool = true
    
    private var color: Color = .orange
    
    init(number: Int, color: Color) {
        
        //Para cada algarismo, "acender" leds específicos
        switch number {
            
        case 0: top = true
                topLeft = true
                topRight = true
                middle = false
                bottomLeft = true
                bottomRight = true
                bottom = true
            
        case 1: top = false
                topLeft = false
                topRight = true
                middle = false
                bottomLeft = false
                bottomRight = true
                bottom = false
            
        case 2: top = true
                topLeft = false
                topRight = true
                middle = true
                bottomLeft = true
                bottomRight = false
                bottom = true
            
        case 3: top = true
                topLeft = false
                topRight = true
                middle = true
                bottomLeft = false
                bottomRight = true
                bottom = true
            
        case 4: top = false
                topLeft = true
                topRight = true
                middle = true
                bottomLeft = false
                bottomRight = true
                bottom = false
            
        case 5: top = true
                topLeft = true
                topRight = false
                middle = true
                bottomLeft = false
                bottomRight = true
                bottom = true
            
        case 6: top = true
                topLeft = true
                topRight = false
                middle = true
                bottomLeft = true
                bottomRight = true
                bottom = true
            
        case 7: top = true
                topLeft = false
                topRight = true
                middle = false
                bottomLeft = false
                bottomRight = true
                bottom = false
            
        case 8: top = true
                topLeft = true
                topRight = true
                middle = true
                bottomLeft = true
                bottomRight = true
                bottom = true
            
        case 9: top = true
                topLeft = true
                topRight = true
                middle = true
                bottomLeft = false
                bottomRight = true
                bottom = false
            
        default: top = false
                 topLeft = false
                 topRight = false
                 middle = false
                 bottomLeft = false
                 bottomRight = false
                 bottom = false
            
        }
        
        self.color = color
    }
    
    //Cada segmento é um retângulo padrão com bordas arredondadas.
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 60, height: 10)
                .cornerRadius(10)
                .foregroundColor(top ? color : Color.ledBG)
            HStack {
                Rectangle()
                    .frame(width: 10, height: 60)
                    .cornerRadius(10)
                    .foregroundColor(topLeft ? color : Color.ledBG)
                Spacer()
                Rectangle()
                    .frame(width: 10, height: 60)
                    .cornerRadius(10)
                    .foregroundColor(topRight ? color : Color.ledBG)
            }
            Rectangle()
                .frame(width: 60, height: 10)
                .cornerRadius(10)
                .foregroundColor(middle ? color : Color.ledBG)
            HStack {
                Rectangle()
                    .frame(width: 10, height: 60)
                    .cornerRadius(10)
                    .foregroundColor(bottomLeft ? color : Color.ledBG)
                Spacer()
                Rectangle()
                    .frame(width: 10, height: 60)
                    .cornerRadius(10)
                    .foregroundColor(bottomRight ? color : Color.ledBG)
            }
            Rectangle()
                .frame(width: 60, height: 10)
                .cornerRadius(10)
                .foregroundColor(bottom ? color : Color.ledBG)
        }
        .frame(width: 90, height: 180)
    }
}

struct LEDDisplayNum_Previews: PreviewProvider {
    static var previews: some View {
        LEDDisplayNum(number: 8, color: .orange)
    }
}
