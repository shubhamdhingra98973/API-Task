//
//  ViewController.swift
//  API Task
//
//  Created by Sierra 4 on 06/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import SVProgressHUD
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var button: UIButton!
    var flag = 0
    var email : String?
    var password : String?
    var username: String?
    var phone: String?
    var country: String?
    var city: String?
    var address: String?
    var toMatchEmail : String?
    var toMatchPassword : String?
    var segueFlag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
          button.layer.cornerRadius = 3
        }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "showDetailFromSignIn"
            {
                let showDatavc : DisplayController = segue.destination as! DisplayController
                showDatavc.addressSegueString = self.address
                showDatavc.emailSegueString = self.email
                showDatavc.passwordSegueString = self.password
                showDatavc.usernameSegueString = self.username
                showDatavc.phoneSegueString = self.phone
                showDatavc.countrySegueString = self.country
                showDatavc.citySegueString = self.city
            }
        }
    

    @IBAction func btnSignIn(_ sender: Any) {
        
        email = txtUserName.text
        let urlstr = "login"
        Alamofire.request("http://34.195.206.185/api/"+urlstr)
        SVProgressHUD.show()
        SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.native)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black)
        fetchData()

    }
    func fetchData()
    {
        print("Fetch Data")
        print("\(txtUserName.text)")
        let param:[String:Any] = ["email":txtUserName.text ?? "", "password":txtPassword.text ?? "", "flag": "1"]
        ApiHandler.fetchData(urlStr: "login", parameters: param)
        {
        
            (jsonData) in
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            self.password = userModel?.profile?.password ?? ""
            self.email = userModel?.profile?.emailId ?? ""
            self.address = userModel?.profile?.address ?? ""
            self.city = userModel?.profile?.city ?? ""
            self.phone = userModel?.profile?.phone ?? ""
            self.username = userModel?.profile?.username ?? ""
            self.toMatchEmail = self.email
            self.toMatchPassword = self.password
            self.country = userModel?.profile?.country ?? ""
            
           if((userModel?.profile?.country ?? "") != "")
            {
                self.performSegue(withIdentifier: "showDetailFromSignIn", sender: self)
            }
            else
            {
                SVProgressHUD.dismiss()
            Alert.showAlert(Title:"Invalid",Des:"Wrong Details",obj:self ,status:false)
           }
          SVProgressHUD.dismiss()
        }
    }

    @IBAction func btnClick(_ sender: UIButton) {
        
        if sender.isSelected
        {
            sender.setBackgroundImage(UIImage(named: "ic_check-1"), for: UIControlState.normal)
            
            sender.isSelected = false;
        }
        else
        {
            sender.setBackgroundImage(UIImage(named: "ic_uncheck"), for: UIControlState.normal)
            
            sender.isSelected = true;
        }
    }
    
    }




    

   



