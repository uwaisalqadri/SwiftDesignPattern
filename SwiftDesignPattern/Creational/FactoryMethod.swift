//
//  FactoryMethod.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol Chair {
    var material: String { get }
    var hasLegs: Bool { get }
    var hasBackSupport: Bool { get }
    
    func description() -> String
}

class OfficeChair: Chair {
    var material: String = "Leather"
    var hasLegs: Bool = true
    var hasBackSupport: Bool = true
    
    func description() -> String {
        return "This is an Office Chair made of \(material)."
    }
}

class DiningChair: Chair {
    var material: String = "Wood"
    var hasLegs: Bool = true
    var hasBackSupport: Bool = false
    
    func description() -> String {
        return "This is a Dining Chair made of \(material)."
    }
}

class RockingChair: Chair {
    var material: String = "Wood"
    var hasLegs: Bool = false // Rockers instead of legs
    var hasBackSupport: Bool = true
    
    func description() -> String {
        return "This is a Rocking Chair made of \(material) with back support."
    }
}

class ChairFactory {
    enum ChairType {
        case office
        case dinning
        case rocking
    }
    
    func createChair(type: ChairType) -> Chair? {
        switch type {
        case .office:
            return OfficeChair()
        case .dinning:
            return DiningChair()
        case .rocking:
            return RockingChair()
        }
    }
}
