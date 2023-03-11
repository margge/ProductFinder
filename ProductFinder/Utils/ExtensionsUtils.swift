//
//  ExtensionsUtils.swift
//  ProductFinder
//
//  Created by Margge Guiza
//

import Foundation

extension Double {
    
    func formatAmmount() -> String {
        let amount = self.formatted(.currency(code: Constants.kCountryCode)
                                    .locale(Locale(identifier: Constants.kCountryIdentifier)))
        return String(amount)
    }
}
