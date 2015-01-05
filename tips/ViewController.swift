//
//  ViewController.swift
//  tips
//
//  Created by David Lee on 12/20/14.
//  Copyright (c) 2014 David Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalForTwo: UILabel!
    @IBOutlet weak var totalForThree: UILabel!
    @IBOutlet weak var totalForFour: UILabel!
    @IBOutlet weak var totalForFive: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        totalForTwo.text = "$0.00"
        totalForThree.text = "$0.00"
        totalForFour.text = "$0.00"
        totalForFive.text = "$0.00"
        var defaults = NSUserDefaults.standardUserDefaults()
        setColorTheme()
        
//        if(defaults.integerForKey("defaultTip") == 0) {
//            tipControl.selectedSegmentIndex = 0
//            println("no default set")
////                defaults.integerForKey("defaultTip") ?? 0
//        } else {
//            println("default set")
            tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
//        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setColorTheme()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        tipLabel.text = formatter.stringFromNumber(tip)
//        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = formatter.stringFromNumber(total)
        totalForTwo.text = formatter.stringFromNumber(total/2)
        totalForThree.text = formatter.stringFromNumber(total/3)
        totalForFour.text = formatter.stringFromNumber(total/4)
        totalForFive.text = formatter.stringFromNumber(total/5)
//        totalLabel.text = String(format:"$%.2f", total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func setColorTheme() {
        if NSUserDefaults.standardUserDefaults().integerForKey("defaultColor") == 1 {
            self.view.backgroundColor = UIColor(red: (34/255.0), green: (139/255.0), blue: (34/255.0), alpha: 1.0)
            self.view.tintColor = UIColor.whiteColor()
        } else {
            println("hi")
            self.view.backgroundColor = .whiteColor()
            self.view.tintColor = UIColor.grayColor()
        }
    }
   
}

