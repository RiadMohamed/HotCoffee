//
//  Order.swift
//  HotCoffee
//
//  Created by Riad Mohamed on 12/21/20.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
    case Vanilla
    case Caramel
    case Mocha
}
    
enum CoffeeSize: String, Codable, CaseIterable {
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

extension Order {
    static func create(VM: NewOrderViewModel) -> Resource<Order?> {
        let currentOrder = Order(VM)
        
        guard let url = URL(string: K.ordersURL) else {
            fatalError("Cant create url.")
        }
        
        guard let data = try? JSONEncoder().encode(currentOrder) else {
            fatalError("Cant encode the new order.")
        }
        
        var orderResource = Resource<Order?>(url: url)
        orderResource.body = data
        orderResource.http = .post
        return orderResource
    }
}

extension Order {
    init?(_ newOrderVM: NewOrderViewModel) {
        guard let name = newOrderVM.name,
              let email = newOrderVM.email,
              let type = CoffeeType(rawValue: newOrderVM.type!.capitalized),
              let size = CoffeeSize(rawValue: newOrderVM.size!.capitalized)
        else {
            print("Cant create an Order instance from the newOrderVM")
            return nil
        }
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
}
