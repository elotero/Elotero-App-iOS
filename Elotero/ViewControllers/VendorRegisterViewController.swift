//
//  RegisterViewController.swift
//  Elotero
//
//  Created by Chris Martinez on 6/9/19.
//  Copyright © 2019 Chris Martinez. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSubmit(_ sender: Any) {
        
        //encrypt the data from the
        let username = usernameTextField.text
        let password = passwordTextField.text
        
        //check if data is valid
        
        let usernameData: Data! = username!.data(using: .utf8)
        let passData: Data! = password!.data(using: .utf8)
        
        var encodedName = sha256(data: usernameData)
        var encodedPass = sha256(data: passData)
        
        
    }
    
    
    
    
    func sha256(data : Data) -> Data {
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }
        return Data(hash)
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
        let handle =  Auth.auth().addStateDidChangeListener { (auth, user) in
    }
}
