//
//  FireBaseUtil.swift
//  Elotero
//
//  Created by Chris Martinez on 6/24/19.
//  Copyright © 2019 Chris Martinez. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase


class FirebaseUtil{
    
    //connect to Database
    var ref :  DatabaseReference!

    

    //DB Connect Function
    func startDBConnect(){
        ref = Database.database().reference()
    }
    
    //DB Add to Users Function
    func DBAddVendor(user: Vendor){
        //
    self.ref.child("users").child(user.uid).setValue(user)
    }
    
    //DB Encrypt User Details
/* TODO: Encrypt User Data in AES */
    func DBEncryptSHA(user: Vendor) -> Vendor {
       var encryptedVendor : Vendor
        encryptedVendor = user
        //encrypt data from user:
        return encryptedVendor
    }
    
    //DB Remove function
    func DBRemoveVendor(user: Vendor){
       let childRef =  self.ref.child("users").child(user.uid).ref
        childRef.removeValue()
    }
    
    //remove 
    
}

