//
//  RegisterView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct RegisterView: View {
	@StateObject var viewModel = RegisterViewViewModel()
	
	var body: some View {
		VStack {
			HeaderView(
				title: "Register",
				subtitle: "Start organizing todos",
				rotationAngle: -15,
				backgroundColor: .orange
			)
			Form {
				TextField("Full name", text: $viewModel.name)
					.padding(.vertical, 10)
					.font(.system(size: 20))
					.autocorrectionDisabled()
				
				TextField("Email address", text: $viewModel.email)
					.padding(.vertical, 10)
					.font(.system(size: 20))
					.autocapitalization(.none)
					.autocorrectionDisabled()
				
				SecureField("Password", text: $viewModel.password)
					.padding(.vertical, 10)
					.font(.system(size: 20))
				
				TLButton(title: "Create account", background: .green) {
					viewModel.register()
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
