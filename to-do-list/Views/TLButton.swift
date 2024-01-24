//
//  TLButton.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 22/01/24.
//

import SwiftUI

struct TLButton: View {
	var title: String
	var background: Color
	var action: () -> Void
	
	var body: some View {
		Button {
			action()
		} label: {
			ZStack {
				RoundedRectangle(cornerRadius: 15)
					.foregroundColor(background)
					.frame(height: 45)
				
				Text(title)
					.bold()
					.foregroundColor(.white)
					.font(.system(.title2))
			}
		}
	}
}

struct TLButton_Previews: PreviewProvider {
	static var previews: some View {
		TLButton(title: "Log in Button", background: .green) {
			print("hello")
		}
	}
}
