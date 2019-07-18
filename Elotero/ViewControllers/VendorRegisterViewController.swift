//
//  RegisterViewController.swift
//  Elotero
//
//  Created by Chris Martinez on 6/9/19.
//  Copyright © 2019 Chris Martinez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VendorRegisterViewController: UIViewController {


    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var vendorNameTextField: UITextField!
    
    
    @IBAction func registerUser(_ sender: Any) {
        
        //register user
    }
    
    @IBOutlet weak var VendorCartName: UILabel!
    
    var ref: DatabaseReference!
    var DBManager = DBManagerUtil()
    
    var handle: AuthStateDidChangeListenerHandle?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        scrollViewDidScroll(scrollView: scrollView)
        
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmit(_ sender: Any) {
        
    guard
        //encrypt the data from the
        let email = emailTextField.text,
        let password = passwordTextField.text,
        let firstName = firstNameTextField.text,
        let lastName = lastNameTextField.text,
        let vendorName = vendorNameTextField.text
        else {
            return
        }
        
        print("BEFORE CREATING  USER")
        
        //create new user:
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // ...
            //Automatically Sign In
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                guard let strongSelf = self else { return }
                // ...
                //Create Database information based on uid
                let uid = Auth.auth().currentUser?.uid
                //vendor data
                var vendorData : [String : Any] =
                    [
                        "uid" : uid,
                        "email" : self!.emailTextField!.text,
                        "password" : self!.passwordTextField!.text,
                        "firstName" : self!.firstNameTextField!.text,
                        "lastName" : self!.lastNameTextField!.text,
                        "vendorName" : self!.vendorNameTextField!.text
                ]
                
                //Create Vendor Object
                var newVendor = Vendor(VendorData: vendorData)
                
                print("CREATED VENDOR")
                
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
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        handle =  Auth.auth().addStateDidChangeListener { (auth, user) in
    }
}
    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
