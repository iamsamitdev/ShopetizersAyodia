//
//  StringValidate.swift
//  Shopetizers
//
//  Created by Samit Koyom on 6/8/2565 BE.
//

import Foundation

extension String {
    
    // Validate Email Pattern
    var isValidEmail: Bool {
        let emailFormat     =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate  =   NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    
}
