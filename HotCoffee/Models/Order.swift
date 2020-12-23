//
//  Order.swift
//  HotCoffee
//
//  Created by Riad Mohamed on 12/21/20.
//

import Foundation

enum CoffeeType: String, Codable {
    case Vanilla
    case Caramel
    case Mocha
}
    
enum CoffeeSize: String, Codable {
    case Small
    case Medium
    case Large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
