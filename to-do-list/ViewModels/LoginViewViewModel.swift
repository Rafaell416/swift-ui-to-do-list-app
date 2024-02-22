//
//  LoginViewViewModel.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
	@Published var email: String = ""
	@Published var password: String = ""
	@Published var errorMessage: String = ""
	
	init() {
		
	}
	
	private func validate () -> Bool {
		guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
					!password.trimmingCharacters(in: .whitespaces).isEmpty else {
			errorMessage = "You should fill in all fields"
			return false
		}
		
		guard email.contains("@") && email.contains(".") else {
			errorMessage = "You should enter a valid email"
			return false
		}
		errorMessage = ""
		return true
	}
	
	func login() {
		guard validate() else {
			return
		}
		Auth.auth().signIn(withEmail: email, password: password)		
	}
}
