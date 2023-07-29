//
//  To_Do_with_TimeApp.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/15/23.
//

import FirebaseCore
import SwiftUI


@main
struct To_Do_with_TimeApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
