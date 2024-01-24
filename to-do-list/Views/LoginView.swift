//
//  LoginView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct LoginView: View {
	@StateObject var viewModel = LoginViewViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				HeaderView(
					title: "To Do List",
					subtitle: "Get things done",
					rotationAngle: 15,
					backgroundColor: .pink
				)
				
				Form {
					TextField("Email Address", text: $viewModel.email)
						.padding(.vertical, 10)
						.font(.system(size: 20))
						.autocorrectionDisabled()
						.autocapitalization(.none)
					
					SecureField("Password", text: $viewModel.password)
						.padding(.vertical, 10)
						.font(.system(size: 20))
					
					if !viewModel.errorMessage.isEmpty {
						Text(viewModel.errorMessage).foregroundColor(.red)
					}
					
					TLButton(title: "Log in", background: .blue) {
						viewModel.login()
					}
					.padding(.vertical, 10)
					
				}
				.offset(y: -50)
				
				VStack {
					Text("New around here?")
					NavigationLink("Create an account", destination: RegisterView())
				}
				.padding(.bottom, 50)
			}
			.background(Color("LightGrayBackground"))
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
