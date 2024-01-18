//
//  LoginView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct LoginView: View {
	@State var email: String = ""
	@State var password: String = ""
	
	var body: some View {
		NavigationView {
			VStack {
				HeaderView()
				
				Form {
					TextField("Email Address", text: $email)
						.padding(.vertical, 10)
						.font(.system(size: 20))
					
					SecureField("Password", text: $password)
						.padding(.vertical, 10)
						.font(.system(size: 20))
					
					Button {
						print("Hello")
						
					} label: {
						ZStack {
							RoundedRectangle(cornerRadius: 15)
								.foregroundColor(.blue)
								.frame(height: 45)
							
							Text("Log In")
								.bold()
								.foregroundColor(.white)
								.font(.system(.title2))
						}
					}
					.padding(.vertical, 20)
				}
				
				VStack {
					Text("New around here?")
					NavigationLink("Create an account", destination: RegisterView())
				}
				.padding(.bottom, 50)
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
