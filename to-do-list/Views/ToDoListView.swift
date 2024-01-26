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
						print("nothing")
					} label: {
						Image(systemName: "plus")
					}
				}
			}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
			ToDoListView(userId: "1")
    }
}
