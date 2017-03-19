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
    
    @IBAction func enabledDisableControlsSwitchTapped(_ sender: Any)
    {
        let switchEnabledDisable = sender as! UISwitch
        
        if switchEnabledDisable.isOn
        {
            for control in multipleOutlets
            {
                control.isEnabled = true
                print("Control type: \(type(of: control))")
            }
        }
        else
        {
            for control in multipleOutlets
            {
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
