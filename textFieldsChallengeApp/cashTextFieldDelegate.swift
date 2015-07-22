//
//  cashTextFieldDelegate.swift
//  textFieldsChallengeApp
//
//  Created by Markus Willburn on 7/17/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import Foundation
import UIKit

class cashTextFieldDelegate: NSObject, UITextFieldDelegate{
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var priorText = textField.text as NSString
        var currentText = priorText.stringByReplacingCharactersInRange(range, withString: string)
        var newText = String(currentText)

    
        textField.text = (Double((newText as String).numbersOnly.integerValue) / 100).decimalPlaces
        
        return false
    }
        
}
    
extension String{
        
        var numbersOnly: String{
        
            return "".join(componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet))
        }
        
        var integerValue: Int{
            
            return NSString(string: self).integerValue
            
        }
        
    }
    
    
    
extension Double{
    
    var decimalPlaces: String{
        
        let formatter = NSNumberFormatter()
        
        formatter.numberStyle = .CurrencyStyle
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter.stringFromNumber(self)!
    
    
        }
    }

    //UITextFieldDelegate method that acts upon pressing keyboard return key
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true;
    }
    