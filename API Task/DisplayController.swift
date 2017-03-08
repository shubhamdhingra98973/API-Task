//
//  DisplayController.swift
//  API Task
//
//  Created by Sierra 4 on 06/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import UIKit

class DisplayController:UIViewController
{
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPassword: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var viewDetails: UIView!
    var username: String?
    var email: String?
    var password: String?
    var phone: String?
    var country: String?
    var city: String?
    var address: String?
    
    var emailSegueString : String?
    var passwordSegueString : String?
    var usernameSegueString: String?
    var phoneSegueString: String?
    var countrySegueString: String?
    var citySegueString: String?
    var addressSegueString: String?
    
    
    override func viewDidLoad() {
     
        lblName.text = usernameSegueString
        lblEmail.text = emailSegueString
        lblPassword.text = passwordSegueString
        lblAddress.text = addressSegueString
        lblCountry.text = countrySegueString
        lblCity.text = citySegueString
        lblPhone.text = phoneSegueString
        
self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
   viewDetails.backgroundColor = UIColor(patternImage: UIImage(named: "yellow_back")!)
    }
    

}
