//
//  AppView.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct AppView: View {

	@AppStorage("showTabbarView") var showTabbar: Bool = false

	var body: some View {
		AppViewBuilder(
			showTabbar: showTabbar,
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
	AppView(showTabbar: false)
}

#Preview {
	AppView(showTabbar: true)
}
