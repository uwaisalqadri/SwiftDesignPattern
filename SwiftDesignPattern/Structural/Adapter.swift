//
//  Adapter.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

class FuelCar {
    var isGasing: Bool = false
    
    func fillTank() {
        isGasing = true
    }
}

class ElectricCar {
    var isCharging = false
    
    func chargingBattery() {
        isCharging = true
    }
}

class ElectricToFuelCarAdapter: FuelCar {
    var electricCar: ElectricCar
    
    init(electricCar: ElectricCar) {
        self.electricCar = electricCar
    }
    
    override var isGasing: Bool {
        get {
            return electricCar.isCharging
        }
        set {
            electricCar.isCharging = newValue
            super.isGasing = newValue
        }
    }
    
    override func fillTank() {
        electricCar.chargingBattery()
    }
}
