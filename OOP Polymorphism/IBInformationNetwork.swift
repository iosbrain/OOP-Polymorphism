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
    
    // this is the default constructor
    //
    // if we tried an instantiation like so:
    //
    // var network : IBInformationNetwork = IBInformationNetwork()
    //
    // then we'd get this error:
    // "Missing argument for parameter 'providerName' in call"
    //
    //
    init( providerName:String, bandwidth:Int, speed:Int )
    {
        self.providerName = providerName
        self.bandwidth = bandwidth
        self.speed = speed
        self.transmissionTech = "wired"
        self.infoString = ""
    }
    
    // connection functionality for a simple
    // wired network
    func connect() -> String
    {
        infoString = "Establishing a \(transmissionTech) connection with bandwidth \(bandwidth)MB at speed \(speed)MB/s..."
        return infoString
    }
    
    // data sending functionality for a simple
    // wired network
    func sendData( data:String ) -> String
    {
        infoString = "Sending [\(data)] data over \(transmissionTech)..."
        return infoString
    }
    
    // a utility inherited by all subclasses
    func getProviderName() -> String
    {
        return "Provider: " + providerName
    }
    
} // end class IBInformationNetwork

// a child for Wi-Fi networking, extending the base
// class for basic/common networking
class IBWifiNetwork: IBInformationNetwork
{
    
    // uses code in the parent and peforms function
    // specialized to this class
    override init( providerName:String, bandwidth:Int, speed:Int )
    {
        super.init(providerName: providerName, bandwidth: bandwidth, speed: speed)
        self.transmissionTech = "Wi-Fi"
    }
    
    // uses code in the parent and peforms functions
    // specialized to this class, i.e., specific to Wi-Fi
    override func connect() -> String
    {
        infoString = super.connect() + "\n\n"
        infoString += "Performing Wi-Fi data link setup..."
        return infoString
    }
    
    // uses code in the parent and peforms functions
    // specialized to this class, i.e., specific to Wi-Fi
    override func sendData(data: String) -> String
    {
        infoString = super.sendData(data: data) + "\n\n"
        
        for index in data.characters.indices
        {
            infoString += String(data[index]) + " )... "
        }
        
        return infoString
    }
    
} // end class IBWifiNetwork

// a child for cellular networking, extending the base
// class for basic/common networking
class IBCellularNetwork: IBInformationNetwork
{
    
    // uses code in the parent and peforms function
    // specialized to this class
    override init( providerName:String, bandwidth:Int, speed:Int )
    {
        super.init(providerName: providerName, bandwidth: bandwidth, speed: speed)
        self.transmissionTech = "cellular"
    }
    
    // uses code in the parent and peforms functions
    // specialized to this class, i.e., specific to cellular
    override func connect() -> String
    {
        infoString = super.connect() + "\n\n"
        infoString += "Performing cellular  data link setup..."
        return infoString
    }
    
    // uses code in the parent and peforms functions
    // specialized to this class, i.e., specific to cellular
    override func sendData(data: String) -> String
    {
        infoString = super.sendData(data: data) + "\n\n"
        
        for index in data.characters.indices
        {
            infoString += String(data[index]) + " >... "
        }
        
        return infoString
    }
    
} // end class IBCellularNetwork
