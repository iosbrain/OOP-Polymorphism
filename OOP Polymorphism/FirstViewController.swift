//
//  FirstViewController.swift
//  OOP Polymorphism
//
//  Created by Andrew Jaffee on 3/4/17.
//  Copyright © 2017 microIT Infrastructure, LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController
{
    
    @IBOutlet weak var textField: UITextView!
    
    // declare an instance of a child of the
    // base class IBInformationNetwork; the
    // child is specific to this UIViewController
    var wifiNetwork : IBWifiNetwork =
        IBWifiNetwork(providerName: "WiFi, Inc.", bandwidth: 100, speed: 10)

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        // NOTICE THAT THE PARENT "KNOWS" ABOUT THE CHILD VIA
        // LATE BINDING/POLYMORPHISM; WE CAN WRITE EXTENSIBLE AND
        // MAINTAINABLE CODE BY USING THE <<<PARENT>>> INSTANCE
        // AS MUCH AS POSSIBLE WHEN WRITING OUR APPLICATION
        informationNetwork = wifiNetwork

        textField.alpha = 0.0
        
        UIView.animate(withDuration: 1.0)
        {
            self.textField.alpha = 1.0
            
            var infoText:String = ""
            infoText = informationNetwork.getProviderName() + "\n\n"
            infoText += informationNetwork.connect() + "\n\n"
            infoText += informationNetwork.sendData(data: "file")
            self.textField.text = infoText
        }

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     Navigation back to this view controller via unwind segue
     */
    @IBAction func unwindSegueFromMoreToWiFi(_ sender: UIStoryboardSegue)
    {
    }

}

