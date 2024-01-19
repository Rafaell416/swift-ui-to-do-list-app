//
//  HeaderView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 18/01/24.
//

import SwiftUI

struct HeaderView: View {
	let title: String;
	let subtitle: String;
	let rotationAngle: Double;
	let backgroundColor: Color;
	
    var body: some View {
			ZStack {
				RoundedRectangle(cornerRadius: 0)
					.foregroundColor(backgroundColor)
					.rotationEffect(Angle(degrees: rotationAngle))
				
				VStack {
					Text(title)
						.font(.system(size: 50))
						.foregroundColor(.white)
						.bold()
					
					Text(subtitle)
						.font(.system(size: 30))
						.foregroundColor(.white)
				}
				.padding(.top, 90)
			}
			.frame(
				width: UIScreen.main.bounds.width * 3,
				height: 350
			)
			.offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
			HeaderView(title: "Title", subtitle: "Subtitle", rotationAngle: 15, backgroundColor: .blue)
    }
}
