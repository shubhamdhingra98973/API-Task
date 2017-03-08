//
//  Validation.swift
//  API Task
//
//  Created by Sierra 4 on 06/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import UIKit
enum ValidRegex:String
{
    case Name = "([A-Z][a-z]*)([\\s\\\'-][A-Z][a-z]*)*"
    case Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    //password Strength:Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character:
    case Password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    case Phone = "[0-9]{1,10}"
}


class Validation
{
    static func validateField(enum_name :ValidRegex , enteredValue:String) -> Bool
    {
        switch enum_name
        {
        case .Name:
            let Predicate = NSPredicate(format:"SELF MATCHES %@", ValidRegex.Name.rawValue)
            return Predicate.evaluate(with: enteredValue)
            
        case .Email:
            let Predicate = NSPredicate(format:"SELF MATCHES %@", ValidRegex.Email.rawValue)
            return Predicate.evaluate(with: enteredValue)
            
        case .Password:
            let Predicate = NSPredicate(format:"SELF MATCHES %@", ValidRegex.Password.rawValue)
            return Predicate.evaluate(with: enteredValue)
            
        case .Phone:
            if enteredValue.characters.count < 10
            {
            return false
            }
            else
            {
            let Predicate = NSPredicate(format:"SELF MATCHES %@", ValidRegex.Phone.rawValue)
            return Predicate.evaluate(with: enteredValue)
            }
        }
    }
    
       // Text Field is empty - show red border
}

