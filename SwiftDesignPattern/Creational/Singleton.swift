//
//  Singleton.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

struct Brain {
    static var shared = Brain()
    var thoughtProcess: String = ""
    
    private init() {}
    
    mutating func decide() {
        thoughtProcess += "decided "
    }
    
    mutating func plan() {
        thoughtProcess += "planned "
    }
    
    mutating func thinking() {
        thoughtProcess += "thinking "
    }
}
