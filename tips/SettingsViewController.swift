//
//  SettingsViewController.swift
//  tips
//
//  Created by David Lee on 12/21/14.
//  Copyright (c) 2014 David Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultColorThemeButton: UISegmentedControl!
    @IBOutlet weak var defaultTipButton: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if(defaults.objectForKey("defaultTip") != nil) {
          var defaultTipValue = defaults.integerForKey("defaultTip")
        } else {
           defaults.setInteger(1, forKey: "defaultTip")
           var defaultTipValue = 1
        }
        println(defaults.objectForKey("defaultTip"))
        
        if(defaults.objectForKey("colorTheme") != nil) {
            var colorThemeValue = defaults.integerForKey("colorTheme")
        } else {
            defaults.setInteger(0, forKey: "colorTheme")
            var colorThemeValue = 1
        }
        defaults.synchronize()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDefaultTipChanged(sender: AnyObject) {
       NSUserDefaults.standardUserDefaults().setInteger(sender.selectedSegmentIndex, forKey: "defaultTip")
    }
    
    @IBAction func onColorThemeChanged(sender: AnyObject) {
       NSUserDefaults.standardUserDefaults().setInteger(sender.selectedSegmentIndex, forKey: "colorTheme")
    }

}
