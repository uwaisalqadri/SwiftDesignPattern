//
//  Observer.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol Subscriber {
    func update(newEdition: String)
    func subscribe(to newspaper: Newspaper)
    func unsubscribe(from newspaper: Newspaper)
}

protocol Newspaper {
    func subscribe(_ subscriber: Subscriber)
    func unsubscribe(_ subscriber: Subscriber)
    func notifyAllSubscribers()
}

class NewspaperPublisher: Newspaper {
    private var subscribers: [Subscriber] = []
    private var latestEdition: String = ""
    
    func subscribe(_ subscriber: any Subscriber) {
        subscribers.append(subscriber)
    }
    
    func unsubscribe(_ subscriber: any Subscriber) {
        subscribers.removeAll { $0 as AnyObject === subscriber as AnyObject }
    }
    
    func notifyAllSubscribers() {
        for subscriber in subscribers {
            subscriber.update(newEdition: latestEdition)
        }
    }
    
    func releaseNewEdition(_ edition: String) {
        latestEdition = edition
        notifyAllSubscribers()
    }
}

class RegularSubscriber: Subscriber {
    var isReceivedNewEdition = false
    
    func update(newEdition: String) {
        isReceivedNewEdition = !newEdition.isEmpty
    }
    
    func subscribe(to newspaper: any Newspaper) {
        newspaper.subscribe(self)
    }
    
    func unsubscribe(from newspaper: any Newspaper) {
        newspaper.unsubscribe(self)
    }
}

class PremiumSubscriber: Subscriber {
    var isReceivedNewEdition = false

    func update(newEdition: String) {
        isReceivedNewEdition = !newEdition.isEmpty
    }
    
    func subscribe(to newspaper: any Newspaper) {
        newspaper.subscribe(self)
    }
    
    func unsubscribe(from newspaper: any Newspaper) {
        newspaper.unsubscribe(self)
    }
}
