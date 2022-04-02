//
//  Helpers.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 01/04/22.
//
//  Utilidades diversas.

import Foundation
import SwiftUI

extension Color {
    public static let darkBGColor = Color("DarkBGColor")
    public static let ledBG = Color("LedBG")
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

extension Int {

    func numberOfDigits() -> Int {
        if abs(self) < 10 {
            return 1
        } else {
            return 1 + (self/10).numberOfDigits()
        }
    }

    func getDigits() -> [Int] {
        let num = self.numberOfDigits()
        var tempNumber = self
        var digitList = [Int]()

        for i in (0..<num).reversed() {
            let divider = Int(pow(CGFloat(10), CGFloat(i)))
            let digit = tempNumber/divider
            digitList.append(digit)
            tempNumber -= digit*divider
        }
        return digitList
    }
}
