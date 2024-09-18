//
//  Visitor.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol InsuranceAgent {
    func visit(residentialBuilding: ResidentialBuilding) -> String
    func visit(bank: Bank) -> String
    func visit(coffeeShop: CoffeeShop) -> String
}

protocol Building {
    func accept(_ visitor: InsuranceAgent) -> String
}

class ResidentialBuilding: Building {
    func accept(_ visitor: any InsuranceAgent) -> String {
        visitor.visit(residentialBuilding: self)
    }
}

class Bank: Building {
    func accept(_ visitor: any InsuranceAgent) -> String {
        visitor.visit(bank: self)
    }
}

class CoffeeShop: Building {
    func accept(_ visitor: any InsuranceAgent) -> String {
        visitor.visit(coffeeShop: self)
    }
}

class SpecificInsuranceAgent: InsuranceAgent {
    func visit(residentialBuilding: ResidentialBuilding) -> String {
        return "Selling medical insurance to a residential building."
    }
    
    func visit(bank: Bank) -> String {
        return "Selling theft insurance to a bank."
    }
    
    func visit(coffeeShop: CoffeeShop) -> String {
        return "Selling fire and flood insurance to a coffee shop."
    }
}
