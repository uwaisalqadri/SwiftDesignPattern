//
//  Strategy.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol Cat {
    func meow() -> String
}

struct Garfield: Cat {
    func meow() -> String {
        return "MEOW"
    }
}

struct Lion: Cat {
    func meow() -> String {
        return "RAWR"
    }
}

struct Tiger: Cat {
    func meow() -> String {
        return "WHAAARR"
    }
}

class CatLover {
    private let cat: Cat
    
    init(pet cat: Cat) {
        self.cat = cat
    }
    
    func callingCat() -> String {
        cat.meow()
    }
}
