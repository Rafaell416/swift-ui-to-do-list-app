//
//  RegisterView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
			VStack {
				HeaderView(title: "Register", subtitle: "Start organizing todos", rotationAngle: -15, backgroundColor: .orange)
				Spacer()
			}
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
