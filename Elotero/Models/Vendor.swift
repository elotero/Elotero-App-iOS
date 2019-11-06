//
//  Vendor.swift
//  Elotero
//
//  Created by Chris Martinez on 6/24/19.
//  Copyright © 2019 Chris Martinez. All rights reserved.
//

import Foundation


class Vendor{
    
    
    //Vendor Attributes
    var uid : String
    var firstName : String
    var lastName : String
    var vendorName : String
    var email : String
    var password: String
    
    //initialize
    init(VendorData : [String : Any]){
        uid = VendorData["uid"] as? String ?? "No uid"
        firstName = VendorData["firstName"] as! String
        lastName = VendorData["lastName"] as! String
        vendorName = VendorData["vendorName"] as! String
        email = VendorData["email"] as! String
        password = VendorData["password"] as! String
    }
    
    
}
