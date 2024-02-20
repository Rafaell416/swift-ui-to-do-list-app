//
//  ToDoListItemsView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct ToDoListView: View {
	@StateObject var viewModel = TodoListViewViewModel()
	
	private let userId: String
	
	init(userId: String) {
		self.userId = userId
	}
	
    var body: some View {
			NavigationView {
				VStack {
					Text("Hello, World!")
					Text("📍ToDoListView")
				}
				.navigationTitle("To Do List")
				.toolbar {
					Button {
						viewModel.showingNewItemView = true
					} label: {
						Image(systemName: "plus")
					}
				}.sheet(isPresented: $viewModel.showingNewItemView) {
					NewItemView(newItemPresented: $viewModel.showingNewItemView)
				}
			}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
			ToDoListView(userId: "1")
    }
}
