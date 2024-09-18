//
//  Command.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol OrderCommand {
    func execute() -> String
}

class Restaurant {
    private var orderQueue: [OrderCommand] = []
    var orderStatuses: [String] = []
    
    func takeOrder(_ order: OrderCommand) {
        orderQueue.append(order)
    }
    
    func serveAllOrders() {
        for order in orderQueue {
            orderStatuses.append(order.execute())
        }
        
        orderQueue.removeAll()
    }
}

class Chef {
    func prepareBurger() -> String {
        return "\(Self.self) is preparing a burger."
    }
    
    func preparePasta() -> String {
        return "\(Self.self) is preparing pasta."
    }
    
    func preparePizza() -> String{
        return "\(Self.self) is preparing pizza."
    }
}


class BurderOrder: OrderCommand {
    private let chef: Chef
    
    init(chef: Chef) {
        self.chef = chef
    }
    
    func execute() -> String {
        chef.prepareBurger()
    }
}

class PastaOrder: OrderCommand {
    private let chef: Chef
    
    init(chef: Chef) {
        self.chef = chef
    }
    
    func execute() -> String {
        chef.preparePasta()
    }
}

class PizzaOrder: OrderCommand {
    private let chef: Chef
    
    init(chef: Chef) {
        self.chef = chef
    }
    
    func execute() -> String {
        chef.preparePizza()
    }
}
