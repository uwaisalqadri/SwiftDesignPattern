//
//  BehavioralPatternTests.swift
//  SwiftDesignPatternTests
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

import XCTest
@testable import SwiftDesignPattern

final class BehavioralPatternTests: XCTestCase {

    func test_ChainOfResponsibility() {
        let iPhone = iPhoneHandler()
        let iPad = iPadHandler()
        let macBook = MacBookHandler()
        
        iPhone.nextHandler = iPad
        iPad.nextHandler = macBook
        
        let issue1 = iPhone.handle(issue: "Battery")
        XCTAssertEqual(issue1, "iPhone handled the Battery issue.")
        
        let issue2 = iPhone.handle(issue: "Display")
        XCTAssertEqual(issue2, "iPad handled the Display issue.")
        
        let issue3 = iPhone.handle(issue: "Software")
        XCTAssertEqual(issue3, "MacBook handled the Software issue.")
        
        let issue4 = iPhone.handle(issue: "Camera")
        XCTAssertEqual(issue4, "Issue couldn't be handled.")
    }

    func test_Command() {
        let chef = Chef()
        let restaurant = Restaurant()
        
        let burgerOrder = BurderOrder(chef: chef)
        let pastaOrder = PastaOrder(chef: chef)
        let pizzaOrder = PizzaOrder(chef: chef)
        
        restaurant.takeOrder(burgerOrder)
        restaurant.takeOrder(pastaOrder)
        restaurant.takeOrder(pizzaOrder)
        
        restaurant.serveAllOrders()
        
        XCTAssertEqual(restaurant.orderStatuses, [burgerOrder.execute(), pastaOrder.execute(), pizzaOrder.execute()])
    }

    func test_Iterator() {
        let friendsList = FriendsList()
        
        friendsList.addFriend(Friend(name: "John Doe", profileId: "john_doe"))
        friendsList.addFriend(Friend(name: "Jane Smith", profileId: "jane_smith"))
        friendsList.addFriend(Friend(name: "Mike Johnson", profileId: "mike_johnson"))

        let iterator = friendsList.createIterator()
        
        while iterator.hasNext() {
            if let friend = iterator.next(), friend.profileId == "mike_johnson" {
                XCTAssertTrue(true)
            }
        }
    }

    func test_Mediator() {
        XCTAssertTrue(false)
    }

    func test_Memento() {
        let clipboardManager = ClipboardManager()
        
        clipboardManager.copy("Hello, world!")
        clipboardManager.copy("Second copy")
        clipboardManager.copy("Third copy")
        
        clipboardManager.undo()
        XCTAssertEqual(clipboardManager.paste(), "Second copy")
        
        clipboardManager.redo()
        XCTAssertEqual(clipboardManager.paste(), "Third copy")
        
        clipboardManager.undo()
        clipboardManager.undo()
        XCTAssertEqual(clipboardManager.paste(), "Hello, world!")
    }

    func test_Observer() {
        let publisher = NewspaperPublisher()
        let regularSubscriber = RegularSubscriber()
        let premiumSubcriber = PremiumSubscriber()
        
        regularSubscriber.subscribe(to: publisher)
        premiumSubcriber.subscribe(to: publisher)
        
        publisher.releaseNewEdition("BREAKING NEWS")
        
        XCTAssertTrue(regularSubscriber.isReceivedNewEdition)
        XCTAssertTrue(premiumSubcriber.isReceivedNewEdition)
    }

    func test_State() {
        let lock = LockContext()
        
        lock.lock()
        XCTAssertNotNil(lock.currentState)
        XCTAssertTrue(lock.currentState is LockedState)
        
        lock.unlock()
        XCTAssertTrue(lock.currentState is UnlockedState)
        
        lock.lock()
        XCTAssertTrue(lock.currentState is LockedState)
        
        lock.unlock()
        XCTAssertTrue(lock.currentState is UnlockedState)
        
        lock.lock()
        XCTAssertTrue(lock.currentState is LockedState)
        
        lock.breakLock()
        XCTAssertTrue(lock.currentState is BrokenState)
    }

    func test_Strategy() {
        let catLover = CatLover(pet: Garfield())
        let tigerLover = CatLover(pet: Tiger())
        let lionLover = CatLover(pet: Lion())
        
        XCTAssertEqual(catLover.callingCat(), "MEOW")
        XCTAssertEqual(tigerLover.callingCat(), "WHAAARR")
        XCTAssertEqual(lionLover.callingCat(), "RAWR")
    }

    func test_TemplateMethod() {
        let bedroom = Bedroom()
        let kitchen = Kitchen()
        
        bedroom.cleanRoom()
        kitchen.cleanRoom()
        
        XCTAssertTrue(bedroom.cleaningSteps.contains(.tidyUp))
        XCTAssertTrue(kitchen.cleaningSteps.contains(.cleanSpecificArea))
    }

    func test_Visitor() {
        let agent = SpecificInsuranceAgent()
        
        let residentialBuilding = ResidentialBuilding()
        let bank = Bank()
        let coffeeShop = CoffeeShop()
        
        XCTAssertEqual(residentialBuilding.accept(agent), "Selling medical insurance to a residential building.")
        XCTAssertEqual(bank.accept(agent), "Selling theft insurance to a bank.")
        XCTAssertEqual(coffeeShop.accept(agent), "Selling fire and flood insurance to a coffee shop.")
    }
}
