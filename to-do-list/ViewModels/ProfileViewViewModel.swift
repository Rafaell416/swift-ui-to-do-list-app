//
//  ProfileViewViewModel.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
	@Published var user: User? = nil
	
	private let firebaseAuth = Auth.auth()
	private let db = Firestore.firestore()
	
	init() {
		fetchUser()
	}
	
	private func fetchUser() {
		guard let userId = firebaseAuth.currentUser?.uid else {
			return
		}
		
		db
			.collection("users")
			.document(userId).getDocument { [weak self] snapshot, error in
				guard let data = snapshot?.data(), error == nil else {
					return
				}
				DispatchQueue.main.async {
					self?.user = User(
						id: data["id"] as? String ?? "",
						name: data["name"] as? String ?? "",
						email: data["email"] as? String ?? "",
						joined: data["joined"] as? TimeInterval ?? 0
					)
				}
			}
	}
	
	func logout() {
		do {
			try firebaseAuth.signOut()
		} catch let signoutError as NSError{
			print("Error signing out", signoutError)
		}
	}
}
