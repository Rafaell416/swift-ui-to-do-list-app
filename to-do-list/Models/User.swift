//
//  User.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import Foundation

struct User: Codable {
	let id: String
	let name: String
	let email: String
	let joined: TimeInterval
}
