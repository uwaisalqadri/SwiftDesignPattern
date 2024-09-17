//
//  Proxy.swift
//  SwiftDesignPattern
//
//  Created by Aleph-WQ05D on 15/09/24.
//

import Foundation

protocol Connection {
    func connection() -> String
}

class WifiConnection: Connection {
    func connection() -> String {
        return "Connected via Wifi"
    }
}

class CellularConnection: Connection {
    func connection() -> String {
        return "Connected via Cellular"
    }
}

class ConnectionProxy: Connection {
    private var wifi: WifiConnection?
    private var cellular: CellularConnection = CellularConnection()
    
    private var isWifiAvailable: Bool
    
    init(isWifiAvailable: Bool) {
        self.isWifiAvailable = isWifiAvailable
        if isWifiAvailable {
            wifi = WifiConnection()
        }
    }
    
    func connection() -> String {
        if let wifi = wifi {
            return wifi.connection()
        } else {
            return cellular.connection()
        }
    }
}
