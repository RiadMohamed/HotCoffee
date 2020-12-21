//
//  Order.swift
//  HotCoffee
//
//  Created by Riad Mohamed on 12/21/20.
//

import Foundation

enum CoffeeType: String, Codable {
    case vanilla
    case caramel
    case mocha
}
    
enum CoffeeSize: String, Codable {
    case small
    case medium
    case large
}

struct Order: Codable {
    let name: String
    let email: String
    let type: CoffeeType
    let size: CoffeeSize
}
