//
//  RegisterViewViewModel.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    
    init() {}
    
    //creating an account entails creating a record in Firebase
    //1. Create an account in Authentication (Firebase)
    //2. Insert an information about the user (name, email...)
    
    func register() {
        guard validate() else {
            return
        }
        
        //Create a user
        //param: result is about user information
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            
        }
    }
    
    
    //create own model for a user
    //aka data object that represents user
    
    private func insertUserRecord(id:String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        //Codable comes in handy here 
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
 
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        
        return true
    }
    
    
}
