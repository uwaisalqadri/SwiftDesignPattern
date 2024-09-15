//
//  AbstractFactory.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol Closet {
    var material: String { get }
    func description() -> String
}

class OfficeCloset: Closet {
    var material: String = "Metal"
    
    func description() -> String {
        return "This is an Office Closet made of \(material)."
    }
}

class DiningCloset: Closet {
    var material: String = "Wood"
    
    func description() -> String {
        return "This is a Dining Closet made of \(material)."
    }
}

protocol FurnitureFactory {
    func createChair() -> Chair
    func createCloset() -> Closet
}

class OfficeFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return OfficeChair()
    }
    
    func createCloset() -> Closet {
        return OfficeCloset()
    }
}

class DiningFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return DiningChair()
    }
    
    func createCloset() -> Closet {
        return DiningCloset()
    }
}

struct FurnitureClient {
    func clientCode(factory: FurnitureFactory) -> (chairDesc: String, closetDesc: String) {
        let chair = factory.createChair()
        let closet = factory.createCloset()
        
        return (chair.description(), closet.description())
    }
}
