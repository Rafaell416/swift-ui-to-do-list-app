//
//  ContentView.swift
//  to-do-list
//
//  Created by Rafael Villarreal on 16/01/24.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel = MainViewViewModel()
		
	var body: some View {
		if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
			ToDoListView()
		} else {
			LoginView()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
