//
//  RegisterView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct RegisterView: View {
	@State var name: String = ""
	@State var email: String = ""
	@State var password: String = ""
	
	var body: some View {
		VStack {
			HeaderView(
				title: "Register",
				subtitle: "Start organizing todos",
				rotationAngle: -15,
				backgroundColor: .orange
			)
			Form {
				TextField("Full name", text: $name)
					.padding(.vertical, 10)
					.font(.system(size: 20))
					.autocorrectionDisabled()
				
				TextField("Email address", text: $email)
					.padding(.vertical, 10)
					.font(.system(size: 20))
					.autocapitalization(.none)
					.autocorrectionDisabled()
				
				SecureField("Password", text: $password)
					.padding(.vertical, 10)
					.font(.system(size: 20))
				
				TLButton(title: "Create account", background: .green) {
					print("Register")
				}
				.padding(.vertical, 10)
			}
			.offset(y: -50)
			Spacer()
		}
		.background(Color("LightGrayBackground"))
	}
}

struct RegisterView_Previews: PreviewProvider {
	static var previews: some View {
		RegisterView()
	}
}
