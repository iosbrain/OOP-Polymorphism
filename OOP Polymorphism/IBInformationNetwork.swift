//
//  InformationNetwork.swift
//  Message Box Demo
//
//  Created by Andrew Jaffee on 3/4/17.
//  Copyright © 2017 microIT Infrastructure, LLC. All rights reserved.
//

import Foundation

// the base class for networking
class IBInformationNetwork
{
    
    // all member variables are visible only within this file;
    // "fileprivate" is kinda like "protected" in C++; 
    // descendants can access these variables; if they were
    // "private," descendant classes couldn't see these
    fileprivate var providerName:String
    fileprivate var bandwidth:Int
    fileprivate var speed:Int
    fileprivate var transmissionTech:String
    fileprivate var infoString:String
    
    // default constructor
    init( providerName:String, bandwidth:Int, speed:Int )
    {
        self.providerName = providerName
        self.bandwidth = bandwidth
        self.speed = speed
        self.transmissionTech = "wired"
        self.infoString = ""
    }
    
    func connect() -> String
    {
        infoString = "IBInformationNetwork has \(transmissionTech) connect() implementation."
        return infoString
    }
    
    func sendData( data:String ) -> String
    {
        infoString = "IBInformationNetwork has transmission-agnostic sendData() implementation."
        return infoString
    }
    
    func getProviderName() -> String
    {
        return "Provider: " + providerName
    }
    
} // end class IBInformationNetwork

class IBWifiNetwork: IBInformationNetwork
{
    
    override init( providerName:String, bandwidth:Int, speed:Int )
    {
        super.init(providerName: providerName, bandwidth: bandwidth, speed: speed)
        self.transmissionTech = "Wi-Fi antenna"
    }
    
    override func connect() -> String
    {
        infoString = "Establishing a Wi-Fi connection with bandwidth \(bandwidth)MB at speed \(speed)MB/s..."
        return infoString
    }
    
    override func sendData(data: String) -> String
    {
        infoString = "Sending [\(data)] data over Wi-Fi via \(transmissionTech)..."
        return infoString
    }
    
} // end class IBWifiNetwork

class IBCellularNetwork: IBInformationNetwork
{
    
    override init( providerName:String, bandwidth:Int, speed:Int )
    {
        super.init(providerName: providerName, bandwidth: bandwidth, speed: speed)
        self.transmissionTech = "cell tower"
    }
    
    override func connect() -> String
    {
        infoString = "Establishing a cellular connection with bandwidth \(bandwidth)MB at speed \(speed)MB/s..."
        return infoString
    }
    
    override func sendData(data: String) -> String
    {
        infoString = "Sending [\(data)] data over cellular via \(transmissionTech)..."
        return infoString
    }
    
} // end class IBCellularNetwork
