//
//  AppView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct AppView: View {

	@AppStorage("showTabBarView") var showTabBar: Bool = false 

	var body: some View {
		AppViewBuilder(
			showTabBar: showTabBar,
			tabBarView: {
				TabBarView()
			},
			onboardingView: {
				ZStack {
					Color.blue
						.ignoresSafeArea()

					WelcomeView()Ω
				}
			}
		)
	}
}

#Preview {
	AppView(showTabBar: false)
}

#Preview {
	AppView(showTabBar: true)
}
