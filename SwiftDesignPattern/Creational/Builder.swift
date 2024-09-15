//
//  Builder.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

struct Rooftop {
    let type: String = "roof"
}

struct Stairs {
    let type: String = "stairs"
}

struct Table {
    let type: String = "table"
}

struct Bathroom {
    let type: String = "bathroom"
}

struct Sink {
    let type: String = "sink"
}

struct Garage {
    let type: String = "garage"
}

class Home {
    var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func live() {
        print("DEBUG: LIVE")
    }
    
    func love() {
        print("DEBUG: LOVE")
    }
    
    func laugh() {
        print("DEBUG: LAUGH")
    }
}

extension Home {
    class Builder {
        var indoors: [Any] = []
        var outdoors: [Any] = []
        
        func addRooftop() -> Self {
            let mutable = self
            mutable.outdoors.append(Rooftop())
            return mutable
        }
        
        func addStairs() -> Self {
            let mutable = self
            mutable.indoors.append(Stairs())
            return mutable
        }
        
        func addTable() -> Self {
            let mutable = self
            mutable.indoors.append(Table())
            return mutable
        }
        
        func addBathroom() -> Self {
            let mutable = self
            mutable.indoors.append(Bathroom())
            return mutable
        }
        
        func addSink() -> Self {
            let mutable = self
            mutable.indoors.append(Sink())
            return mutable
        }
        
        func addGarage() -> Self {
            let mutable = self
            mutable.indoors.append(Garage())
            return mutable
        }
        
        func build() -> Home {
            let home = Home(builder: self)
            (indoors + outdoors).forEach { furniture in
                print("DEBUG: \(furniture)")
            }
            return home
        }
    }
}
