//
//  Bridge.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol TV {
    var isOn: Bool { get }
    
    func turnOn()
    func turnOff()
    func changeChannel(to channel: Int)
    func mute()
}

extension TV {
    func mute() {}
}

protocol RemoteControl {
    func power()
    func setChannel(channel: Int)
}

class LEDTV: TV {
    var isOn = false
    var currentChannel: Int = 0
    
    func turnOn() {
        isOn = true
        print("LED TV is now ON.")
    }
    
    func turnOff() {
        isOn = false
        print("LED TV is now OFF.")
    }
    
    func changeChannel(to channel: Int) {
        currentChannel = channel
        print("LED TV changed to channel \(channel).")
    }
}

class LCDTV: TV {
    var isOn = false
    var currentChannel: Int = 0
    var isMuted = false
    
    func turnOn() {
        isOn = true
        print("LCD TV is now ON.")
    }
    
    func turnOff() {
        isOn = false
        print("LCD TV is now OFF.")
    }
    
    func changeChannel(to channel: Int) {
        currentChannel = channel
        print("LCD TV changed to channel \(channel).")
    }
}

class RegularRemote: RemoteControl {
    private var tv: TV
    
    init(tv: TV) {
        self.tv = tv
    }
    
    func power() {
        tv.isOn ? tv.turnOff() : tv.turnOn()
    }
    
    func setChannel(channel: Int) {
        tv.changeChannel(to: channel)
    }
}

class AdvancedRemote: RemoteControl {
    private var tv: TV
    
    init(tv: TV) {
        self.tv = tv
    }
    
    func power() {
        tv.isOn ? tv.turnOff() : tv.turnOn()
    }
    
    func setChannel(channel: Int) {
        tv.changeChannel(to: channel)
    }
    
    func mute() {
        tv.mute()
    }
}
