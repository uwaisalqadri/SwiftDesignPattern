//
//  CreationalPatternTests.swift
//  CreationalPatternTests
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import XCTest
@testable import SwiftDesignPattern

final class CreationalPatternTests: XCTestCase {
    
    func test_FactoryMethod() {
        let chairFactory = ChairFactory()
        
        if let officeChair = chairFactory.createChair(type: .office) {
            XCTAssertTrue(officeChair is OfficeChair)
        }
    }
    
    func test_AbstractFactory() {
        let furnitureClient = FurnitureClient()
        let officeFurniture = furnitureClient.clientCode(factory: OfficeFurnitureFactory())
        let diningFurniture = furnitureClient.clientCode(factory: DiningFurnitureFactory())
        
        XCTAssertTrue([officeFurniture.chairDesc, officeFurniture.cutleryDesc].joined().contains("Office"))
        XCTAssertTrue([diningFurniture.chairDesc, diningFurniture.cutleryDesc].joined().contains("Dining"))
    }
    
    func test_Singleton() {
        Brain.shared.thoughtProcess = ""
        
        Brain.shared.decide()
        Brain.shared.plan()
        Brain.shared.thinking()
        
        let expectedThoughtProcess = "decided planned thinking "
        XCTAssertEqual(Brain.shared.thoughtProcess, expectedThoughtProcess, "Thought process did not match the expected sequence")
    }
    
    func test_BuilderPattern() {
        let home = Home.Builder()
            .addBathroom()
            .addSink()
            .addRooftop()
            .addGarage()
            .addStairs()
            .addTable()
            .build()
        
        home.love()
        home.live()
        home.laugh()
        
        XCTAssertTrue(
            home.builder.indoors.contains(where: { $0 is Sink })
        )
    }
}
