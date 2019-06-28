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
    
    
    
    
    var ref: DatabaseReference!

    
    
    var handle: AuthStateDidChangeListenerHandle?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmit(_ sender: Any) {
        
        //encrypt the data from the
        let email = emailTextField.text
        let password = passwordTextField.text
        
        //create new user:
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            // ...
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

    
    
    override func viewDidAppear(_ animated: Bool) {
        handle =  Auth.auth().addStateDidChangeListener { (auth, user) in
    }
}
    override func viewDidDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
}
