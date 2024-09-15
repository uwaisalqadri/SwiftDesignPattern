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
        XCTAssertTrue(false)
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
