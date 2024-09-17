//
//  ChainOfResponsibility.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol DeviceHandler {
    var nextHandler: DeviceHandler? { get set }
    func handle(issue: String) -> String
}

class iPhoneHandler: DeviceHandler {
    var nextHandler: DeviceHandler?
    
    func handle(issue: String) -> String {
        if issue == "Battery" {
            return "iPhone handled the \(issue) issue."
        } else {
            return nextHandler?.handle(issue: issue) ?? "Issue couldn't be handled."
        }
    }
}

class iPadHandler: DeviceHandler {
    var nextHandler: DeviceHandler?
    
    func handle(issue: String) -> String {
        if issue == "Display" {
            return "iPad handled the \(issue) issue."
        } else {
            return nextHandler?.handle(issue: issue) ?? "Issue couldn't be handled."
        }
    }
}

class MacBookHandler: DeviceHandler {
    var nextHandler: DeviceHandler?
    
    func handle(issue: String) -> String {
        if issue == "Software" {
            return "MacBook handled the \(issue) issue."
        } else {
            return nextHandler?.handle(issue: issue) ?? "Issue couldn't be handled."
        }
    }
}

