//
//  MorePolyMorphViewController.swift
//  OOP Polymorphism
//
//  Created by Andrew Jaffee on 3/6/17.
//  Copyright © 2017 microIT Infrastructure, LLC. All rights reserved.
//

import UIKit

class MorePolyMorphViewController: UIViewController
{
    
    // this is an "outlet collection" (IBOutletCollection 
    // in Objective-C) and is connected to 4 controls
    @IBOutlet var multipleOutlets : [UIControl]!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Outlet collection access
    
    // this method demonstrates polymorphism, where a variable
    // of the parent type UIControl is assigned references to
    // instances of its child/subclass types
    @IBAction func enabledDisableControlsSwitchTapped(_ sender: Any)
    {
        let switchEnabledDisable = sender as! UISwitch
        
        if switchEnabledDisable.isOn
        {
            // assign different subtypes to the parent type
            for control in multipleOutlets
            {
                // access property common to the family
                // of classes
                control.isEnabled = true
                print("Control type: \(type(of: control))")
            }
        }
        else
        {
            // assign different subtypes to the parent type
            for control in multipleOutlets
            {
                // access property common to the family
                // of classes
                control.isEnabled = false
                print("Control type: \(type(of: control))")
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
