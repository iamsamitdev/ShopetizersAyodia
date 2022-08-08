//
//  User.swift
//  Shopetizers
//
//  Created by Samit Koyom on 6/8/2565 BE.
//

import Foundation

struct User: Codable {
    var firstname           = ""
    var lastname            = ""
    var email               = ""
    var birthdate           = Date()
    var extraNapkins        = true
    var frequentRefills     = false
}
