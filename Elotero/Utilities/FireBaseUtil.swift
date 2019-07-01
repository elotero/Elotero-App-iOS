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
    func DBAddVendor(vendor: Vendor){
        //
    self.ref.child("vendors").child(vendor.uid).setValue(vendor)
    }
    
    
    //DB Edit Vendor information
    func DBEditVendorInfo(vendor: Vendor){
        guard let key = self.ref.child("vendors").childByAutoId().key
            else { return }
        let update = [
            "uid" : vendor.uid,
            "firstName" : vendor.firstName,
            "lastName" : vendor.lastName,
            "email" : vendor.email,
            "vendorName" : vendor.vendorName
            ]
        let childUpdates = ["/vendors/\(key)" : update]
        ref.updateChildValues(childUpdates)
    }
    
    //DB Encrypt User Details
/* TODO: Encrypt User Data in AES */
    func DBEncryptSHA(vendor: Vendor) -> Vendor {
       var encryptedVendor : Vendor
        encryptedVendor = vendor
        //encrypt data from user:
        return encryptedVendor
    }
    
    //DB Remove function
    func DBRemoveVendor(vendor: Vendor){
       let childRef =  self.ref.child("users").child(vendor.uid).ref
        childRef.removeValue()
    }
    
    
    /* Careful with these functions */
    
    //DB Remove All Vendors
    func DBRemoveAllVendors(){
        let vendorRef = self.ref.child("vendors").ref
        vendorRef.removeValue()
    }
    
    //DB Remove All Consumers
    func DBRemoveAllConsumers(){
        let consumerRef = self.ref.child("users").ref
        consumerRef.removeValue()
    }
    
    
    
}

