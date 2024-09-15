//
//  AbstractFactory.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol Cutlery {
    var material: String { get }
    func description() -> String
}

class OfficeCutlery: Cutlery {
    var material: String = "Metal"
    
    func description() -> String {
        return "This is an Office Cutlery made of \(material)."
    }
}

class DiningCutlery: Cutlery {
    var material: String = "Wood"
    
    func description() -> String {
        return "This is a Dining Cutlery made of \(material)."
    }
}

protocol FurnitureFactory {
    func createChair() -> Chair
    func createCutlery() -> Cutlery
}

class OfficeFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return OfficeChair()
    }
    
    func createCutlery() -> Cutlery {
        return OfficeCutlery()
    }
}

class DiningFurnitureFactory: FurnitureFactory {
    func createChair() -> Chair {
        return DiningChair()
    }
    
    func createCutlery() -> Cutlery {
        return DiningCutlery()
    }
}

struct FurnitureClient {
    func clientCode(factory: FurnitureFactory) -> (chairDesc: String, cutleryDesc: String) {
        let chair = factory.createChair()
        let cutlery = factory.createCutlery()
        
        return (chair.description(), cutlery.description())
    }
}
