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
			AccountView
		} else {
			LoginView()
		}
	}
	
	@ViewBuilder
	var AccountView: some View {
		TabView {
			ToDoListView(userId: viewModel.currentUserId)
				.tabItem {
					Label("Home", systemImage: "house")
			}

			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person.circle")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainView()
	}
}
