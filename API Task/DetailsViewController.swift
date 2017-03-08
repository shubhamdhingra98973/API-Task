//
//  DetailsViewController.swift
//  API Task
//
//  Created by Sierra 4 on 06/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class DetailsViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var username:String?
    var password:String?
    var country:String?
    var city:String?
    var address:String?
    var phone:String?
    var email:String?
    var status:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnClick(_ sender: Any) {
        status = true
        username = txtName.text
        password = txtPassword.text
        country = txtCountry.text
        city = txtCity.text
        address = txtAddress.text
        phone = txtPhone.text
        email = txtEmail.text
        if !Validation.validateField(enum_name:.Name,enteredValue:txtName.text!)
        {
            status = false
            Alert.showAlert(Title:"Invalid",Des:"Invalid Name",obj:self ,status: false)
        }
            
        if !Validation.validateField(enum_name:.Email,enteredValue:txtEmail.text!)
        {
            status = false
            Alert.showAlert(Title:"Invalid",Des:"Invalid Email",obj:self,status: false)
        }
        
        if !Validation.validateField(enum_name:.Name,enteredValue:txtCountry.text!)
        {
            status = false
            Alert.showAlert(Title:"Invalid",Des:"Invalid Country",obj:self,status: false)
        }
        
        if !Validation.validateField(enum_name:.Name,enteredValue:txtCity.text!)
        {
            status = false
            Alert.showAlert(Title:"Invalid",Des:"Invalid City",obj:self,status: false)
        }
        if !Validation.validateField(enum_name:.Phone,enteredValue:txtPhone.text!)
        {
            status = false
            Alert.showAlert(Title:"Invalid",Des:"Invalid Phone Number",obj:self,status: false)
        }
        if !txtPassword.hasText
        {
            status = false
            Alert.showAlert(Title:"Invalid",Des:"Enter Password",obj:self,status: false)
        }
        
        if status == true
        {
            
            Alamofire.request("http://34.195.206.185/api/signup")
            self.performSegue(withIdentifier: "showDetailFromSignUp", sender: self)
            parseData()
            Alert.showAlert(Title:"Done",Des:"Registered Successfully",obj:self,status: true)
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "showDetailFromSignUp"
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
  
    func parseData()
    {
        let parameter:[String:Any] = ["username":username ?? "","email":email ?? "", "password":password ?? "", "phone" : phone ?? "", "country" : country ?? "", "city": city ?? "","address" : address ?? "", "flag": "1", "birthday":"04/06/1995", "country_code":"countryCode" ,"postal_code":"postalCode", "country_ios3":" country_ios3", "state":"state"]
        
        ApiHandler.fetchData(urlStr: "signup", parameters: parameter)
        {
            (jsonData) in
        
            print(jsonData ?? " ")
            let userModel = Mapper<User>().map(JSONObject: jsonData)
            self.password = userModel?.profile?.password ?? ""
            self.email = userModel?.profile?.emailId ?? ""
            self.address = userModel?.profile?.address ?? ""
            self.city = userModel?.profile?.city ?? ""
            self.country = userModel?.profile?.country ?? ""
            self.phone = userModel?.profile?.phone ?? ""
            self.username = userModel?.profile?.username ?? ""
            print(userModel?.profile?.emailId ?? "")
            print(userModel?.profile?.username ?? "")
            print(userModel?.profile?.phone ?? "")
            print(userModel?.profile?.country ?? "")
            print(userModel?.profile?.city ?? "")
            print(userModel?.profile?.address ?? "")
            print(userModel?.profile?.password ?? "")
        }
    }
   

}
