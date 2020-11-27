//
//  NumberSupport.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/26/20.
//

import Foundation

class NumberSupport {
    static func sanitize(value: String) -> String {
        let noPercentageSymbols = value.replacingOccurrences(of: "%", with: "")
        
        let formatter = NumberFormatter.currency
        let noCurrencySymbols = noPercentageSymbols.replacingOccurrences(of: formatter.currencySymbol, with: "")
        
        let noCommas = noCurrencySymbols.replacingOccurrences(of: ",", with: "")
        
        return noCommas
    }
}

extension NumberFormatter {
    class var currency: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale.current
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }
}
