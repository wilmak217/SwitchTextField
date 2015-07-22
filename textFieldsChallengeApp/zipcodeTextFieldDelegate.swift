//
//  zipcodeTextFieldDelegate.swift
//  textFieldsChallengeApp
//
//  Created by Markus Willburn on 7/17/15.
//  Copyright (c) 2015 Markus Willburn. All rights reserved.
//

import Foundation

extension String{

func containsOnlyCharactersIn(compareCharacters: String) -> Bool{
    
    let characterSet = NSCharacterSet(charactersInString: compareCharacters).invertedSet
    
    return self.rangeOfCharacterFromSet(characterSet) == nil
    
   }
    
}
