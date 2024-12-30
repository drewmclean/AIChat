//
//  AppViewBuilder.swift
//  AIChat
//
//  Created by Andrew McLean on 12/30/24.
//

import SwiftUI

struct AppViewBuilder<TabBarView: View, OnboardingView: View>: View {

	var showTabbar: Bool = false

	@ViewBuilder var tabBarView: TabBarView
	@ViewBuilder var onboardingView: OnboardingView

	var body: some View {
		ZStack {
			if showTabbar {
				ZStack {
					Color.green
						.ignoresSafeArea()

					onboardingView
				}
				.transition(.move(edge: .trailing))
			} else {
				ZStack {
					Color.blue
						.ignoresSafeArea()

					tabBarView
				}
				.transition(.move(edge: .leading))

			}
		}
		.animation(.smooth, value: showTabbar)
	}
}

private struct AppViewPreview: View {
	@State private var showTabBar: Bool = false

	var body: some View {
		AppViewBuilder(
			showTabbar: showTabBar,
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
