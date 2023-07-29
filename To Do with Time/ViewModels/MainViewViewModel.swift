//
//  MainViewViewModel.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        //Whenever user signs in or signs out the @Published currentUserId will be triggered
        //that will update the view (ex: sign-in)
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
            
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
