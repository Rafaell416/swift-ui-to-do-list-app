//
//  RegisterViewViewModel.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
	@Published var name: String = ""
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var errorMessage: String = ""
	
	init(){
		
	}
		
	func register() {
		guard validate() else {
			return
		}
		
		Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
			guard let userId = result?.user.uid else {
				return
			}
			self?.insertUserRecord(id: userId)
		}
	}
	
	private func insertUserRecord(id: String) {
		let newUser = User(
			id: id,
			name: name,
			email: email,
			joined: Date().timeIntervalSince1970
		)
		
		let db = Firestore.firestore()
		db
			.collection("users")
			.document(id)
			.setData(newUser.asDictionary())
	}
	
	private func validate() -> Bool{
		guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
					!email.trimmingCharacters(in: .whitespaces).isEmpty,
					!password.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "You should fill all the fields"
			return false
		}
		
		guard email.contains("@") && email.contains(".") else {
			errorMessage = "You should enter a valid email"
			return false
		}
		
		guard password.count >= 6 else {
			errorMessage = "Password should be longer than 6 characters"
			return false
		}
		
		errorMessage = ""
		return true
	}
}
