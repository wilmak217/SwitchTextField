//
//  ViewController.swift
//  textFieldsChallengeApp
//
//  Created by Markus Willburn on 7/17/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //Outlets variables declarations
    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var cashField: UITextField!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textSwitch: UISwitch!

    
    // App Life Cycle Methods and functionality
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Setting of initial state of third text field and switch
        self.textField.enabled = false
        self.textSwitch.on = false
        
        //Initializer function that sets the Delegates
        initiateTextFields()
        
    }
    
    func initiateTextFields(){
      
        //Delegates local variable assignments to text fields outlet variables
        let zipCodeFieldDelegate = self.zipcodeField
        let cashFieldDelegate = self.cashField
        self.textField.delegate = self
    
    }

    // Third text field parameter field setting action method
    @IBAction func onOffSwitch(sender: UISwitch) {
        
        if textSwitch.on {
            
            self.textField.enabled = true
            
        }
        else
        {
            
            self.textField.enabled = false
            
        }
        
    }
    
    // Text Field Delegate Methods
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
    
        if count(string) == 0{
            
            return true
        }
        
        let newString = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        switch textField{
        
        case zipcodeField:
            
            return newString.containsOnlyCharactersIn("0123456789") &&
                count(newString) <= 5
        
        case cashField:
        
            /*let currency = NSLocale.currentLocale().objectForKey(NSLocaleDecimalSeparator) as! String*/
            let currency = cashTextFieldDelegate()
            return true
            
        default:
        
            return true
        
        }
        
    }

    //UITextFieldDelegate method that acts upon pressing keyboard return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }

}

