//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnboardingView: View>: View {

	var showTabBar: Bool = false

	@ViewBuilder var tabBarView: TabBarView
	@ViewBuilder var onboardingView: OnboardingView

	var body: some View {
		ZStack {
			if showTabBar {
				ZStack {
					Color.green
						.ignoresSafeArea()

					tabBarView
				}
				.transition(.move(edge: .trailing))
			} else {
				ZStack {
					Color.blue
						.ignoresSafeArea()

					onboardingView
				}
				.transition(.move(edge: .leading))

			}
		}
		.animation(.smooth, value: showTabBar)
	}
}

private struct AppViewPreview: View {
	@State private var showTabBar: Bool = false

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
		.onTapGesture {
			showTabBar.toggle()
		}

	}
}

#Preview {
	AppViewPreview()
}
