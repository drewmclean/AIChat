//
//  AppView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct AppView: View {

	@State var appState: AppState = .init()

	var body: some View {
		AppViewBuilder(
			showTabBar: appState.showTabBar,
			tabBarView: {
				TabBarView()
			},
			onboardingView: {
				ZStack {
					Color.blue
						.ignoresSafeArea()

					WelcomeView()
				}
			}
		)
		.environment(appState)
	}
}

#Preview {
	AppView(appState: .init(showTabBar: true))
}

#Preview {
	AppView(appState: .init(showTabBar: false))
}
