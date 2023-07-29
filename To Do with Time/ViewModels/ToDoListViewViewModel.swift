//
//  ToDoListViewViewModel.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import FirebaseFirestore
import Foundation

///ViewModel for list of items view
///Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    // Pass in userId to access db 
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete (id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
