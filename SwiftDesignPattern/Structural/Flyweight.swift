//
//  Flyweight.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

enum Fabric: String {
    case cotton = "Cotton"
    case silk = "Silk"
    case denim = "Denim"
}

enum Color: String {
    case red = "Red"
    case blue = "Blue"
    case black = "Black"
}

class ClothingType {
    let fabric: Fabric
    let color: Color

    init(fabric: Fabric, color: Color) {
        self.fabric = fabric
        self.color = color
    }

    func describeType() -> String {
        return "\(fabric.rawValue), \(color.rawValue)"
    }
}


class ClothingFactory {
    private var clothingTypes: [String: ClothingType] = [:]
    
    func getClothingType(fabric: Fabric, color: Color) -> ClothingType {
        let key = "\(fabric.rawValue)-\(color.rawValue)"
        if let type = clothingTypes[key] {
            return type
        } else {
            let type = ClothingType(fabric: fabric, color: color)
            clothingTypes[key] = type
            return type
        }
    }
}

class Clothing {
    private let type: ClothingType // Shared state (Flyweight)
    private let size: String
    
    init(type: ClothingType, size: String) {
        self.type = type
        self.size = size
    }
    
    func describe() -> String {
        return "\(type.describeType()), size \(size)"
    }
}
