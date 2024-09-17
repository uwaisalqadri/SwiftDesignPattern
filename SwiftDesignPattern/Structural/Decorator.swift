//
//  Decorator.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol Snack {
    func description() -> String
    func cost() -> Double
}

class Cheetos: Snack {
    func description() -> String {
        return "Cheetos Snack"
    }
    
    func cost() -> Double {
        return 2.0
    }
}

class CheetosDecorator: Snack {
    private let decoratedSnack: Snack
    
    init(decoratedSnack: Snack) {
        self.decoratedSnack = decoratedSnack
    }
    
    func description() -> String {
        decoratedSnack.description()
    }
    
    func cost() -> Double {
        decoratedSnack.cost()
    }
}

class CheetosSpicyDecorator: CheetosDecorator {
    override func description() -> String {
        super.description() + " with Spicy"
    }
    
    override func cost() -> Double {
        super.cost() + 1.0
    }
}

class CheetosCheesyDecorator: CheetosDecorator {
    override func description() -> String {
        super.description() + " with Cheesy"
    }
    
    override func cost() -> Double {
        super.cost() + 4.0
    }
}
