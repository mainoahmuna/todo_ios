//
//  LoginViewViewModel.swift
//  todood
//
//  Created by Mainoah Muna on 6/29/24.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        //Try to log user in
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate () -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please Fill in All Fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please Enter Valid Email"
            return false
        }
        
        return true
    }
}
