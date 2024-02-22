//
//  ToDoListViewViewModel.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import Foundation
import FirebaseFirestore
import Combine

class TodoListViewViewModel: ObservableObject {
	@Published var showingNewItemView: Bool = false
	@Published var items: [ToDoListItem] = []
	private var userId: String = ""
	private var db = Firestore.firestore()
	private var cancellables: Set<AnyCancellable> = []
	
	
	init(userId: String) {
		self.userId = userId
		fetchData(for: userId)
	}
	
	func fetchData(for userId: String) {
		db.collection("users/\(userId)/todos")
			.addSnapshotListener { snapshot, error in
				if let error = error {
					print("Error fetching documents: \(error)")
					return
				}
				
				guard let documents = snapshot?.documents else {
					print("No documents")
					return
				}
				
				self.items = documents.compactMap { document in
					do {
						return try document.data(as: ToDoListItem.self)
					} catch {
						print("Error decoding document: \(error)")
						return nil
					}
				}
			}
	}
	
	func deleteItem(itemId: String) {
		let db = Firestore.firestore()
		
		db
			.collection("users")
			.document(userId)
			.collection("todos")
			.document(itemId)
			.delete()
	}
}
