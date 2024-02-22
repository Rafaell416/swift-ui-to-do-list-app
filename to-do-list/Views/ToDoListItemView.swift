//
//  ToDoListItemView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 17/01/24.
//

import SwiftUI

struct ToDoListItemView: View {
	@StateObject var viewModel = TodoListItemViewViewModel()
	let item: ToDoListItem
	var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(item.title)
					.font(.title)
				Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated,time: .shortened))")
					.font(.footnote)
					.foregroundColor(Color(.secondaryLabel))
			}
			Spacer()
			
			Button {
				viewModel.toggle(itemId: item.id)
			} label: {
				Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
			}
		}
	}
}

struct ToDoListItemView_Previews: PreviewProvider {
	static var previews: some View {
		ToDoListItemView(item: .init(id: "1", title: "Example", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
	}
}
