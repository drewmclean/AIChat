//
//  SettingsV iew.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct SettingsView: View {
	@Environment(\.dismiss) var dismiss
	@Environment(AppState.self) var appState

    var body: some View {
		NavigationStack {
			List {
				Button {
					signOutTapped()
				} label: {
					Text("Sign Out")
				}
			}
			.navigationTitle("Settings")
		}
    }

	private func signOutTapped() {
		dismiss()
		Task {
			try? await Task.sleep(for: .seconds(1))
			appState.updateViewState(showTabBar: false)
		}
	}
}

#Preview {
	SettingsView()
		.environment(AppState())
}
