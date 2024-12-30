//
//  TabBarView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
		TabView {
			ExploreView()
				.tabItem {
					Label("Explore", systemImage: "eyes")
				}
			ChatsView()
				.tabItem {
					Label("Chats", systemImage: "bubble.left.and.bubble.right.fill")
				}
			ProfileView()
				.tabItem {
					Label("Profile", systemImage: "person.circle")
				}
		}
    }
}

#Preview {
    TabBarView()
}
