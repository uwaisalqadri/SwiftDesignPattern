//
//  State.swift
//  SwiftDesignPattern
//
//  Created by Uwais Alqadri on 15/9/24.
//

import Foundation

protocol LockState {
    func unlock()
    func lock()
}

class LockedState: LockState {
    private let context: LockContext
    
    init(context: LockContext) {
        self.context = context
    }
    
    func unlock() {
        context.changeState(to: context.unlockedState)
        print("DEBUG: unlock")
    }
    
    func lock() {
        context.changeState(to: self)
        print("DEBUG: lock")
    }
}

class UnlockedState: LockState {
    private let context: LockContext
    
    init(context: LockContext) {
        self.context = context
    }
    
    func unlock() {
        context.changeState(to: self)
        print("DEBUG: unlock")
    }
    
    func lock() {
        context.changeState(to: context.lockedState)
        print("DEBUG: lock")
    }
}

class BrokenState: LockState {
    func unlock() {
        print("DEBUG: unlock")
    }
    
    func lock() {
        print("DEBUG: lock")
    }
}

class LockContext {
    var lockedState: LockState!
    var unlockedState: LockState!
    var brokenState: LockState!
    
    var currentState: LockState!
    
    init() {
        self.lockedState = LockedState(context: self)
        self.unlockedState = UnlockedState(context: self)
        self.brokenState = BrokenState()
        self.currentState = lockedState
    }
    
    func unlock() {
        currentState.unlock()
    }
    
    func lock() {
        currentState.lock()
    }
    
    func changeState(to newState: LockState) {
        currentState = newState
        print("Lock state changed \(newState).")
    }
    
    func breakLock() {
        changeState(to: brokenState)
    }
}
