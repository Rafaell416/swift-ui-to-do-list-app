//
//  ProfileView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct ProfileView: View {
	@StateObject var viewModel = ProfileViewViewModel()
		
    var body: some View {
			NavigationView {
				if let user = viewModel.user {
					VStack {
						Image(systemName: "person.circle")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.foregroundColor(.blue)
							.frame(width: 125, height: 125)
						
						VStack(alignment: .leading) {
							Text("Name: \(user.name)").padding(.bottom)
							Text("Email: \(user.email)").padding(.bottom)
							TLButton(title: "Logout", background: .red) {
								viewModel.logout()
							}.padding(.vertical)
						}.padding()
					}
					.navigationTitle("Profile")
				} else {
					Text("Loading profile...")
				}
			}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
