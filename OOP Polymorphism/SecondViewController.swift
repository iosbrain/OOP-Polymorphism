//
//  SecondViewController.swift
//  OOP Polymorphism
//
//  Created by Andrew Jaffee on 3/4/17.
//  Copyright © 2017 microIT Infrastructure, LLC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var textField: UITextView!

    // declare an instance of a child of the
    // base class IBInformationNetwork; the
    // child is specific to this UIViewController
    var cellularNetwork : IBCellularNetwork =
        IBCellularNetwork(providerName: "Phone Co, Inc.", bandwidth: 10, speed: 1)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)

        // NOTICE THAT THE PARENT "KNOWS" ABOUT THE CHILD VIA
        // LATE BINDING/POLYMORPHISM; WE CAN WRITE A BUNCH OF
        // NETWORK MODULES/CLASSES USING THE <<<PARENT>>> INSTANCE
        informationNetwork = cellularNetwork

        textField.alpha = 0.0
        
        UIView.animate(withDuration: 1.0)
        {
            self.textField.alpha = 1.0
            
            var infoText:String = ""
            infoText = informationNetwork.getProviderName() + "\n\n"
            infoText += informationNetwork.connect() + "\n\n"
            infoText += informationNetwork.sendData(data: "voice")
            self.textField.text = infoText
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

