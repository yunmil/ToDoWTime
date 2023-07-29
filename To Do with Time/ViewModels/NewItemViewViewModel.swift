//
//  NewItemViewViewModel.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = "" 
    @Published var dueDate = Date()
    @Published var showAlert = false


    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get a current User ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a model (instance)
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        // Save a model
        let db = Firestore.firestore()   //get an instance of our database
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        //86400 - # of seconds exist in a day
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
