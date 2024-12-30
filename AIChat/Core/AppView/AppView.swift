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
				ZStack {
					Color.green
						.ignoresSafeArea()
					Text("Tabbar")
				}
			},
			onboardingView: {
				ZStack {
					Color.blue
						.ignoresSafeArea()

					Text("Onboarding")
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
