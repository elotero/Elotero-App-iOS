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
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    var ref: DatabaseReference!
    var DBManager = DBManagerUtil()
    
    var handle: AuthStateDidChangeListenerHandle?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollViewDidScroll(scrollView: scrollView)
        

        // Do any additional setup after loading the view.
    }
    
    /*
        WE NEED TO PASS EMAIL / PASSWORD WITH SEGUE FOR THE NEXT SCREEN
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is VendorRegisterDetailsViewController{
            let viewController = segue.destination as! VendorRegisterDetailsViewController
            viewController.email = emailTextField.text!
            viewController.password = passwordTextField.text!
        }
    }
    
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
