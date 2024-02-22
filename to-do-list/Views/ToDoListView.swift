//
//  ToDoListItemsView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct ToDoListView: View {
	@StateObject var viewModel: TodoListViewViewModel
	
	init(userId: String) {
		self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
	}
	
	var body: some View {
		NavigationView {
			VStack {
				List(viewModel.items) { item in
					ToDoListItemView(item: item)
						.swipeActions {
							Button("Delete") {
								viewModel.deleteItem(itemId: item.id)
							}
							.tint(.red)
						}
				}
				.listStyle(PlainListStyle())
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
		ToDoListView(userId: "RfBhgLftMaOrikt4JIjWMHBBII93")
	}
}
