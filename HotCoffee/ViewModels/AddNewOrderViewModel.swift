//
//  AddNewOrderViewModel.swift
//  HotCoffee
//
//  Created by Riad Mohamed on 12/24/20.
//

import Foundation

struct AddNewOrderViewModel {
    var name: String?
    var email: String?
    var type: String?
    var size: String?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
