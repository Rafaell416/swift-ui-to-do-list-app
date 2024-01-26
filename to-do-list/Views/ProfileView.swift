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
				VStack {
					Text("Profile")
				}
				.navigationTitle("Profile")
			}
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
