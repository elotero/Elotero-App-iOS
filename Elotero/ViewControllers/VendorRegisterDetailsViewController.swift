//
//  VendorRegisterDetailsViewController.swift
//  Elotero
//
//  Created by Chris Martinez on 7/18/19.
//  Copyright © 2019 Chris Martinez. All rights reserved.
//

import UIKit
import Firebase

class VendorRegisterDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }
    
    
    var email : String = ""
    var password : String = ""
    
    var ref: DatabaseReference!
    var DBManager = DBManagerUtil()
    
    var handle: AuthStateDidChangeListenerHandle?
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var vendorNameTextField: UITextField!
    
    @IBAction func onSubmit(_ sender: Any) {
        //pass in the email / password functions
        guard
            let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let vendorName = vendorNameTextField.text
            else {
                return
        }
        
        //create new user:
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // ...
            //Automatically Sign In
            
            Auth.auth().signIn(withEmail: self.email, password: self.password) { [weak self] user, error in
                guard let strongSelf = self else { return }
                // ...
                //Create Database information based on uid
                let uid = Auth.auth().currentUser?.uid
                //vendor data
                var vendorData : [String : Any] =
                    [
                        "email" : self!.email,
                        "password" : self!.password,
                        "firstName" : self!.firstNameTextField!.text,
                        "lastName" : self!.lastNameTextField!.text,
                        "vendorName" : self!.vendorNameTextField!.text
                ]
                
                //Create Vendor Object
                var newVendor = Vendor(VendorData: vendorData)
                
                //Write to DB
                self!.DBManager.DBAddVendor(vendor: newVendor)
            }
            
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
