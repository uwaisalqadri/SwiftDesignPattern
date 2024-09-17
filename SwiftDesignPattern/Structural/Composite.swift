//
//  Composite.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol MilitaryUnit {
    func report() -> String
}

class Soldier: MilitaryUnit {
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func report() -> String {
        return "\(Self.self) \(name) reporting"
    }
}

class Squad: MilitaryUnit {
    private var members: [MilitaryUnit] = []
    
    func add(unit: MilitaryUnit) {
        members.append(unit)
    }
    
    func report() -> String {
        members.map { $0.report() }.joined(separator: "\n")
    }
}

class Platoon: MilitaryUnit {
    private var squads: [MilitaryUnit] = []
    
    func add(unit: MilitaryUnit) {
        squads.append(unit)
    }
    
    func report() -> String {
        squads.map { $0.report() }.joined(separator: "\n")
    }
}
