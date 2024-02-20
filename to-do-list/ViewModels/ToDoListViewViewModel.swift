//
//  ToDoListViewViewModel.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import Foundation

class TodoListViewViewModel: ObservableObject {
	@Published var showingNewItemView: Bool = false
	
	init() {}
}
