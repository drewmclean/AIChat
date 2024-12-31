//
//  ProfileView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct ProfileView: View {

	@State private var showSettingsView: Bool = false

    var body: some View {
		NavigationStack {
			Text("Profile")
				.navigationTitle("Profile")
				.toolbar {
					ToolbarItem(placement: .topBarTrailing) {
						settingsButton
					}
				}
		}
		.sheet(isPresented: $showSettingsView) {
			SettingsView()
		}
    }

	private var settingsButton: some View {
		Button {
			onSettingsButtonTap()
		} label: {
			Image(systemName: "gear")
				.font(.headline)
		}
	}

	private func onSettingsButtonTap() {
		showSettingsView = true
	}

}

#Preview {
    ProfileView()
}
