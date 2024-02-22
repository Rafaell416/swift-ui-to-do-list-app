//
//  ToDoListItemViewViewModel.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 26/01/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class TodoListItemViewViewModel: ObservableObject {
	init() {}
	
	func toggle(for item: ToDoListItem) {
		guard let uId = Auth.auth().currentUser?.uid else {
			return
		}
		let newValue = !item.isDone
		
		let db = Firestore.firestore()
		db.collection("users")
			.document(uId)
			.collection("todos")
			.document(item.id)
			.updateData(["isDone": newValue])
	}
}
