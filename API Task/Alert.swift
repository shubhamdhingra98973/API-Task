//
//  Alert.swift
//  API Task
//
//  Created by Sierra 4 on 06/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import UIKit
class Alert
{
    static func showAlert(Title : String , Des : String , obj:UIViewController , status:Bool)
    {
        let alert = UIAlertController(title:Title, message:Des ,preferredStyle: .alert)
        obj.present(alert, animated: true, completion: nil)
        let cancel = UIAlertAction(title: "OK", style: .default)
        {(action:UIAlertAction) in }
        alert.addAction(cancel)
        alert.view.tintColor = UIColor.brown  // change text color of the buttons
        alert.view.layer.cornerRadius = 25
        print("ALERT: \(status)")
        if status == false
        {
        alert.view.backgroundColor = UIColor.red
        }
        else
        {
        alert.view.backgroundColor = UIColor.green
        }
    }
}
