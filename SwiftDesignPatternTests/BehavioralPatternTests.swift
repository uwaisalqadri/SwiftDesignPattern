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
        XCTAssertTrue(false)
    }

    func test_Iterator() {
        XCTAssertTrue(false)
    }

    func test_Mediator() {
        XCTAssertTrue(false)
    }

    func test_Memento() {
        XCTAssertTrue(false)
    }

    func test_Observer() {
        XCTAssertTrue(false)
    }

    func test_State() {
        XCTAssertTrue(false)
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
        XCTAssertTrue(false)
    }

    func test_Visitor() {
        XCTAssertTrue(false)
    }
}
