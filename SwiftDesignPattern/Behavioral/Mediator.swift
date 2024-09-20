//
//  Mediator.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol AirportControlTower {
    func notify(plane: Plane, request: PlaneRequestType)
}


enum PlaneRequestType {
    case landing
    case takeOff
}

class Plane {
    let identifier: String
    private var controlTower: AirportControlTower?
    
    init(identifier: String) {
        self.identifier = identifier
    }
    
    func setControlTower(_ tower: AirportControlTower) {
        self.controlTower = tower
    }
    
    func requestLanding() {
        controlTower?.notify(plane: self, request: .landing)
    }
    
    func requestTakeOff() {
        controlTower?.notify(plane: self, request: .takeOff)
    }
    
    func land() {
        print("\(identifier) is landing.")
    }
    
    func takeOff() {
        print("\(identifier) is taking off.")
    }
    
    func wait() {
        print("\(identifier) is waiting for further instructions.")
    }
}

class ConcreteAirportControlTower: AirportControlTower {
    var planes: [Plane] = []
    private var isRunwayAvailable: Bool = true
    
    func registerPlane(_ plane: Plane) {
        plane.setControlTower(self)
        planes.append(plane)
    }
    
    func notify(plane: Plane, request: PlaneRequestType) {
        switch request {
        case .landing:
            if isRunwayAvailable {
                isRunwayAvailable = false
                plane.land()
                isRunwayAvailable = true
            } else {
                plane.wait()
            }
        case .takeOff:
            if isRunwayAvailable {
                isRunwayAvailable = false
                plane.land()
                isRunwayAvailable = true
            } else {
                plane.wait()
            }
        }
    }
}

extension Plane: Equatable {
    static func == (lhs: Plane, rhs: Plane) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
