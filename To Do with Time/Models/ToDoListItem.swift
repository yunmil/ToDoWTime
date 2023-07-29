//
//  ToDoListItem.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool //reason why it is 'var' - so we can mutate this
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
