//
//  HeaderView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 18/01/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
			ZStack {
				RoundedRectangle(cornerRadius: 0)
					.foregroundColor(.pink)
					.rotationEffect(Angle(degrees: 15))
				
				VStack {
					Text("To Do List")
						.font(.system(size: 50))
						.foregroundColor(.white)
						.bold()
					
					Text("Get Things Done")
						.font(.system(size: 30))
						.foregroundColor(.white)
				}
				.padding(.top, 50)
			}
			.frame(
				width: UIScreen.main.bounds.width * 3,
				height: 300
			)
			.offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
