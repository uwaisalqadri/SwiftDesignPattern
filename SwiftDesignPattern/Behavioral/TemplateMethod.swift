//
//  TemplateMethod.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

class Room {
    open var cleaningSteps: [CleanRoomSteps] = []
    
    // Template method defines the sequence of steps to clean a room
    final func cleanRoom() {
        cleaningSteps.append(.enterRoom)
        tidyUp()
        cleanSpecificArea()
        cleaningSteps.append(.sweepFloor)
        cleaningSteps.append(.exitRoom)
    }
    
    enum CleanRoomSteps {
        case enterRoom
        case sweepFloor
        case exitRoom
        case tidyUp
        case cleanSpecificArea
    }
    
    open func tidyUp() {
        fatalError("Subclasses should implement this method.")
    }
    
    open func cleanSpecificArea() {
        fatalError("Subclasses should implement this method.")
    }
}

class Bedroom: Room {
    override func tidyUp() {
        cleaningSteps.append(.tidyUp)
        print("Making the bed and organizing the closet.")
    }
    
    override func cleanSpecificArea() {
        cleaningSteps.append(.cleanSpecificArea)
        print("Dusting shelves and nightstands.")
    }
}

class Kitchen: Room {
    override func tidyUp() {
        cleaningSteps.append(.tidyUp)
        print("Putting away dishes and cleaning countertops.")
    }
    
    override func cleanSpecificArea() {
        cleaningSteps.append(.cleanSpecificArea)
        print("Scrubbing the sink and stovetop.")
    }
}
