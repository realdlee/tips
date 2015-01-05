//
//  SettingsViewController.swift
//  tips
//
//  Created by David Lee on 12/21/14.
//  Copyright (c) 2014 David Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipButton: UISegmentedControl!
    @IBOutlet weak var defaultColorThemeButton: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        NSUserDefaults.resetStandardUserDefaults()
        var defaults = NSUserDefaults.standardUserDefaults()

        let defaultTip = defaults.integerForKey("defaultTip")
        setColorTheme()
//        println(defaults.integerForKey("defaultTip"))
        defaultTipButton.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        defaultColorThemeButton.selectedSegmentIndex = defaults.integerForKey("defaultColor")
//        let defaultColor = defaults.objectForKey("defaultColor") ?? "light"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onDefaultTipChanged(sender: AnyObject) {
       NSUserDefaults.standardUserDefaults().setInteger(sender.selectedSegmentIndex, forKey: "defaultTip")
//        println(NSUserDefaults.standardUserDefaults().integerForKey("defaultTip"))
    }
    
    @IBAction func onColorThemeChanged(sender: AnyObject) {
       NSUserDefaults.standardUserDefaults().setInteger(sender.selectedSegmentIndex, forKey: "defaultColor")
        println(NSUserDefaults.standardUserDefaults().integerForKey("defaultColor"))
        setColorTheme()
    }
    
    func setColorTheme() {
        if NSUserDefaults.standardUserDefaults().integerForKey("defaultColor") == 1 {
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
            self.view.backgroundColor = UIColor(red: (34/255.0), green: (139/255.0), blue: (34/255.0), alpha: 1.0)
            self.view.tintColor = UIColor.whiteColor()
                }, nil)

        } else {
            UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: {
                self.view.backgroundColor = .whiteColor()
                self.view.tintColor = UIColor.grayColor()
            }, nil)
        }
    }

}
