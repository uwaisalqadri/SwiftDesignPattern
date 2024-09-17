//
//  Facade.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

class FeedingSystem {
    var isFed = false
    
    func feedAnimal() {
        isFed.toggle()
        print("Feeding the cute animal with yummy food! 🥕")
    }
}

class PlayingSystem {
    var isPlayed = false
    
    func playWithAnimal() {
        isPlayed.toggle()
        print("Playing fetch with the cute animal! 🐾")
    }
}

class GroomingSystem {
    var isGroom = false
    
    func groomAnimal() {
        isGroom.toggle()
        print("Grooming the cute animal, making it fluffy and clean! ✨")
    }
}

class CuteAnimalClassFacade {
    private let feedingSystem: FeedingSystem
    private let playingSystem: PlayingSystem
    private let groomingSystem: GroomingSystem
    
    var isHappy: Bool {
        feedingSystem.isFed && playingSystem.isPlayed && groomingSystem.isGroom
    }
    
    init(feedingSystem: FeedingSystem, playingSystem: PlayingSystem, groomingSystem: GroomingSystem) {
        self.feedingSystem = feedingSystem
        self.playingSystem = playingSystem
        self.groomingSystem = groomingSystem
    }
    
    func careForAnimal() {
        print("Starting the cute animal care routine! 🐶🐱")
        feedingSystem.feedAnimal()
        playingSystem.playWithAnimal()
        groomingSystem.groomAnimal()
        print("The cute animal is happy and well-cared for! 🥰")
    }
}
