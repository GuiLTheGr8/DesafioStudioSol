//
//  LEDDisplayTriple.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 01/04/22.
//
//  Mostra 3 LEDDisplayNum para formar um display LED de 3 algarismos.

import SwiftUI

struct LEDDisplayTriple: View {
    
    private var digits: [Int] = []
    private var color: Color = .orange
    
    init(number: Int, color: Color) {
        if number >= 1000 {
            return
        }
        self.digits = number.getDigits()
        self.color = color
    }
    
    var body: some View {
        HStack {
            
            if digits.count > 0 {
                LEDDisplayNum(number: digits[0], color: color)
                if (digits.count > 1) {
                    LEDDisplayNum(number: digits[1], color: color)
                    if(digits.count > 2) {
                        LEDDisplayNum(number: digits[2], color: color)
                    }
                }
            }
            
        }
    }
}

struct LEDDisplayTriple_Previews: PreviewProvider {
    static var previews: some View {
        LEDDisplayTriple(number: 123, color: .orange)
    }
}
