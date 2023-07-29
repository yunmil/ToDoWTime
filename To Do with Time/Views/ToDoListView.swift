//
//  ToDoListitemsView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 6/25/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    //we will have a query that continuousely listen to the item
    @FirestoreQuery var items: [ToDoListItem]
        
    // Put an userId to viewModel 
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        // assigned a viewmodel 
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                            .swipeActions {
                                Button {
                                    //delete
                                    viewModel.delete(id: item.id)
                                } label: {
                                    Text("Delete")
                                }
                                .tint(.red)

                    }
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            //adding a list 
            .toolbar {
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
            
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "YYATMpzBuJdpHxAzcDmbS80MvAA3")
    }
}
