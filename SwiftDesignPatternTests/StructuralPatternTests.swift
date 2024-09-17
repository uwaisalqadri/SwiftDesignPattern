//
//  StructuralPatternTests.swift
//  SwiftDesignPatternTests
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

import XCTest
@testable import SwiftDesignPattern

final class StructuralPatternTests: XCTestCase {
    
    func test_Adapter() {
        var fuelCar: FuelCar

        let electricCar = ElectricCar()
        fuelCar = ElectricToFuelCarAdapter(electricCar: electricCar)
        
        fuelCar.fillTank()
        
        XCTAssertTrue(fuelCar.isGasing)
    }
    
    func test_Bridge() {
        let ledTV = LEDTV()
        let lcdTV = LCDTV()
        
        let regularRemoteForLED = RegularRemote(tv: ledTV)
        regularRemoteForLED.power()
        regularRemoteForLED.setChannel(channel: 2)
        
        let advancedRemoteForLCD = AdvancedRemote(tv: lcdTV)
        advancedRemoteForLCD.power()
        advancedRemoteForLCD.setChannel(channel: 2)
        advancedRemoteForLCD.mute()
        
        XCTAssertTrue(ledTV.isOn)
        XCTAssertEqual(ledTV.currentChannel, 2)
        
        XCTAssertTrue(lcdTV.isOn)
        XCTAssertEqual(lcdTV.currentChannel, 2)
    }
    
    func test_Composite() {
        let soldier1 = Soldier(name: "John")
        let soldier2 = Soldier(name: "Doe")
        let soldier3 = Soldier(name: "Smith")
        let soldier4 = Soldier(name: "James")
        
        let squad1 = Squad()
        squad1.add(unit: soldier1)
        squad1.add(unit: soldier2)
        squad1.add(unit: soldier3)
        
        let squad2 = Squad()
        squad1.add(unit: soldier4)
        
        let platoon1 = Platoon()
        platoon1.add(unit: squad1)
        platoon1.add(unit: squad2)
        
        XCTAssertTrue(platoon1.report().contains(squad1.report() + squad2.report()))
    }
    
    func test_Decorator() {
        XCTAssertTrue(false)
    }
    
    func test_Facade() {
        XCTAssertTrue(false)
    }
    
    func test_Flyweight() {
        XCTAssertTrue(false)
    }
    
    func test_Proxy() {
        XCTAssertTrue(false)
    }
}
